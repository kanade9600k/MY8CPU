/* 4chanel 8bit multiplexer */
module Multiplexer_A(A, B, C, D, S, Y);

input [7:0] A, B, C, D;
input [1:0] S;
output [7:0] Y;

wire [7:0] A, B, C, D, Y;
wire [1:0] S;

assign Y = select(S, A, B, C, D);

function [7:0] select;
    input [1:0] S;
    input [7:0] A, B, C, D;

    case (S)
        2'b00: select = A;
        2'b01: select = B;
        2'b10: select = C;
        2'b11: select = D;
        default: select = 2'bxx;
    endcase
    
endfunction

endmodule