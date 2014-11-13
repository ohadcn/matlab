%just put this file in the same folder as your code and the .wav files
%than run it
clear num
clear filename;
filename{1} = 'seq_1.wav';
num{1} = [0 1 2 3 4 5 6 7 8 9 10 11];



filename{2} = 'seq_2.wav';
num{2} = [4 6 3 6 2 11 10 ];


 
filename{3} = 'seq_3.wav';
num{3} = [6 7 5 6 7  ];


filename{4} = 'seq_4.wav';
num{4} = [3 3 3 3 6 9 1 2 2 10 0 11 ];


filename{5} = 'seq_5.wav';
num{5} = [0 1 2 3 4 5 6 7 8 9 10 11];


filename{6} = 'seq_6.wav';
num{6} = [1 4 0 3 7 9 3 3  ];


filename{7} = 'seq_7.wav';
num{7} = [5 5 5 5 6 7 1 2 2 3 4  ];


filename{8} = 'seq_8.wav';
num{8} = [3 6 7 3 4 6 8 0 11 ];


filename{9} = 'seq_9.wav';
num{9} = [3 4 5 8 1 2 4 11 ];


filename{10} = 'seq_10.wav';
num{10} = [8 8 8  2 5 1 2 2 2  11 0 ];


for i=0:11
	[y,fs,bits]=wavread(strcat('phone_',int2str(i),'.wav'));
	if (identifyPhoneTones(y,fs)~=i)
		disp(['test phone_',int2str(i),'.wav failed']);
	end
	[y,fs,bits]=wavread(strcat('phone_',int2str(i),'_noise.wav'));
	if (identifyPhoneTones(y,fs)~=i)
		disp(['test phone_',int2str(i),'_noise.wav failed']);
	end
end

for i=1:10
	if (not (isequal(identifyPhoneSeq(filename{i}),num{i})))
		disp(['test ',filename{i},' failed']);
	end
end