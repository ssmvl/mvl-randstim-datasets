clear;
addpath(fullfile('..', 'lib'));

Vars_ZebraStim;

imgPoolDir = 'imgs-pool';
stimCompFile = 'stimulus-components.mat';

%%
%  Set random seed
%    This random seed will generate the same set of images in the pool
%    directory. If you want to generate a new set of images, please use any
%    random seed of your choice, or uncomment "rng('shuffle');" below.
%
rngSeed = typecast(uint8('t%36'), 'uint32');
rng(rngSeed, 'twister');
%rng('shuffle');



%%
%  Generate stimulus images
%
if ~exist(imgPoolDir, 'dir')
	mkdir(imgPoolDir);
end

fprintf('generating stimulus images under %s%s ...', imgPoolDir, filesep);
stimCompInfo = cell(dataset.imgsTotal, 2);
for i = 1:dataset.imgsTotal
	[I, A, fftLoc] = zebraStim(stimTpl);
	imgFile = sprintf('stim_%04d.png', i);
	stimCompInfo{i, 1} = imgFile;
	stimCompInfo{i, 2} = fftLoc;
	imwrite(repmat(I, [1 1 3]), fullfile(imgPoolDir, imgFile), 'Alpha', A);
end
save(stimCompFile, 'stimCompInfo');
fprintf(' done.\n');



%%
%  Wrapping up
%
fprintf('all set, please proceed to Step2_BuildDataset\n\n');
