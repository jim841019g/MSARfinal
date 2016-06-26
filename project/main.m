function main(instrument,record)
insname = ['sample_all/',instrument,'/',instrument,'_samp.wav'];
recname = ['song_record/',record];
[y,fs] = audioread(insname);
[y1,fs1] = audioread(recname);
[pitch,volume] = myPt(y1,fs1,myPtOptSet);
pitch = ptmodify(pitch);
wave = ptbackwave(y,fs,pitch,volume,128);
sound(wave,fs);