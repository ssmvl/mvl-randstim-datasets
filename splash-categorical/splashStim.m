function [I, imgComp] = splashStim(tpl)
	lenFp = length(tpl.radialFilt);
	idxFp = (1:lenFp) + 1;
	ampFp = rand(1, lenFp) .* tpl.radialFilt;
	phaseFp = (rand(1, lenFp) * 2 - 1) * pi;

	midFw = floor(tpl.radialRes / 2) + 1;
	ampFw = zeros(1, tpl.radialRes);
	ampFw(midFw + idxFp) = ampFp;
	ampFw(midFw - idxFp) = ampFp;
	phaseFw = zeros(1, tpl.radialRes);
	phaseFw(midFw + idxFp) =  phaseFp;
	phaseFw(midFw - idxFp) = -phaseFp;

	fftmat = ampFw .* exp(phaseFw * 1i);
	shapeR = real(ifft(ifftshift((fftmat))));
	shapeR = (shapeR - mean(shapeR)) / std(shapeR) * tpl.contourSD + tpl.contourR;
	shapeT = linspace(0, 2 * pi, tpl.radialRes + 1);
	[shapeX, shapeY] = pol2cart(shapeT, shapeR([1:end, 1]) + 1);

	hfig = figure('Color', [0 0 0]);
	imshow(zeros(tpl.imSize));
	patch(shapeX + (tpl.imSize / 2), shapeY + (tpl.imSize / 2), [1 1 1], 'LineStyle', 'none');
	I = rgb2gray(im2double(getframe(hfig.Children(1)).cdata));
	imgComp = fftmat(ampFw > 0);
	close(hfig);
end