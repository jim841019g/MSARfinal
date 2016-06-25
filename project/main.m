[y,fs] = audioread('Gsample.wav');
[y1,fs1] = audioread('bee_test.wav');
pitch = myPt(y1,fs1,myPtOptSet);
pitch = ptmodify(pitch);
wave = ptbackwave(y,fs,pitch,128);
sound(wave,fs);