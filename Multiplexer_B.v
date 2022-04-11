/* 5chanel 8bit multiplexer */
module Multiplexer_B(A, B, C, D, E, S, Y);

input [7:0] A, B, C, D, E;
input [2:0] S;
output [7:0] Y;

wire [7:0] A, B, C, D, E, Y;
wire [2:0] S;

assign Y = select(S, A, B, C, D, E);

function [7:0] select;
    input [2:0] S;
    input [7:0] A, B, C, D, E;

    case (S)
        3'b000: select = A;
        3'b001: select = B;
        3'b010: select = C;
        3'b011: select = D;
        3'b100: select = E;
        default: select = 3'bxxx;
    endcase

endfunction

endmodule