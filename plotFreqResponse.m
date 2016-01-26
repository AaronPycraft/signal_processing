%--aaron pycraft
%  engr 2100
%  practicing FIR filters and matlab
%% User input
bb = [ 0.25 0.5 0.25 ]; %constants
xn = [0, 1, 1, 1, 0]; %input signal
w = [-pi -pi/2 -pi/4 0 pi/4 pi/2 pi]; %frequencies to plot

%% Time-domain impulse response
yn = firfilt( bb, xn); %--Output signal, forced to length of xn
subplot(3,1,1), stem( w, yn); %--TIME-DOMAIN IMPULSE RESPONSE
title('time response');
axis([-3.5, 3.5, -0.5, 1.25]); %axis X & Y limits
xlabel('w');
ylabel('h(w)');
%--Show the values of w as tick marks on x axis, if many frequencies must be 
%  plotted, this will become unradable
set(gca,'xtick',w);

%% Frequency reponse plot
H = freqz( bb, 1, w );
abs(H')
%%  Magnitude
subplot(3,1,2), stem(w, abs(H), 'r' ) %--FREQUENCY RESPONSE MAGNITUDE
legend('magnitude');
axis([-3.5, 3.5, -0.5, 1.25]); %axis X & Y limits
xlabel('w');
ylabel('H(w) (dB)');
set(gca,'xtick',w);

%% Phase plot
subplot(3,1,3), stem(w, -w, 'g' ) %--FREQUENCY RESPONSE PHASE
legend('phase');

xlabel('w');
ylabel('phase(w) (radians)');
set(gca,'xtick',[-pi, -pi/2, 0, pi/2, pi]);


