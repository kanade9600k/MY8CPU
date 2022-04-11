/* Operation decoder */
module Decoder(op, C_frag, select_A_mux, select_B_mux, select_ALU, load);

input [7:0] op;
input C_frag;
output [1:0] select_A_mux;
output [2:0] select_B_mux, select_ALU;
output [4:0] load;

// Decode (select_A_mux, select_B_mux, select_ALU, load) xx_xxx_xxx_xxxxx
assign {select_A_mux, select_B_mux, select_ALU, load} = dec(op, C_frag);

function [12:0] dec;
    input [7:0] op;
    input C_frag;

    case (op)
        8'b00000000: dec = 13'b00_001_000_00001; // ADD A, B
        8'b00000001: dec = 13'b01_000_000_00010; // ADD B, A
        8'b00000010: dec = 13'b00_011_000_00001; // ADD A, Im
        8'b00000011: dec = 13'b01_011_000_00010; // ADD B, Im
        8'b00000100: dec = 13'b00_001_001_00001; // SUB A, B
        8'b00000101: dec = 13'b01_000_001_00010; // SUB B, A
        8'b00000110: dec = 13'b00_011_001_00001; // SUB A, Im
        8'b00000111: dec = 13'b01_011_001_00010; // SUB B, Im
        8'b00001000: dec = 13'b00_001_010_00001; // AND A, B
        8'b00001001: dec = 13'b01_000_010_00010; // AND B, A
        8'b00001010: dec = 13'b00_011_010_00001; // AND A, Im
        8'b00001011: dec = 13'b01_011_010_00010; // AND B, Im
        8'b00001100: dec = 13'b00_001_011_00001; // OR A, B
        8'b00001101: dec = 13'b01_000_011_00010; // OR B, A
        8'b00001110: dec = 13'b00_011_011_00001; // OR A, Im
        8'b00001111: dec = 13'b01_011_011_00010; // OR B, Im
        8'b00010000: dec = 13'b00_001_100_00001; // XOR A, B
        8'b00010001: dec = 13'b01_000_100_00010; // XOR B, A
        8'b00010010: dec = 13'b00_011_100_00001; // XOR A, Im
        8'b00010011: dec = 13'b01_011_100_00010; // XOR B, Im
        8'b00010100: dec = 13'b00_xxx_101_00001; // NOT A
        8'b00010101: dec = 13'b01_xxx_101_00010; // NOT B
        8'b00011000: dec = 13'b00_xxx_110_00001; // SL A
        8'b00011001: dec = 13'b01_xxx_110_00010; // SL B
        8'b00011100: dec = 13'b00_xxx_111_00001; // SR A
        8'b00011101: dec = 13'b01_xxx_111_00010; // SR B
        8'b00100000: dec = 13'b11_001_000_00001; // MOV A, B
        8'b00100001: dec = 13'b11_000_000_00010; // MOV B, A
        8'b00100010: dec = 13'b11_011_000_00001; // MOV A, Im
        8'b00100011: dec = 13'b11_011_000_00010; // MOV B, Im
        8'b00100100: dec = 13'b11_010_000_00001; // MOV A, C
        8'b00100101: dec = 13'b11_010_000_00010; // MOV B, C
        8'b00100110: dec = 13'b11_000_000_00100; // MOV C, A
        8'b00100111: dec = 13'b11_001_000_00100; // MOV C, B
        8'b00101000: dec = 13'b11_100_000_00001; // IN A
        8'b00101001: dec = 13'b11_100_000_00010; // IN B
        8'b00101100: dec = 13'b11_000_000_01000; // OUT A
        8'b00101101: dec = 13'b11_001_000_01000; // OUT B
        8'b00101110: dec = 13'b11_011_000_01000; // OUT Im
        8'b00110000: dec = C_frag ? 13'bxx_xxx_xxx_00000 :
                                    13'b11_011_000_10000; // JNC Im
        8'b00110100: dec = 13'b11_011_000_10000; // JMP Im
        8'b00111000: dec = 13'b10_011_000_00100; // INC C, Im
        8'b00111100: dec = 13'b11_011_000_00100; // SET C, Im
        default: dec = 13'bxx_xxx_xxx_xxxxx;
    endcase

endfunction

endmodule