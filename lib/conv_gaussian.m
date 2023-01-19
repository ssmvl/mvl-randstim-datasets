function N = conv_gaussian(M, sd, x0)
	if ~exist('x0', 'var') || isempty(x0)
		x0 = 0;
	end

	N = exp(-.5 * ((M - x0) ./ sd) .^ 2);
end