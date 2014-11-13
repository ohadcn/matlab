T= 5778;
K=1.3E2;

lambda = [100:1000];
Intensity = K*T./(pi.*lambda).^2;
R =K*T./(pi.*640).^2
G = K*T./(pi.*540).^2
B = K*T./(pi.*440).^2
N = sum([R,G,B]);
hold on;
plot(lambda, Intensity, 'linewidth', 2, 'color', [R/N, G/N, B/N]);

plot(400,[0:.01:max(Intensity)],'.')
plot(700,[0:.01:max(Intensity)],'.')
hold off
title(['the RGB values are ', num2str(R/N),' ,', num2str(G/N),' ,', num2str(B/N)]);
xlabel('wavelength [nm]');
ylabel('the intensity of the light');
