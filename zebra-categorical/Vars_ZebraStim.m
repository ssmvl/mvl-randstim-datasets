% dataset properties
dataset.imgsTotal = 900;
dataset.imgsPerSubset = 25;
dataset.subsets = 6;
dataset.clstrMinImgs = 100;
dataset.clstrMaxImgs = 250;

% image size
stimTpl.imSize = 500;

% pattern properties
stimTpl.meanSF = 4;    % cycle/image
stimTpl.stdSF  = 0.5;  % cycle/image

% pattern saturation properties
stimTpl.saturK = 12000;

% patch size property
stimTpl.blobSize = 350;
stimTpl.blobK    = 0.2;
stimTpl.chunkMin = 1600;  % px^2

% property for clearing the background
stimTpl.windowK  = 1;
