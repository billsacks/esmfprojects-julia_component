#include <julia.h>
JULIA_DEFINE_FAST_TLS // only define this once, in an executable (not in a shared library) if you want fast code.

#include <stdio.h>

int main(int argc, char *argv[]) {
    // set up the Julia context
    jl_init();

    printf("Hello from C\n");
    jl_eval_string("println(\"Hello from Julia\")");

    // perform clean-up tasks in Julia
    jl_atexit_hook(0);
    return 0;
}