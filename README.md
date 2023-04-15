# Division-logic-in-verilog-for-floafting-point-

This module has clock, reset, num, dnom and div as ports.
It has clock, reset, num and dnom given as input.
And the module has div given as the output.
Where
 clock is represented by clk in the code.
 reset is represented by rs in the code.
 num is the numerator which needs to be divided.
 dnom is the denominator which is the divisor.
 div is the output of the division performed.
Where the size of the variables are
 clock and reset is 1 bit in size.
 num and dnom is 64 bit in size.
 div is 64 bit in size.

The DIV code has a look up table filled with values 1 divided with values form (0 to 256).
Where the division is performed with denominator 8 bits value which the index of the look up table from
which the 64 bit value is multiplied with the numerator.
The 8 bit of the denominator and numerator is selected based on, whenever there is a first 1 in the 64 bit of
denominator bit selection of 8 bits is done from that point, n value is assigned based on where the first 1 is
found in the denominator, i.e. if denominator first 1 is found in 64 location then n is 0 on the same base if
the first 1 is found in 63 location then n is 1 and so on till 0 location where n is 64.
The resultant of the look up table and numerator value is of 128 bits in which there the 64 bits from the
MSB is selected and it is shifted by n times.
