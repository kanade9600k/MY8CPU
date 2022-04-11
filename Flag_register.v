/* 1bit Flag_register */
module Flag_register(IN, OUT, clock, nReset);

input IN, clock;
input nReset;    // Negative logic
output OUT;

wire IN, clock, nReset;
reg OUT;

always @(posedge clock or negedge nReset) begin
    if(!nReset)
        OUT <= 1'b0;
    else
        OUT <= IN;
end

endmodule