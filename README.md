# How min(a, b) and max(a, b) calculated in computer systems?
As you know, max and min are functions commonly used in many programs. How do these functions operate efficiently? Using the min and max formulas is the first approach that comes to mind:</br>
<p align="center">
$$max(a, b) = \frac{(a+b) + |a-b|}{2}$$
</p>
<p align="center">
$$min(a, b) = \frac{(a+b) - |a-b|}{2}$$
</p>
You may think of these functions as a proper solution. In terms of computer architecture, these functions require many clock cycles to compute the desired result. Hence, computers compute min and max differently. If we have a = 5 and b = 2, and an 8-bit 2's complement system:</br> 
<p align="center">
  a = (5)<sub>10</sub> = (00000101)<sub>2</sub>
</p>
<p align="center">
  a = (2)<sub>10</sub> = (00000010)<sub>2</sub>
</p>
The CPU starts from the most left-hand bit (the most significant bit or MSB) and compares them. The corresponding FSA diagram is shown below:
<img src="./figures/FSA.jpg" alt="FSA diagram">
The verilog implementation of this idea is in <a href="./2s_Complement_Comparator.sv">this file</a>
This implementation may be as inefficient as the first solution. You may be right! After all, it all depends on the design of the CPU. On the other hand, both solutions have a time complexity of O(1), but the likelihood of a bit being zero or one is 50% (at a superficial glance). Therefore, the second method is more likely to produce a faster result.
