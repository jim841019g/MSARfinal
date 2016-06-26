function soundrecord(name,duration)

recObj = audiorecorder(44100,16,1);
disp('Start recording.');
recordblocking(recObj,duration);
disp('End recording.');
y = getaudiodata(recObj);
audiowrite(['song_record/',name,'.wav'],y,44100);