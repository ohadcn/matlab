%%
% make a filter with 3 harmonics
[Hd]=makeFilter(200,4100,0.01,3);
freqz(Hd);
zplane(Hd);
%%
% make filter with 10 harmonics
[Hd]=makeFilter(440,44100,0.01,10);
freqz(Hd);
zplane(Hd);
%%
% filter the dbScaleMix file the output should be similar to
% dScaleMixExp.wav  (on the web)
load dScalePitch.mat;  % this file should contain a matrix named pitch
[x,fs,nbits]=wavread('dScaleMix.wav');
[y]=getMusic(x,fs,pitch,10);
if (~length(x)==length(y)) % the output should be the same length as the input
    disp('Error - the function changes the length of the signal')
end
sound(y,fs);
%%
% In this example you filter dScaleMix using only one harmonic. In theory
% since we use only one harmonic the sound won't be nice and full as when using 10
% harmonics, in practice the instrument used here is a recorder and it's
% sound isn't that full anyway so the difference won't be big.
load dScalePitch;
[x,fs,nbits]=wavread('dScaleMix.wav');
[y]=getMusic(x,fs,pitch,1);
sound(y,fs);
%%
% filter littleJohnnyMix
load littleJohnnyPitch;
[x,fs,nbits]=wavread('littleJohnnyMix.wav');
[y]=getMusic(x,fs,pitch,10);
sound(y,fs);
%%
% here we ignore the pitch and the sound is expected to be bad and not really
% resemble the song.
load littleJohnnyPitch;
pitch(:,2) = 400;
[x,fs,nbits]=wavread('littleJohnnyMix.wav');
[y]=getMusic(x,fs,pitch,10);
sound(y,fs);
