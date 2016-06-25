function output = note2wave01(pitch, duration, fs);
count = 0;
% use phase variable to avoid intense phase change
phase = 0;
for i = 1 : length(pitch)
	ff = 2^((pitch(i) - 69) / 12) * 440;
	if pitch(i) == 0
		ff = 0;
	end;
	for j = 1 : (duration(i) * fs - 50)
		count = count + 1;
		phase = phase + 2 * pi * ff / fs;
		output(count) = sin(phase);
	end;
	% make tempo more explicit
	for j = 1 : 50
		count = count + 1;
		output(count) = sin(phase);
	end;
end;
