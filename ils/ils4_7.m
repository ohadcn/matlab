function ils4_7
    k1=1;k2=1;k=1;m1=1;m2=1;
    for gama=0:2:2
        A=[0 0 1 0;0 0 0 1;-(k+k1)/m1 k/m1 -gama/m1 0;-(k2+k)/m2 k/m2 0 -gama/m2];
        B=[1 0 0 0]';
        C=[0 1 0 0];
        D=0;
        ploth(A,B,C,D,gama);
        
        subplot(2,2,gama+2);
        sys=ss(A,B,C,D);
        impulse(sys,20);
    end

end


function  ploth(A,B,C,D,gama)
    t=0:.01:20;
    st=sym('t');
    eAt=expm(A*st);
    h=C*eAt*B;
    subplot(2,2,gama+1);
    plot(t,subs(h,st,t));
    title(['gamma=',num2str(gama)]);
end