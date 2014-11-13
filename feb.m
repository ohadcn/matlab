function [a]=feb(n)
	if(n<2)
		a= 1;
	else
		a= feb(n-1)+feb(n-2);
	end
end