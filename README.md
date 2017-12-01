# Demonstration of a discrete wave equation in Matlab

![screenshot](screenshot1.png)



This short script demonstrates the discretized 1D wave equation.

All solutions are saved to a persistent matrix for further analysis.

In this version, there is two materials: material 1 to the left of the red line, and material 2 to the right of the red line. 

This script could be easily modified to support arbitrary material, arbitrary meshing e.t.c - but here I do not do that as the point is not to replicate PZFlex - rather, to obtain a basic understanding of what PZFlex does.

Have a play with the initial conditions - especially, see what happens when you increase dt, dx, or reduce the width of the initial wavelet too far. (spoiler: nothing good.)

Note the effect of the material change: a reflection occurs.

Have fun! 

====

Dr Jerzy Dziewierz, 

CUE 2017

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.







