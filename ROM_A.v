/* Fibonacci sequence Program */
// フィボナッチ数列を8bitで表せるところまで計算するプログラム */
module ROM_A(address, data);

input [7:0] address;
output [15:0] data;

wire [7:0] address;
reg [15:0] data;

always @* begin
    
    case (address)
        8'b00000000: data <= 16'b00100010_00000001; // MOV A, 1
        8'b00000001: data <= 16'b00100011_00000000; // MOV B, 0
        8'b00000010: data <= 16'b00100111_00000000; // MOV C, B
        8'b00000011: data <= 16'b00000000_00000000; // ADD A, B
        8'b00000100: data <= 16'b00110000_00000110; // JNC 6
        8'b00000101: data <= 16'b00110100_00001110; // JMP 14
        8'b00000110: data <= 16'b00111000_00000001; // INC C, 1
        8'b00000111: data <= 16'b00101100_00000000; // OUT A
        8'b00001000: data <= 16'b00000001_00000000; // ADD B, A
        8'b00001001: data <= 16'b00110000_00001011; // JNC 11
        8'b00001010: data <= 16'b00110100_00001110; // JMP 14
        8'b00001011: data <= 16'b00111000_00000001; // INC C, 1
        8'b00001100: data <= 16'b00101101_00000000; // OUT B
        8'b00001101: data <= 16'b00110000_00000011; // JNC 3
        8'b00001110: data <= 16'b00110100_00001110; // JMP 14
        default: data <= 16'bxxxxxxxx_xxxxxxxx;
    endcase
end

endmodule