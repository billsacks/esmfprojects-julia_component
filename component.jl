mutable struct State
    times_called::Int
end

model_state = State(0)

function init()
    model_state.times_called = 0
end

function run()
    model_state.times_called += 1
end

init()

run()
run()
run()

println("model_state times_called: ", model_state.times_called)
