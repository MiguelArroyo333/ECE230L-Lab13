
module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state_out
);

    wire [2:0] state;      // Current state [y2, y1, y0]
    wire [2:0] next_state; // Next state
    
    
    wire y0 = state[0];  // LSB
    wire y1 = state[1];
    wire y2 = state[2];  // MSB

    assign next_state[0] = (~w & ~y1 & ~y0) | (~w & y1 & y0) | (w & ~y2 & ~y1) | (w & y1& ~y0);
    
    assign next_state[1] = w&~y2&~y1 | ~y1&y0 | y1&~y0;

    assign next_state[2] = (y1 & y0 & w) | (y2 & w);
    
    // Output logic: z=1 when in state C(010) or E(100)
    assign z = y2 | (y1 & ~y0) ;
    
    // State flip-flops with explicit port connections matching dff module
    dff dff_0(.Default(1'b0), .D(next_state[0]), .clk(clk), .reset(reset), .Q(state[0]));
    dff dff_1(.Default(1'b0), .D(next_state[1]), .clk(clk), .reset(reset), .Q(state[1]));
    dff dff_2(.Default(1'b0), .D(next_state[2]), .clk(clk), .reset(reset), .Q(state[2]));
    
    // Output current state
    assign state_out = state;

endmodule