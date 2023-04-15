% dataset properties
dataset.linearDimSteps   = 100;
dataset.circularDimSteps = 180;
dataset.planarDimSteps   = 40;

% preview image properties
preview.steps  = 9;
preview.imSize = 720;

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

% patch window background
stimTpl.windowK  = 1;
