% dataset properties
dataset.linearDimSteps   = 50;
dataset.circularDimSteps = 90;
dataset.planarDimSteps   = 20;

% preview image properties
preview.steps  = 9;
preview.imSize = 720;

% image size
stimTpl.imSize = 500;

% shape properties
stimTpl.radialRes  = 360;  % points per revolution
stimTpl.radialFilt = [0.5 1 1 1 1];  % amplitudes at 2, 3, 4, ... cycles/deg

% shape radius and contour SD
stimTpl.contourR  = 150;
stimTpl.contourSD = 30;
