clear;

Vars_SplashStim;

load('stimulus-components.mat');

datasetDir  = 'imgs-dataset';
datasetDirs = {
	fullfile(datasetDir, 'linear-dim1')
	fullfile(datasetDir, 'linear-dim2')
	fullfile(datasetDir, 'circular')
	fullfile(datasetDir, 'planar')
	};

%%
%  Build dataset: linear dimension 1
%
if ~exist(datasetDir, 'dir')
	mkdir(datasetDir);
end
if ~exist(datasetDirs{1}, 'dir')
	mkdir(datasetDirs{1});
end

fprintf('generating stimulus images under %s%s ...', datasetDirs{1}, filesep);
colormat = zeros(stimTpl.imSize, stimTpl.imSize, 3);
for i = 0:dataset.linearDimSteps
	d1 = i / dataset.linearDimSteps;
	imgFile = sprintf('stim_dim1-%03d.png', i);
	imwrite(colormat, fullfile(datasetDirs{1}, imgFile), ...
		'Alpha', splashStim(d1, 0.5));
end
fprintf(' done.\n');



%%
%  Build dataset: linear dimension 2
%
if ~exist(datasetDirs{2}, 'dir')
	mkdir(datasetDirs{2});
end

fprintf('generating stimulus images under %s%s ...', datasetDirs{2}, filesep);
for i = 0:dataset.linearDimSteps
	d2 = i / dataset.linearDimSteps;
	imgFile = sprintf('stim_dim2-%03d.png', i);
	imwrite(colormat, fullfile(datasetDirs{2}, imgFile), ...
		'Alpha', splashStim(0.5, d2));
end
fprintf(' done.\n');



%%
%  Build dataset: circular dimension
%
if ~exist(datasetDirs{3}, 'dir')
	mkdir(datasetDirs{3});
end

fprintf('generating stimulus images under %s%s ...', datasetDirs{3}, filesep);
for i = 0:(dataset.circularDimSteps - 1)
	t = i / dataset.circularDimSteps * 2 * pi;
	[d1, d2] = pol2cart(t, 0.5);
	imgFile = sprintf('stim_circular-%03d.png', i);
	imwrite(colormat, fullfile(datasetDirs{3}, imgFile), ...
		'Alpha', splashStim(d1, d2));
end
fprintf(' done.\n');



%%
%  Build dataset: planar dimension
%
if ~exist(datasetDirs{4}, 'dir')
	mkdir(datasetDirs{4});
end

fprintf('generating stimulus images under %s%s ...', datasetDirs{4}, filesep);
for i = 0:dataset.planarDimSteps
	d1 = i / dataset.planarDimSteps;
	for j = 0:dataset.planarDimSteps
		d2 = j / dataset.planarDimSteps;
		imgFile = sprintf('stim_planar-%03d-%03d.png', i, j);
		imwrite(colormat, fullfile(datasetDirs{4}, imgFile), ...
			'Alpha', splashStim(d1, d2));
	end
end
fprintf(' done.\n');



%%
%  All done, wrapping up
%
fprintf('all done, please check %s%s\n\n', datasetDir, filesep);
