/* 8bit Program counter with reset, load */
module Program_counter(IN, OUT, clock, nReset, load);

input [7:0] IN;
input clock, load;
input nReset;    // Negative logic
output [7:0] OUT;

wire [7:0] IN;
wire clock, nReset, load;
reg [7:0] OUT;

always @(posedge clock or negedge nReset) begin
    if(!nReset)
        OUT <= 8'd0;
    else if (load)
        OUT <= IN;
    else
        OUT <= OUT + 8'd1;  // count up
end

endmodule