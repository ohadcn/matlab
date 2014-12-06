alpha = @(w, b) 1i*(1-w) - b;
beta = @(w, b) 1i*(1+w) - b;
akt = @(w, t) (exp(alpha(w,.01)*t)-1)./alpha(w, .01);
aktb = @(w, t) (exp(alpha(w,.5)*t)-1)./alpha(w, .5) + (exp(beta(w,.5)*t)-1)./beta(w, .5);

subplot(2,2,1)
title('resonance, for \omega_{norm} = 1.2')
ylabel('|\alpha_k(t)|^2')
xlabel 't'
t = 0:0.01:100; w = 1.2;
plot(t,abs(akt(w,t).^2))

subplot(2,2,2)
title('resonance, for t_{norm} = 3')
ylabel('|\alpha_k(t)|^2')
xlabel '\omega_{norm}'
w = -10:.01:10; t=3;
plot(w,abs(akt(w,t)).^2)

subplot(2,2,3)
title('no resonance, for \omega_{norm} = 3')
ylabel('|\alpha_k(t)|^2')
xlabel 't'
t = 0:0.01:100; w = 3;
plot(t,abs(aktb(w,t).^2))

subplot(2,2,4)
title('no resonance, for t_{norm} = 3')
ylabel('|\alpha_k(t)|^2')
xlabel('\omega_{norm}')
w = -10:.01:10; t=3;
plot(w,abs(aktb(w,t)).^2)