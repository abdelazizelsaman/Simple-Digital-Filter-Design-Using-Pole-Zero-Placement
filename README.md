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

The specifcations of practical flters usually take the form of a tolerance diagram:

2.1 The passband edge is denoted by wp and the stopband edge is denoted by ws.

2.2 The width of the transition band is w =  ws - wp.

2.3 The cutoff frequency is denoted by wc which is assumed to be half-way between wp and ws.
