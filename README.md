# How min(a, b) and max(a, b) calculated in computer systems?
As you know, max and min are functions commonly used in many programs. How do these functions operate efficiently? Using the min and max formulas is the first approach that comes to mind:
$max(a, b) = \frac{(a+b) + |a-b|}{2}$$
$min(a, b) = \frac{(a+b) - |a-b|}{2}$$
You may think of these functions as a proper solution. In terms of computer architecture, these functions require many clock cycles to compute the desired result. Hence, computers compute min and max differently. If we have a = 5 and b = 2, and an 8-bit 2's complement system: 
$a = (5)_{10} = (00000101)_{2}$$
$a = (2)_{10} = (00000010)_{2}$$
The CPU starts from the most left-hand bit (the most significant bit or MSB) and compares them. The corresponding FSA diagram is shown below:
