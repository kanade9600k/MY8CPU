/* Clock 12MHz -> 1Hz */
module Clock_12Mto1(clock_in, clock_out, nReset);

input clock_in;
input nReset;   // Negative logic
output clock_out;

wire clock_in, nReset;
reg clock_out;
reg [22:0] count;

always @(posedge clock_in or negedge nReset) begin
    if(!nReset) begin
        count <= 23'd0;
        clock_out <= 1'd0;
    end
    else if(count == 23'd5999999) begin
        count <= 23'd0;
        clock_out <= ~clock_out;
    end
    else
        count <= count + 23'd1;
    
end

endmodule