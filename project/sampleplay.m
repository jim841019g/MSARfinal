function sampleplay(instrument)

    dir = ['sample_all/',instrument,+'/'];
    [y,fs] = audioread([dir,'C.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'D.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'E.wav']);
    sound(y,fs);
    
    pause(0.4);

    [y,fs] = audioread([dir,'F.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'G.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'A.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'B.wav']);
    sound(y,fs);
    
    pause(0.4);
    
    [y,fs] = audioread([dir,'C_upper.wav']);
    sound(y,fs);

end

