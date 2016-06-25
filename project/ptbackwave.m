function wave = ptbackwave(y,fs,pitch,frameDuration);

wave = [];
framelength = round(fs*frameDuration/1000);
%oldpitch = findpitch(y,fs);
oldpitch = 55;
for i = 1:length(pitch)
    temp =  turnpitch2wave(y,pitch(i),oldpitch,framelength);
    wave = [wave,temp];
end