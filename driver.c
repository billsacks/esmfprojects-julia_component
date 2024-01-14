#include <julia.h>
JULIA_DEFINE_FAST_TLS // only define this once, in an executable (not in a shared library) if you want fast code.

#include <stdio.h>

int main(int argc, char *argv[]) {
    // Set up the Julia context
    jl_init();

    // Start off by demonstrating that we can print from both C and Julia
    printf("Hello from C\n");
    jl_eval_string("println(\"Hello from Julia\")");

    // Load Julia file with function definition
    jl_eval_string("include(\"component.jl\")");

    // Call component init
    jl_function_t* init = jl_get_function(jl_main_module, "init");
    jl_call0(init);

    // Call component run in the "run loop"
    jl_function_t* run = jl_get_function(jl_main_module, "run");
    for (int i = 0; i < 10; ++i) {
        jl_call0(run);
    }

    // Perform clean-up tasks in Julia
    jl_atexit_hook(0);
    return 0;
}