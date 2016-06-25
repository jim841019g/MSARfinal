function wave = turnpitch2wave(y,newpitch,oldpitch,len);

x = 1:length(y);
ratio=2^((oldpitch-newpitch)/12);
m=round(length(y)*ratio);
x2=linspace(1, length(y), m);
wave=interp1(x, y, x2);
wave = wave(1:len);