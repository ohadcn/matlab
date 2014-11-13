dirs=dir();
dirs=dirs(3:end);
for i=dirs'
    cd(['~/lab/',i.name]);
    l=dir('*.jpg');
    mkdir(['~/optolab1/',i.name]);
    for j=l'
        a=imread(j.name);
        b=min(a,[],3);
        imwrite(b,['~/optolab1/',i.name,'/',j.name]);
    end
end
cd ..
