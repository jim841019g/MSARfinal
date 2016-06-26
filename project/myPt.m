function [pitch,volume]=myPt(y,fs, ptOpt, showPlot);
% myPt: Pitch tracking from audio
%
%	Usage:
%		pitch=myPt(au, ptOpt, showPlot);
%			au: audio
%			ptOpt: options for pitch
%			showPlot: 1 for plotting, 0 for not plotting
%			pitch: computed pitch
%
%	Example:
%		waveFile='londonBridgeIsFallingDown.wav';
%		au=myAudioRead(waveFile);
%		ptOpt=myPtOptSet;
%		ptOpt.useVolThreshold=1;
%		showPlot=1;
%		myPt(au, ptOpt, showPlot);

%	Roger Jang, 20110531, 20130416

if nargin<2, selfdemo; return; end
if nargin<3, ptOpt=myPtOptSet; end
if nargin<4, showPlot=0; end

y=y-mean(y);
frameSize=round(ptOpt.frameDuration*fs/1000);
overlap=round(ptOpt.overlapDuration*fs/1000);
frameMat=enframe(y, frameSize, overlap);
frameNum=size(frameMat, 2);
pitch=zeros(frameNum, 1);
volume=zeros(frameNum, 1);

% ====== Compute volume & its threshold (�p�⭵�q & ���q���e��)
volume=frame2volume(frameMat);
volMax=max(volume);
volMin=min(volume);
ptOpt.volTh=volMin+0.1*(volMax-volMin);
% ====== Compute pitch �p�⭵���]�|�Ψ쭵�q���e�ȡ^
ptOpt.frame2pitchOpt.fs=fs;
for i=1:frameNum
	frame=frameMat(:, i);
	pitch(i)=frame2pitch(frame, ptOpt.frame2pitchOpt);
    if(volume(i)<ptOpt.volTh)
        pitch(i)=0;
    end
end
pitch0=pitch;

if ptOpt.useVolThreshold
	pitch(volume<ptOpt.volTh)=0;	% Set pitch to zero if the volume is too low
end

% ====== Plotting (�e��)
if showPlot
	frameTime=frame2sampleIndex(1:frameNum, frameSize, overlap)/fs;
	subplot(3,1,1);
	plot((1:length(y))/fs, y); set(gca, 'xlim', [-inf inf]);
	title('Waveform');
	subplot(3,1,2);
	plot(frameTime, volume, '.-'); set(gca, 'xlim', [-inf inf]);
	line([0, length(y)/fs], ptOpt.volTh*[1, 1], 'color', 'r');
	title('Volume');
	subplot(3,1,3);
	
	tPitch=nan*pitch;
	cPitch=pitch; cPitch(cPitch==0)=nan;
	
		plot(frameTime,	 pitch0, 'o-c' , frameTime, cPitch, 'o-g');
	%	title('Cyan: computed pitch, green: volume-thresholded computed pitch');
		legend({'Computed pitch', 'Volume-thresholded computed pitch'}, 'location', 'northOutside', 'orientation', 'horizontal');
	
	axis tight;
	xlabel('Time (second)'); ylabel('Semitone');
end

% ====== Self demo
function selfdemo
mObj=mFileParse(which(mfilename));
strEval(mObj.example);
strEval(mObj.example);