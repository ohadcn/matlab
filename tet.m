function tet
	clc
	%fflush (stdout);
	input('');
	a=input('enter the length:');
	b=input('enter the  width:');
	while (a<=10 && a>=3) && (b<=10 && b>=3) ;
		for i = 1:a
			for j = 1:b
				C(i,j) = '*';
			end
		end
		disp(C);
		C=['*'];
		a=input('enter the length ');
		b=input('enter the  width');
	end
	disp('wrongs numbers');
end