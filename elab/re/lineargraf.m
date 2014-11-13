function [a, da, b, db]= lineargraf (X, DX, Y, DY)
%X= input ('enter x');
%DX= input  ('enter dx');
%Y=  input ('enter y');
%DY= input ('enter dy');
[a,da,b,db] = linearfit(X,DX,Y,DY)
y=a*X+b;
figure; plot(X,y)
hold on; plot(X,Y,'.')
hold on; herrorbar(X,Y, DX, '.')
hold on; errorbar(X,Y, DY, '.')

%Y=a*x+b;
%plot(x,Y)
%hold on; plot(x,y0,'.')
%hold on; herrorbar(x,y0, dx, '.')
%hold on; errorbar(x,y0, dy, '.')



