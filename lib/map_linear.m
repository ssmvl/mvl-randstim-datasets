function [X, Y] = map_linear(rows, cols, theta)
	if ~exist('cols', 'var') || isempty(cols)
		cols = rows;
	end
	if ~exist('theta', 'var') || isempty(theta)
		theta = 0;
	end

	[mx, my] = meshgrid( ...
		round(cols / 2) - (cols:-1:1), ...
		round(rows / 2) - (rows:-1:1));
	if mod(theta, 360) == 0
		X = mx;
		Y = my;
	else
		X = mx * cosd(theta) + my * sind(theta);
		Y = mx * cosd(theta + 90) + my * sind(theta + 90);
	end
end