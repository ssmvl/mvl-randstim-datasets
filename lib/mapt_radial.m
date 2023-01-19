function E = mapt_radial(rows, cols, theta, ratio)
	if ~exist('cols', 'var') || isempty(cols)
		cols = rows;
	end
	if ~exist('theta', 'var') || isempty(theta)
		theta = 0;
	end
	if ~exist('ratio', 'var') || isempty(ratio)
		ratio = 1;
	end

	[X, Y] = mapt_linear(rows, cols, theta);
	E = hypot(X * sqrt(ratio), Y / sqrt(ratio));
end