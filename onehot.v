
module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] state_out
);

    // State signals
    wire [4:0] state;      // Current state: [E, D, C, B, A]
    wire [4:0] next_state; // Next state
    
    // State assignments (one-hot)
    wire A = state[0];
    wire B = state[1];
    wire C = state[2];
    wire D = state[3];
    wire E = state[4];
    
    // Next state logic derived from state table
    // Next A: never go to A (no transitions lead to A)
    assign next_state[0] = 1'b0;
    
    // Next B: from A when w=0, from D when w=0, from E when w=0
    assign next_state[1] = (A & ~w) | (D & ~w) | (E & ~w);
    
    // Next C: from B when w=0, from C when w=0 (stay in C)
    assign next_state[2] = (B & ~w) | (C & ~w);
    
    // Next D: from A when w=1, from B when w=1, from C when w=1
    assign next_state[3] = (A & w) | (B & w) | (C & w);
    
    // Next E: from D when w=1, from E when w=1 (stay in E)
    assign next_state[4] = (D & w) | (E & w);
    
    // Output logic: z=1 when in state C or E
    assign z = C | E;
    
    // State flip-flops with explicit port connections matching dff module
    dff dff_A(.Default(1'b1), .D(next_state[0]), .clk(clk), .reset(reset), .Q(state[0]));
    dff dff_B(.Default(1'b0), .D(next_state[1]), .clk(clk), .reset(reset), .Q(state[1]));
    dff dff_C(.Default(1'b0), .D(next_state[2]), .clk(clk), .reset(reset), .Q(state[2]));
    dff dff_D(.Default(1'b0), .D(next_state[3]), .clk(clk), .reset(reset), .Q(state[3]));
    dff dff_E(.Default(1'b0), .D(next_state[4]), .clk(clk), .reset(reset), .Q(state[4]));
    
    // Output current state
    assign state_out = state;

endmodule