function pitch = findpitch(y,fs);

pitch = myPt(y,fs);
pitch = mean(pitch);
pitch = round(pitch);

end