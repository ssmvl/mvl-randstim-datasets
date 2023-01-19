function fftmat = zebraComp(tpl)
	blobmat = conv_logistic(mapt_radial(tpl.imSize), -tpl.blobK, tpl.blobSize / 2);
	srcmat = (rand(tpl.imSize) * 2 - 1) .* blobmat;
	
	sfFilt = conv_gaussian(map_radial(tpl.imSize), tpl.stdSF, tpl.meanSF);
	sfFilt(floor(tpl.imSize / 2) + 1, floor(tpl.imSize / 2) + 1) = 0;
	fftmat = fftshift(fft2(srcmat)) .* sfFilt;
end