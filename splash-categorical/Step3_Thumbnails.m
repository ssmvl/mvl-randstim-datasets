clear;

Vars_SplashStim;

datasetDir = 'imgs-dataset';
thumbnailsImg = 'thumbnails.png';

%%
%  Check datasets
%    This step is for generating a thumbnails image, and is not required
%    for generating the dataset. This script works only for the dataset
%    containing 6 subsets of 25 images each.
%
if (dataset.subsets ~= 6) || (dataset.imgsPerSubset ~= 25)
	warning(['This step is for generating a thumbnails image, and is not required ' ...
		'for generating the dataset. This script works only for the dataset ' ...
		'containing 6 subsets of 25 images each']);
	return;
end
if ~exist(fullfile(datasetDir, 'stim_F-025.png'), 'file')
	warning(['Please run Step1 and Step2 scripts first, and make sure that ' ...
		'stimulus images exist under the %s%s directory'], datasetDir, filesep);
	return;
end



%%
%  Generate tumbnails image
%
imH = (5 * 2 + 0.5) * stimTpl.imSize;
imW = (5 * 3 + 1.0) * stimTpl.imSize;
timg = uint8(zeros(imH, imW));

fprintf('generating thumbnails image ...');
for i = 1:dataset.subsets
	setR = ceil(i / 3) - 1;
	setC = i - (setR * 3) - 1;
	subsetStr = char('A' - 1 + i);

	for j = 1:dataset.imgsPerSubset
		imgR = ceil(j / 5) - 1;
		imgC = j - (imgR * 5) - 1;
		idxR = (setR * 5.5 + imgR) * stimTpl.imSize + (1:stimTpl.imSize);
		idxC = (setC * 5.5 + imgC) * stimTpl.imSize + (1:stimTpl.imSize);

		imgFile = sprintf('stim_%s-%03d.png', subsetStr, j);
		[~, ~, img] = imread(fullfile(datasetDir, imgFile));
		timg(idxR, idxC) = img;
	end
end
timg = imresize(timg, 800 / imW);
imwrite(uint8(zeros([size(timg), 3])), thumbnailsImg, 'Alpha', timg);
fprintf(' done.\n');
