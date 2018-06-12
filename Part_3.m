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
%% PART 3 %%
% Fifth Order Discrete-Time Lowpass Filter
%_________________________________________

%                (1-Z1*z^(-1))(1-Z2*z^(-1))(1-Z3*z^(-1))(1-Z4*z^(-1))
% H(Z) = --------------------------------------------------------------------
%         (1-p1*(z^-1))(1-p2*z^(-1))(1-p3*z^(-1))(1-p4*(z^-1))(1-p5*(z^-1))

% Filter characteristic: 

% cut-off frequency wc
wc = 0.25 * pi ;
% transition band t_band
t_band = 0.1 * pi ;
% passband edge wp
wp = wc - (t_band/2) ;
% stopband edge ws
ws = wc + (t_band/2) ;

% From PART 2
r1 = 1 ;
z1 = r1*exp(1i*ws) ;
z2 = r1*exp(-1i*ws) ;
r2 = 0.89 ;
p1 = 0.6 ;
p2 = r2*exp(1i*wp) ;
p3 = r2*exp(-1i*wp) ; 

% We will use the same magnitude of p2 and p3 for p4 and p5.
r3 = r2 ;
% Place a pole at the half way between w=0 and wp, p4 & p5 are
% complex-conjugate poles.
p4 = r3*exp(1i*(wp/2)) ; 
p5 = r3*exp(-1i*(wp/2)) ; 
% Place a zero at the half way between w=pi and ws, z3 & z4 are
% complex-conjugate zeroes.
z3 = r1*exp(1i*(((pi-ws)/2)+ws)) ;
z4 = r1*exp(-1i*(((pi-ws)/2)+ws)) ;

%% 1st Requirment:
% Generate the plots described in section 3, and measure the passband 
% ripples in this case:

z = [ z1 z2 z3 z4] ;
p = [ p1 p2 p3 p4 p5] ;
[NUMERATOR_COEFF_b,NUMERATOR_COEFF_a ] = zp2coeff(z ,p) ;


% 1. Pole-zero plot and the unit circle in the Z-domain:
     
        figure('name','5th Order LPF - Pole/Zero - (p1=0.6 "old value")');
        zplane(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a ) ;
        grid on
        title({'Pole/Zero Plot';['5th Order LPF at p1 = 0.6 "old value"']})
        legend on
        legend ('Zero','Pole','Unit Circle')

    % 2. Magnitude response of the filter in dB in the frequency
    %    range(-pi<w<=pi):
    
        figure('name','5th Order LPF - Frequency Respone-Magnitude - (p1=0.6 "old value")');
        % Freqency Range
        omega = -pi:0.01:pi ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega); 
        % Plot the magnitude of the frequency response
        Freq_Resp_Magnitude = 20*log10(abs(h)); 
        plot(w,Freq_Resp_Magnitude); 
        grid on
        title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['5th Order LPF at p1 = 0.6 "old value"']})
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')

    % 3. Magnitude response of the filter in dB in the frequency
    %    range (-wp<w<=wp):

        figure('name','5th Order LPF - Frequency Respone-Magnitude_wp - (p1=0.6 "old value")');
        % Freqency Range
        omega_p = -wp:0.01:wp ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega_p); 
        Freq_Resp_Magnitude = 20*log10(abs(h)); 
        % Plot the magnitude of the frequency response


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
        title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['5th Order LPF at p1 = 0.6 "old value"'];['Max =',num2str(ymax),'Db / Min =',num2str(ymin),'Db / BassBand Ripples =',num2str(RANGE),'Db']})
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')



    % 4. Phase response of the filter in dB in the frequency range(-pi<w<=pi):
    
        figure('name','5th Order LPF - Phase Respone - (p1=0.6 "old value")');
        % Get phase response --> phi
        [phi,w]=phasez(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega) ;
        % Plot the magnitude of the frequency response
        plot(w,phi);  
        grid on
        title({['Phase Respone - '];['5th Order LPF at p1 = 0.6 "old value"']})
        xlabel('Frequency (rad/sample)')
        ylabel('Phase (rad)')

    % 5. The filter's impulse response:
    
        figure('name','5th Order LPF - Impulse Respone - (p1=0.6 "old value")');
        impz(NUMERATOR_COEFF_b,NUMERATOR_COEFF_a) ;
        grid on
        title('Impulse Response')

