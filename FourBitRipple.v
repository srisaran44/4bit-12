// 4-bit Ripple Counter (Asynchronous Counter)
module FourBitRipple (
    input  wire clk,      // clock input
    input  wire rst,      // asynchronous reset (active low)
    output reg [3:0] q    // 4-bit counter output
);

always @(negedge rst or posedge clk) begin
    if (!rst)
        q[0] <= 1'b0;            // clear LSB
    else
        q[0] <= ~q[0];           // toggle LSB on every clock
end

always @(negedge rst or posedge q[0]) begin
    if (!rst)
        q[1] <= 1'b0;
    else
        q[1] <= ~q[1];           // toggle on q0 edge
end

always @(negedge rst or posedge q[1]) begin
    if (!rst)
        q[2] <= 1'b0;
    else
        q[2] <= ~q[2];           // toggle on q1 edge
end

always @(negedge rst or posedge q[2]) begin
    if (!rst)
        q[3] <= 1'b0;
    else
        q[3] <= ~q[3];           // toggle on q2 edge
end

endmodule
