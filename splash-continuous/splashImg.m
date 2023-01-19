function I = splashImg(fftmat, tpl)
	shapeR = real(ifft(ifftshift((fftmat))));
	shapeR = (shapeR - mean(shapeR)) / std(shapeR) * tpl.contourSD + tpl.contourR;
	shapeT = linspace(0, 2 * pi, tpl.radialRes + 1);
	[shapeX, shapeY] = pol2cart(shapeT, shapeR([1:end, 1]) + 1);

	hfig = figure('Color', [0 0 0]);
	imshow(zeros(tpl.imSize));
	patch(shapeX + (tpl.imSize / 2), shapeY + (tpl.imSize / 2), [1 1 1], 'LineStyle', 'none');
	I = rgb2gray(im2double(getframe(hfig.Children(1)).cdata));
	close(hfig);
end