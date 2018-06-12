% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % ECE 254 : Digital Signal Processing % % % % % % % % % %  
% % % % % % % % % % % % % % %  % % % Matlab Project % % % % % % % % % % % % % % % 
% % % % % % % Simple Digital Filter Design Using Pole-Zero Placement% % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%///////////////////////////////////////////////////////////////////////////////% 
% Author : Ahmed Abdel Aziz
% Student ID : 14p1064
% Submitted to : Dr. Micheal Ibrahim
% FAll 17
%///////////////////////////////////////////////////////////////////////////////%
%% PART 2 %%
% Third Order Discrete-Time Lowpass Filter
%_________________________________________

%                (1-Z1*z^(-1))(1-Z2*z^(-1))
% H(Z) = ------------------------------------------
%         (1-p1*(z^-1))(1-p2*z^(-1))(1-p3*z^(-1))

% Filter characteristic: 

% cut-off frequency wc
wc = 0.25 * pi ;
% transition band t_band
t_band = 0.1 * pi ;
% passband edge wp
wp = wc - (t_band/2) ;
% stopband edge ws
ws = wc + (t_band/2) ;

% Place a zero on the unit circle at the edge of the stopband ws.
r1 = 1 ;
% z1 & z2 are complex-conjugate zeros.
z1 = r1*exp(1i*ws) ;
z2 = r1*exp(-1i*ws) ;

% Place a pole at the edge of the passband wp, p2 & p3 are complex-conjugate poles.
% Values of p2 & p3 magnitude "r2" is detremined manually by trial & error.
r2 = 0.89 ;

% Based on Part 1, a = 0.6
p1 = 0.6 ;
p2 = r2*exp(1i*wp) ;
p3 = r2*exp(-1i*wp) ; 

%% 1st Requierment: 
% Adjust the magnitude of the additional complex-conjugate poles 
% (p2 and p3) such that the passband ripples are less than 1 dB.

% Calculate the feedforward & feedbackward coeffecients
z = [ z1  z2 ] ;
p = [ p1 p2 p3 ] ;
[NUMERATOR_COEFF_b,NUMERATOR_COEFF_a ] = zp2coeff(z ,p) ;
figure('name','3rd Order LPF - Frequency Respone-Magnitude');
[h, w]=freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,-wp:0.01:wp);
Freq_Resp_Magnitude = 20*log10(abs(h)); 

plot(w,Freq_Resp_Magnitude); 

y= Freq_Resp_Magnitude;
x= w;
indexmin = find(min(y) == y); 
xmin = x(indexmin); 
ymin = y(indexmin);

indexmax = find(max(y) == y);
xmax = x(indexmax);
ymax = y(indexmax);
RANGE = range(y) ;

grid on
title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['r2 =',num2str(r2),];['Max =',num2str(ymax),'Db / Min =',num2str(ymin),'Db / BassBand Ripples =',num2str(RANGE),'Db']})
xlabel('Frequency (rad/sample)')
ylabel('Magnitude (dB)')

%-----------------------------------------------------------------------%
%% 2nd Requirment: 

% 1. Pole-zero plot and the unit circle in the Z-domain:

        figure('name','3rd Order LPF - Pole/Zero');
        zplane(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a ) ;
        grid on
        title('Pole/Zero Plot')
        legend on
        legend ('Zero','Pole','Unit Circle')

% 2. Magnitude response of the filter in dB in the frequency 
%    range(-pi<w<=pi):

        figure('name','3rd Order LPF - Frequency Respone-Magnitude (pi)');
        % Freqency Range
        omega = -pi:0.01:pi ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega); 
        % Plot the magnitude of the frequency response
        plot(w,20*log10(abs(h)));  
        grid on
        title('Frequency Respone-Magnitude |H(\ite^{\omega t})|')
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')

% 3. Magnitude response of the filter in dB in the frequency 
%    range (-wp<w<=wp):

        figure('name','3rd Order LPF - Frequency Respone-Magnitude (wp)');
        % Freqency Range
        omega_p = -wp:0.01:wp ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega_p); 
        % Plot the magnitude of the frequency response
        plot(w,20*log10(abs(h)));  
        grid on
        title('Frequency Respone-Magnitude |H(\ite^{\omega t})|')
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')

% 4. Phase response of the filter in dB in the frequency range(-pi<w<=pi):

        figure('name','3rd Order LPF - Phase Respone');
        % Get phase response --> phi
        [phi,w]=phasez(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega) ;
        % Plot the magnitude of the frequency response
        plot(w,phi);  
        grid on
        title('Phase Respone')
        xlabel('Frequency (rad/sample)')
        ylabel('Phase (rad)')

% 5. The filter's impulse response:

        figure('name','3rd Order LPF - Impulse Respone');
        impz(NUMERATOR_COEFF_b,NUMERATOR_COEFF_a ) ;
        grid on
        title('Impulse Response')
%----------------------------------------------------------------------%
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ %%

