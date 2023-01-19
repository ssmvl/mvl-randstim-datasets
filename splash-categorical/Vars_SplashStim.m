% dataset properties
dataset.imgsTotal = 900;
dataset.imgsPerSubset = 25;
dataset.subsets = 6;
dataset.clstrMinImgs = 80;
dataset.clstrMaxImgs = 250;

% image size
stimTpl.imSize = 500;

% shape properties
stimTpl.radialRes  = 360;  % points per revolution
stimTpl.radialFilt = [0.5 1 1 1 1];  % amplitudes at 2, 3, 4, ... cycles/deg

% shape radius and contour SD
stimTpl.contourR  = 150;
stimTpl.contourSD = 30;
