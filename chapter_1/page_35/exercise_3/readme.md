# Exercise
In some of the assembly listings, the function name has a @ prefix followed by a number. Explain when and why this decoration exists.

# Solution
That is part of the __stdcall name-decoration. The name is prefixed with an underscore (_), and suffixed with an at (@) sign which is immediately followed by the size in bytes of all arguments.
