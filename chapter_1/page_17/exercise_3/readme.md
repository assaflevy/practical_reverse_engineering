# Exercise
In the example function, `addme`, what would happen if the stack pointer were not properly restored before executing `RET`?

# Solution
If the stack pointer is not properly restored, i.e. is not brought to point to the return address, then `EIP` will be set to whatever other value happens
to be on the stack where `ESP` is pointing. Arbitrary memory will be executed, most likely resulting in an exception.