%-----------------------------------------------------------------------%
%% 3.2. 2nd Requirment: 

% A. adjust the magnitude of the pole p1 in order to obtain a passband
%    ripple less than 0.5 dB:

    % Value of p1 is detremined manually by trial & error.
    p1 =0.001;
    % p1 = 0.76 gives flat band
    p = [ p1 p2 p3 p4 p5] ;
    [NUMERATOR_COEFF_b,NUMERATOR_COEFF_a ] = zp2coeff(z ,p) ;
    [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega_p); 
    % Plot the magnitude of the frequency response
    figure('name','5th Order LPF - Frequency Respone-Magnitude');
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
    title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['5th Order LPF before at p1 =',num2str(p1),' "new value"'];['Max =',num2str(ymax),'Db / Min =',num2str(ymin),'Db / BassBand Ripples =',num2str(RANGE),'Db']})
    xlabel('Frequency (rad/sample)')
    ylabel('Magnitude (dB)')

    %----------------------------------------------------------------------%

%   From the Frequency Respone-Magnitude graph we can deduce the following
%
%   1. At p1 = 0.001, we get the smallest value for passband ripples which 
%      is 10.74 .

    %----------------------------------------------------------------------%

% B. Generate the plots described in section 3

% 1. Pole-zero plot and the unit circle in the Z-domain:
     
        figure('name','5th Order LPF - Pole/Zero');
        zplane(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a ) ;
        grid on
        title({'Pole/Zero Plot'})
        legend on
        legend ('Zero','Pole','Unit Circle')

    % 2. Magnitude response of the filter in dB in the frequency
    %    range(-pi<w<=pi):
    
        figure('name','5th Order LPF - Frequency Respone-Magnitude');
        % Freqency Range
        omega = -pi:0.01:pi ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega); 
        % Plot the magnitude of the frequency response
        Freq_Resp_Magnitude = 20*log10(abs(h)); 
        plot(w,Freq_Resp_Magnitude); 
        grid on
        title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|'})
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')

    % 3. Magnitude response of the filter in dB in the frequency
    %    range (-wp<w<=wp):

        figure('name','5th Order LPF - Frequency Respone-Magnitude_wp');
        % Freqency Range
        omega_p = -wp:0.01:wp ;   
        % Get frequency response --> h
        [h,w] = freqz(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega_p); 
        Freq_Resp_Magnitude = 20*log10(abs(h)); 
        % Plot the magnitude of the frequency response


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
        title({'Frequency Respone-Magnitude |H(\ite^{\omega t})|';['Max =',num2str(ymax),'Db / Min =',num2str(ymin),'Db / BassBand Ripples =',num2str(RANGE),'Db']})
        xlabel('Frequency (rad/sample)')
        ylabel('Magnitude (dB)')



    % 4. Phase response of the filter in dB in the frequency range(-pi<w<=pi):
    
        figure('name','5th Order LPF - Phase Respone ');
        % Get phase response --> phi
        [phi,w]=phasez(NUMERATOR_COEFF_b ,NUMERATOR_COEFF_a  ,omega) ;
        % Plot the magnitude of the frequency response
        plot(w,phi);  
        grid on
        title({['Phase Respone - ']})
        xlabel('Frequency (rad/sample)')
        ylabel('Phase (rad)')

    % 5. The filter's impulse response:
    
        figure('name','5th Order LPF - Impulse Respone');
        impz(NUMERATOR_COEFF_b,NUMERATOR_COEFF_a) ;
        grid on
        title('Impulse Response')

%________________________________________________________________________________%

