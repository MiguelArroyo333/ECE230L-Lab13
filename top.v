module top(
    input sw,        // w input
    output [9:0] led, // LED outputs
    input btnC,      // Clock
    input btnU       // Reset
);

    wire z_onehot;
    wire z_binary;
    wire [4:0] onehot_states;
    wire [2:0] binary_state;
    
    // Instantiate one-hot state machine
    onehot oh_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_onehot),
        .state_out(onehot_states)
    );
    
    // Instantiate binary state machine
    binary bin_fsm(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .state_out(binary_state)
    );
    
    // Connect to LEDs according to IO table:
    // led[0] = One-hot Z output
    // led[1] = Binary Z output
    // led[2] = One-hot state A
    // led[3] = One-hot state B
    // led[4] = One-hot state C
    // led[5] = One-hot state D
    // led[6] = One-hot state E
    // led[9:7] = Binary State
    assign led[0] = z_onehot;
    assign led[1] = z_binary;
    assign led[2] = onehot_states[0];  // State A
    assign led[3] = onehot_states[1];  // State B
    assign led[4] = onehot_states[2];  // State C
    assign led[5] = onehot_states[3];  // State D
    assign led[6] = onehot_states[4];  // State E
    assign led[9:7] = binary_state;

endmodule