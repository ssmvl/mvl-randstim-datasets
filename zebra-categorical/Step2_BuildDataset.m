clear;

Vars_ZebraStim;

imgPoolDir  = 'imgs-pool';
datasetDir  = 'imgs-dataset';
stimCompFile = 'stimulus-components.mat';


%%
%  Set random seed
%    With this random seed, you will end up with the same set of images under
%    the dataset directory. If you want a new combination of images for the
%    dataset, please use any random seed of your choice, or uncomment
%    "rng('shuffle');" below.
%
rngSeed = typecast(uint8('72@M'), 'uint32');
rng(rngSeed, 'twister');
%rng('shuffle');



%%
%  K-means clustering
%
load(stimCompFile);
imgVecs = cell2mat(cellfun(@(c) [real(c), imag(c)], stimCompInfo(:, 2), 'UniformOutput', false));

fprintf('clustering stimulus images:');
imgsPerCluster = zeros(1, dataset.subsets);
while any(imgsPerCluster < dataset.clstrMinImgs) || any(imgsPerCluster > dataset.clstrMaxImgs)
	[cidx, ~, ~, cdist] = kmeans(imgVecs, dataset.subsets);
	imgsPerCluster = histcounts(cidx);
	fprintf('\n - images per cluster: ');
	fprintf('%d, ', imgsPerCluster(1:(end - 1)));
	fprintf('%d ...', imgsPerCluster(end));
end
fprintf(' cluster okay.\n');



%%
%  Copy selected stimulus images to the dataset directory
%
if ~exist(datasetDir, 'dir')
	mkdir(datasetDir);
end

fprintf('copying selected images to %s%s ...', datasetDir, filesep);
for i = 1:dataset.subsets
	subsetStr = char('A' - 1 + i);
	sdist = cdist(:, i);
	sdist(cidx ~= i) = Inf;
	[~, sidx] = sort(sdist);
	sidx = sidx(1:sum(cidx == i));
	for j = 1:dataset.imgsPerSubset
		copyfile( ...
			fullfile(imgPoolDir, stimCompInfo{sidx(j), 1}), ...
			fullfile(datasetDir, sprintf('stim_%s-%03d.png', subsetStr, j)));
	end
end
fprintf(' done.\n');



%%
%  All done, wrapping up
%
fprintf('all done, please check %s%s\n\n', datasetDir, filesep);
