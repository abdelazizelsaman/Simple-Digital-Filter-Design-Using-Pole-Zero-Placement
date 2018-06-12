% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % ECE 254 : Digital Signal Processing % % % % % % % % % %  
% % % % % % % % % % % % % % %  % % % Matlab Project % % % % % % % % % % % % % % % 
% % % % % % % Simple Digital Filter Design Using Pole-Zero Placement% % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%///////////////////////////////////////////////////////////////////////////////% 
% Author : Ahmed Abdel Aziz
% Submitted to : Dr. Micheal Ibrahim
% FAll 17
%///////////////////////////////////////////////////////////////////////////////% 

%% PART 1 %%
% First Order Discrete-Time Lowpass Filter
%_________________________________________

%             1
% H(Z) = ------------
%       (1-p1*(z^-1))

% Consider p1 = a

%% General Requirements for a = 0.6 :
%
% 1. Pole-zero plot and the unit circle in the Z-domain:

    a = 0.6 ;     
    figure('name','1st Order LPF - Pole/Zero Plot (a=0.6)');
    NUMERATOR_COEFF_b = 1 ;   
    DENOMINATOR_COEFF_a = [1 -a] ;
    zplane(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a) ;
    grid on
    title({['Pole/Zero Plot'];['a =',num2str(a),'']})
    legend on
    legend ( 'Zero' , 'Pole' , 'Unit Circle')

% 2. Magnitude response of the filter in dB in the frequency range(-pi<w<=pi):

    figure('name','1st Order LPF - Frequency Respone-Magnitude (a=0.6) ');

    % Freqency Range
    omega = -pi:0.01:pi ;   
    % Get frequency response --> h
    [h,w] = freqz(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a ,omega); 
    % Plot the magnitude of the frequency response
    plot(w,20*log10(abs(h)));  
    grid on
    title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['a=',num2str(a),'']})
    xlabel('Frequency (rad/sample)')
    ylabel('Magnitude (dB)')


% 3. Phase response of the filter in dB in the frequency range(-pi<w<=pi):

    figure('name','1st Order LPF - Phase Respone (a=0.6)');

    % Get phase response --> phi
    [phi,w]=phasez(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a ,omega) ;
    % Plot the magnitude of the frequency response
    plot(w,phi);  
    grid on
    title({'Phase Respone' ;['a=',num2str(a),'']})
    xlabel('Frequency (rad/sample)')
    ylabel('Phase (rad)')

% 4. The filter's impulse response:

    figure('name','1st Order LPF - Impulse Respone (a=0.6)');

    impz(NUMERATOR_COEFF_b,DENOMINATOR_COEFF_a) ;
    grid on
    title({'Impulse Response' ;['a=',num2str(a),'']})


%-----------------------------------------------------------------------%
    
%% General Requirements for a = -0.6 :

% 1. Pole-zero plot and the unit circle in the Zdomain:
    a = -0.6 ;     
    figure('name','1st Order LPF - Pole/Zero Plot (a=-0.6)');

    NUMERATOR_COEFF_b = 1 ;   
    DENOMINATOR_COEFF_a = [1 -a] ;  
    zplane(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a) ;
    grid on
    title({['Pole/Zero Plot'];['a =', num2str(a),'']})
    legend on
    legend ('Zero','Pole','Unit Circle')

% 2. Magnitude response of the filter in dB in the frequency range(-pi<w<=pi):

    figure('name','1st Order LPF - Frequency Respone-Magnitude (a=-0.6) ');

    % Freqency Range
    omega = -pi:0.01:pi ;   
    % Get frequency response --> h
    [h,w] = freqz(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a ,omega); 
    % Plot the magnitude of the frequency response
    plot(w,20*log10(abs(h)));  
    grid on
    title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['a=',num2str(a),'']})
    xlabel('Frequency (rad/sample)')
    ylabel('Magnitude (dB)')


% 3. Phase response of the filter in dB in the frequency range(-pi<w<=pi):

    figure('name','1st Order LPF - Phase Respone (a=-0.6)');


    % Get phase response --> phi
    [phi,w]=phasez(NUMERATOR_COEFF_b ,DENOMINATOR_COEFF_a ,omega) ;
    % Plot the magnitude of the frequency response
    plot(w,phi);  
    grid on
    title({'Phase Respone' ;['a=',num2str(a),'']})
    xlabel('Frequency (rad/sample)')
    ylabel('Phase (rad)')

% 4. The filter's impulse response:

    figure('name','1st Order LPF - Impulse Respone (a=-0.6)');

    impz(NUMERATOR_COEFF_b,DENOMINATOR_COEFF_a) ;
    grid on
    title({'Impulse Response' ;['a=',num2str(a),'']})
%----------------------------------------------------------------------%

%   From the plotted graphs we can deduce the following:
%
%   1- Substituting with a= 0.6 gives a low pass filter
%   2- Substituting with a= -0.6 gives a high pass filter

%% ------------------------------------------------------------------ %%
