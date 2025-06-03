# How min(a, b) and max(a, b) calculated in computer systems?
As you know, max and min are functions commonly used in many programs. How do these functions operate efficiently? Using the min and max formulas is the first approach that comes to mind:</br>
$max(a, b) = \frac{(a+b) + |a-b|}{2}$</br>
$min(a, b) = \frac{(a+b) - |a-b|}{2}$</br>
You may think of these functions as a proper solution. In terms of computer architecture, these functions require many clock cycles to compute the desired result. Hence, computers compute min and max differently. If we have a = 5 and b = 2, and an 8-bit 2's complement system:</br> 
a = (5)<sub>10</sub> = (00000101)<sub>2</sub></br>
$a = (2)_{10} = (00000010)_{2}$</br>
The CPU starts from the most left-hand bit (the most significant bit or MSB) and compares them. The corresponding FSA diagram is shown below:
