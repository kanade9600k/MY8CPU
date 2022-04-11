/* Clock 1/10 */
module Clock_10to1(clock_in, clock_out, nReset);

input clock_in;
input nReset;   // Negative logic
output clock_out;

wire clock_in, nReset;
reg clock_out;
reg [2:0] count;

always @(posedge clock_in or negedge nReset) begin
    if(!nReset) begin
        count <= 3'd0;
        clock_out <= 1'd0;
    end
    else if(count == 3'd4) begin
        count <= 3'd0;
        clock_out <= ~clock_out;
    end
    else
        count <= count + 3'd1;
    
end

endmodule