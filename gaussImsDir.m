echo off;
dirs=dir();
dirs=dirs(3:end);
for i=dirs'
    cd(['~/optolab1/',i.name]);
    l=dir('*.jpg');
%     mkdir(['~/optolab1/',i.name]);
    for j=l'
        [a, b, c]=gaussImage(j.name);
        disp([i.name,'\', j.name, ': ', num2str(a) ,'*e^((x-', num2str(b),')/' , num2str(c),')^2)' ]);
    end
end;
cd ..;
