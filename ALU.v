/* ALU 8bit */
module ALU(A, B, op, S, C_out);

input [7:0] A, B;
input [2:0] op;
output [7:0] S;
output C_out;

wire [7:0] A, B, S;
wire [2:0] op;
wire C_out;

assign {C_out, S} = dec(op, A, B);

function [8:0] dec;
    input [2:0] op;
    input [7:0] A, B;

    case (op)
        3'b000: dec = A + B;    // add
        3'b001: dec = A - B;    // subtract
        3'b010: dec = A & B;    // and
        3'b011: dec = A | B;    // or
        3'b100: dec = A ^ B;    // xor
        3'b101: dec = ~A;       // not
        3'b110: dec = A << 1;   // 1bit left shift
        3'b111: dec = A >> 1;   // 1bit right shift
        default: dec = 8'bxxxxxxxx;
    endcase

endfunction

endmodule