function samplerecord(instrument)

recObj = audiorecorder(44100,16,1);
disp('Start recording.');
recordblocking(recObj,5);
disp('End recording.');
y = getaudiodata(recObj);
audiowrite([instrument,'.wav'],y,44100);
getsample(instrument);
