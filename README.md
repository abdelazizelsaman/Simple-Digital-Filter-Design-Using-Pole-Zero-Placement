# Simple-Digital-Filter-Design-Using-Pole-Zero-Placement

1. Introduction:

1.1. The frequency response of a discrete-time system depends on the location of its poles and zeros in
the Z-domain.
1.2. To suppress a frequency, we can locate a zero at this frequency on the unit circle.
1.3 To amplify a frequency, we can locate a pole at this frequency inside the unit circle (such that the
system is stable).
1.4 In order to get a digital flter with real coefcients, complex poles should appear in complex-
conjugate pairs. Same for complex zeros.
1.5 The objective of this project is to become familiar with designing simple digital filters by properly
placing poles and zeros in the Z-domain.

2. Filter Specifcations:

The specifcations of practical flters usually take the form of a tolerance diagram (Shown below):
2.1 The passband edge is denoted by wp and the stopband edge is denoted by ws.
2.2 The width of the transition band is w =  ws - wp.
2.3 The cutoff frequency is denoted by wc which is assumed to be half-way between wp and ws.

![alt text](https://www.mathworks.com/help/examples/signal/win64/FilterDesignIntroductionExample_01.png)


The project is divided into 3 parts:
Part 1:

Objective: Design 1st Order Discrete-Time Low pass Filter.
Steps:

1. Pole-zero plot and the unit circle in the Z-domain.
2. Magnitude response of the filter in dB in the frequency range(-pi<w<=pi).
3. Phase response of the filter in dB in the frequency range(-pi<w<=pi).
4. The filter's impulse response.

Part 2:

Objective: Design 3rd Order Discrete-Time Low pass Filter.
Steps:
1. Adjust the magnitude of the additional complex-conjugate poles (p2 and p3) such that the pass band ripples are less than 1 dB (Project Required).
2. Pole-zero plot and the unit circle in the Z-domain.
3. Magnitude response of the filter in dB in the frequency range(-pi<w<=pi).
4. Magnitude response of the filter in dB in the frequency range (-wp<w<=wp).
5. Phase response of the filter in dB in the frequency range(-pi<w<=pi).
6. The filter's impulse response.

Part 3:

Objective: Design 5th Order Discrete-Time Low pass Filter.
Steps:
1. Generate Filter Characteristics plots. 

1.1. Pole-zero plot and the unit circle in the Z-domain.
1.2. Magnitude response of the filter in dB in the frequency range(-pi<w<=pi).
1.3. Magnitude response of the filter in dB in the frequency range (-wp<w<=wp).
1.4. Phase response of the filter in dB in the frequency range(-pi<w<=pi).
1.6. The filter's impulse response.

2.1.  Adjust the magnitude of the pole p1 in order to obtain a pass band ripple less than 0.5 dB (Project requirement)
2.2. Repeat step 1.
