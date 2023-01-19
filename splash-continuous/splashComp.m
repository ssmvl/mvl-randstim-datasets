function fftmat = splashComp(tpl)
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
end