function [I, A, imgComp] = zebraStim(tpl)
	blobmat = conv_logistic(mapt_radial(tpl.imSize), -tpl.blobK, tpl.blobSize / 2);
	sfFilt = conv_gaussian(map_radial(tpl.imSize), tpl.stdSF, tpl.meanSF);
	sfFilt(floor(tpl.imSize / 2) + 1, floor(tpl.imSize / 2) + 1) = 0;

	chunkMin = zeros(16, 1);
	while any(chunkMin < tpl.chunkMin)
		srcmat = (rand(tpl.imSize) * 2 - 1) .* blobmat;

		fftmat = fftshift(fft2(srcmat)) .* sfFilt;
		sffmat = real(ifft2(ifftshift(fftmat)));

		satmat = (sffmat + 0.5) .* blobmat;
		satmatB = conv_logistic(satmat, tpl.saturK, 0.5);
		satmatW = conv_logistic(satmat + (1 - blobmat), tpl.saturK, 0.5);

		for i = 1:8
			chunks = bwconncomp(satmatB > ((i * 2 - 1) / 16));
			chunkMin(i) = min(cellfun(@length, chunks.PixelIdxList));
		end
		for i = 1:8
			chunks = bwconncomp(satmatW < ((i * 2 - 1) / 16));
			chunkMin(8 + i) = min(cellfun(@length, chunks.PixelIdxList));
		end
	end

	windowmat = conv_logistic(mapt_radial(tpl.imSize), -tpl.windowK, tpl.blobSize / 2);
	I = (((satmatB + satmatW) / 2) .* windowmat) + ((1 - windowmat) * 0.5);
	A = double((I ~= 0.5) & (windowmat > 0.5));
	imgComp = fftmat(sfFilt > 0)';
end