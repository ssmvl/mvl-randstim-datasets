function [I, A] = zebraImg(fftmat, tpl)
	sffmat = real(ifft2(ifftshift(fftmat)));

	blobmat = conv_logistic(mapt_radial(tpl.imSize), -tpl.blobK, tpl.blobSize / 2);
	satmat = (sffmat + 0.5) .* blobmat;
	satmatB = conv_logistic(satmat, tpl.saturK, 0.5);
	satmatW = conv_logistic(satmat + (1 - blobmat), tpl.saturK, 0.5);

	windowmat = conv_logistic(mapt_radial(tpl.imSize), -tpl.windowK, tpl.blobSize / 2);
	I = (((satmatB + satmatW) / 2) .* windowmat) + ((1 - windowmat) * 0.5);
	A = double((I ~= 0.5) & (windowmat > 0.5));
end