# Bit-Reversal Rasterization

## Description

This is an attempt at Bit-Reversal Rasterization on the ZX Spectrum. The algorithm was initially implemented by Kramm and described in [1] with Davies ellaborating on it and generalizing it in [2].

The idea is you increment one base coordinate and compare its bit-reversal which provides an uniform sequence to a threshold and only increment the other coordinate when the value is above that threshold. By doing this, a visually attractive line with even spacing is produced. the threshold should be chosen so that given the bit reversed sequence of a it is exactly triggered b times. This can be achieved by sorting the bit-reversed sequence and choosing the value in that place.

The threshold value used in this implementation is only an estimate so 30% of the lines end up one or up to two pixels off. This is because the bit-reversed sequence is not necessarily uniform enough. It is possible to correct the estimate by running over the bit-reversed coordinates and keeping the three closest estimates but this is O(n) so it has been omitted from the assembly implementation.

[1] Provides an O(log n) algorithm which is claimed to always produce a close enough estimate from the modulo. At the time of implementation, it was not clear how to make the Python code produce this estimate. No effort has been made on the 6502 code.

[2] Uses the sorting method so it is not a viable alternative.

NOTE: The code is not completely tested for all edge cases and as provided endlessly loops generating something close to the screenshot below.

![screenshot showing lines and profiling in the border](https://github.com/WalterGillman/zx-lines-go-brr/blob/main/brr.png?raw=true)

## Bibliography

[1] Kramm, Matthias. (2023). BRR Lines - A new line drawing method for the cycle savvy. [quiss.org](https://www.quiss.org/boo/) (Retrieved January 1, 2026)

[2] Davies, Jonathan. (2025). Bit-Reversal Line Rasterization. [jcd.pub](https://jcd.pub/2025/05/15/bit-reversal-line-rasterization/) (Retrieved January 1, 2026)

## Contact

contact: waltergillman@proton.me
monero:44VDKbaBENcQvDQzY3Rjf2UzquTbzn4CLb96wEwDuVLPXuLT8YvVwD299T6VEDTCrbimpfh5Ke7YuLmqzAgSFCD4GWa8Kj4
