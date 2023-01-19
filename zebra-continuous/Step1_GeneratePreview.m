clear;
addpath(fullfile('..', 'lib'));

Vars_ZebraStim;

previewFile  = 'preview-planar-dim.png';
stimCompFile = 'stimulus-components.mat';

%%
%  Set random seed
%    This random seed will generate the same set of images in the dataset
%    directory. If you want to generate a new set of images, please use any
%    random seed of your choice, or uncomment "rng('shuffle');" below.
%
rngSeed = typecast(uint8('0Y#r'), 'uint32');
rng(rngSeed, 'twister');
%rng('shuffle');



%%
%  Prepare independent dimensions
%
fprintf('preparing dimensions...');
lenFw = stimTpl.imSize;
midFw = floor(lenFw / 2) + 1;
rndFp1 = rand(midFw - 1, midFw * 2 - 1);
rndFp2 = rand(1, midFw);
rndFp2 = cat(2, rndFp2, rndFp2((end - 1):-1:1));
rndFw = cat(1, rndFp1, rndFp2, rndFp1(end:-1:1, end:-1:1));
rndFw = rndFw(1:lenFw, 1:lenFw);

wDim1 = double(rndFw < 0.5);
wDim1(midFw, midFw) = 0.5;
wDim2 = double(rndFw >= 0.5);
wDim2(midFw, midFw) = 0.5;

compA = zebraComp(stimTpl);
compB = zebraComp(stimTpl);
compAt = @(d1, d2) compA .* (wDim1 * d1 + wDim2 * d2) + ...
	compB .* (wDim1 * (1 - d1) + wDim2 * (1- d2));
zebraStim = @(d1, d2) zebraImg(compAt(d1, d2), stimTpl);
save(stimCompFile, 'wDim1', 'wDim2', 'compA', 'compB', ...
	'compAt', 'zebraStim', 'stimTpl');
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
		pimg(idxR, idxC) = zebraStim(d1, d2);
	end
end
pimg = imresize(pimg, preview.imSize / imW);
imwrite(repmat(pimg, [1 1 3]), previewFile);
fprintf(' done.\n');



%%
%  Wrapping up
%
fprintf('all set, please proceed to Step2_BuildDataset\n\n');
