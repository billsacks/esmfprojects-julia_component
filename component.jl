mutable struct State
    times_called::Int
end

model_state = State(0)

function init()
    model_state.times_called = 0
end

function run()
    model_state.times_called += 1
    println("model_state times_called: ", model_state.times_called)
    @ccall "./say_y.dylib".say_y(model_state.times_called::Cint)::Cvoid
end
