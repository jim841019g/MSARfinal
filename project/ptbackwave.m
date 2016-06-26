function wave = ptbackwave(y,fs,pitch,volume,frameDuration);

wave = [];
framelength = round(fs*frameDuration/1000);
%oldpitch = findpitch(y,fs);
oldpitch = 55;
medvol = median(volume);
for i = 1:length(pitch)
  if pitch(i)~=0
    temp =  turnpitch2wave(y,pitch(i),oldpitch,framelength);
%    temp = temp*(volume(i)*1.6/medvol);
    for j = 1:fs
        if temp(1)<0 && temp(2)>0
            break;
        end
        temp(1)=[];
    end
    for j = length(temp):-1:1
        if temp(j)>0 & temp(j-1)<0
            break;
        end
        temp(j)= [];
    end
    t = 0:length(temp)-1;
    temp2 = temp .* sin(pi*t/length(temp));
    
  else
      temp(framelength)=0;
  end
  wave = [wave,temp]; 
       
end