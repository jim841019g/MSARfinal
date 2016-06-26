function piano(name)
    %p = [pwd,'\',name];
    [y,fs] = audioread(name);
    sound(y,fs);
end
