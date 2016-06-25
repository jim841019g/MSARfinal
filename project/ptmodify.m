%modify pitch to proper semitone
function pitch = ptmodify(pitch);

for i = 2:length(pitch)-1
    if abs(pitch(i+1)-pitch(i))>1 & abs(pitch(i-1)-pitch(i))>1 & pitch(i)~=0
        pitch(i) = round(pitch(i+1));
    end
end