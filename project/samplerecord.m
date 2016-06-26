function samplerecord(instrument)

recObj = audiorecorder(44100,16,1);
disp('Start recording.');
recordblocking(recObj,3);
disp('End recording.');
y = getaudiodata(recObj);
audiowrite(['sample/',instrument,'.wav'],y,44100);
getsample(instrument);
