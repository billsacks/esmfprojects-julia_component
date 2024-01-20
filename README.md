To compile, simply run 'make'.

To run, run the 'driver' executable.

This runs 10 iterations of the run loop; each time, a counter ("state variable") in Julia is incremented, and this counter's value is printed both from Julia and from C.

The resulting output should look like this if successful:

```
Hello from C
Hello from Julia
model_state times_called: 1
Hello from C: got y = 1.
model_state times_called: 2
Hello from C: got y = 2.
model_state times_called: 3
Hello from C: got y = 3.
model_state times_called: 4
Hello from C: got y = 4.
model_state times_called: 5
Hello from C: got y = 5.
model_state times_called: 6
Hello from C: got y = 6.
model_state times_called: 7
Hello from C: got y = 7.
model_state times_called: 8
Hello from C: got y = 8.
model_state times_called: 9
Hello from C: got y = 9.
model_state times_called: 10
Hello from C: got y = 10.
```
