function piano(name)
    p = [pwd,'\',name];
    [y,fs] = audioread(p);
    sound(y,fs);
end
