clear;

Vars_SplashStim;

previewFile  = 'preview-planar-dim.png';
stimCompFile = 'stimulus-components.mat';

%%
%  Set random seed
%    This random seed will generate the same set of images in the dataset
%    directory. If you want to generate a new set of images, please use any
%    random seed of your choice, or uncomment "rng('shuffle');" below.
%
rngSeed = typecast(uint8('LVtD'), 'uint32');
rng(rngSeed, 'twister');
%rng('shuffle');



%%
%  Prepare independent dimensions
%
fprintf('preparing dimensions...');
compA = splashComp(stimTpl);
compB = splashComp(stimTpl);

lenFp = length(stimTpl.radialFilt);
idxFp = (1:lenFp) + 1;
midFw = floor(stimTpl.radialRes / 2) + 1;
difFp = abs(compA(midFw + idxFp) - compB(midFw + idxFp));
[~, rankDifFp] = sort(difFp, 'descend');
idxD1p = rankDifFp(mod(1:lenFp, 4) <  2);
idxD2p = rankDifFp(mod(1:lenFp, 4) >= 2);

wDim1 = zeros(1, stimTpl.radialRes);
wDim1(midFw + idxFp(idxD1p)) = 1;
wDim1(midFw - idxFp(idxD1p)) = 1;
wDim2 = zeros(1, stimTpl.radialRes);
wDim2(midFw + idxFp(idxD2p)) = 1;
wDim2(midFw - idxFp(idxD2p)) = 1;

compAt = @(d1, d2) ...
	compA .* (wDim1 * (d1 - 0.5)) + (compB .* wDim1 * 0.5) + ...
	compB .* (wDim2 * (d2 - 0.5)) + (compA .* wDim2 * 0.5);
splashStim = @(d1, d2) splashImg(compAt(d1, d2), stimTpl);
save(stimCompFile, 'wDim1', 'wDim2', 'compA', 'compB', ...
	'compAt', 'splashStim', 'stimTpl');
fprintf(' done.\n');



%%
%  Generate preview image
%
fprintf('generating preview image...');
imH = preview.steps * stimTpl.imSize;
imW = preview.steps * stimTpl.imSize;
pimg = zeros(imH, imW);

for i = 0:preview.steps
	d1 = i / preview.steps;
	for j = 0:preview.steps
		d2 = j / preview.steps;
		idxR = i * stimTpl.imSize + (1:stimTpl.imSize);
		idxC = j * stimTpl.imSize + (1:stimTpl.imSize);
		pimg(idxR, idxC) = splashStim(d1, d2);
	end
end
pimg = imresize(pimg, preview.imSize / imW);
imwrite(zeros([size(pimg), 3]), previewFile, 'Alpha', pimg);
fprintf(' done.\n');



%%
%  Wrapping up
%
fprintf('all set, please proceed to Step2_BuildDataset\n\n');
