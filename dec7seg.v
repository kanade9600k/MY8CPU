/* 7seg decoder */
module dec7seg(BCD, S);

input [3:0] BCD;
output [6:0] S;

wire [3:0] BCD;
wire [6:0] S;

assign S = dec(BCD);

function [6:0] dec;
    input [3:0] BCD;

    case (BCD)
        4'd0: dec = 7'b1111110;
        4'd1: dec = 7'b0110000;
        4'd2: dec = 7'b1101101;
        4'd3: dec = 7'b1111001;
        4'd4: dec = 7'b0110011;
        4'd5: dec = 7'b1011011;
        4'd6: dec = 7'b1011111;
        4'd7: dec = 7'b1110000;
        4'd8: dec = 7'b1111111;
        4'd9: dec = 7'b1111011;
    default: dec = 8'bxxxxxxxx;
    endcase
    
endfunction

endmodule