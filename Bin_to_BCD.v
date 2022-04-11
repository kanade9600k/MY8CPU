/* 8bit Binary to BCD decoder */
module Bin_to_BCD(A, Y);

input [7:0] A;
output [11:0] Y;

wire [7:0] A;
wire [11:0] Y;
reg [11:0] B7;
reg [7:0] B6, B5, B4;
reg [3:0] B3, B2, B1, B0;
wire [11:0] D3, E1;
wire [7:0] D2, E0;
wire [3:0] D1, D0;
wire C0, C1, C2, C3, C4, C5, C6, C7, C8, C9;

always @* begin
    B7 <= A[7] ? 12'b0001_0010_1000 : 12'b0;    // BCD 128
    B6 <= A[6] ? 8'b0110_0100 : 8'b0;   // BCD 64
    B5 <= A[5] ? 8'b0011_0010 : 8'b0;   // BCD 32
    B4 <= A[4] ? 8'b0001_0110 : 8'b0;   // BCD 16
    B3 <= A[3] ? 4'b1000 : 4'b0;    // BCD 8
    B2 <= A[2] ? 4'b0100 : 4'b0;    // BCD 4
    B1 <= A[1] ? 4'b0010 : 4'b0;    // BCD 2
    B0 <= A[0] ? 4'b0001 : 4'b0;    // BCD 1 
end

BCD_adder BCD_adder_01(.A(B7[3:0]), .B(B6[3:0]), .Cin(1'b0), .Cout(C0), .S(D3[3:0]));
BCD_adder BCD_adder_02(.A(B7[7:4]), .B(B6[7:4]), .Cin(C0), .Cout(C1), .S(D3[7:4]));
BCD_adder BCD_adder_03(.A(B7[11:8]), .B(4'b0), .Cin(C1), .Cout(), .S(D3[11:8]));
BCD_adder BCD_adder_04(.A(B5[3:0]), .B(B4[3:0]), .Cin(1'b0), .Cout(C2), .S(D2[3:0]));
BCD_adder BCD_adder_05(.A(B5[7:4]), .B(B4[7:4]), .Cin(C2), .Cout(C3), .S(D2[7:4]));
BCD_adder BCD_adder_06(.A(B3[3:0]), .B(B2[3:0]), .Cin(1'b0), .Cout(C4), .S(D1[3:0]));
BCD_adder BCD_adder_07(.A(B1[3:0]), .B(B0[3:0]), .Cin(1'b0), .Cout(), .S(D0[3:0]));
BCD_adder BCD_adder_08(.A(D3[3:0]), .B(D2[3:0]), .Cin(1'b0), .Cout(C5), .S(E1[3:0]));
BCD_adder BCD_adder_09(.A(D3[7:4]), .B(D2[7:4]), .Cin(C5), .Cout(C6), .S(E1[7:4]));
BCD_adder BCD_adder_10(.A(D3[11:8]), .B(4'b0000), .Cin(C6), .Cout(), .S(E1[11:8]));
BCD_adder BCD_adder_11(.A(D1[3:0]), .B(D0[3:0]), .Cin(1'b0), .Cout(C7), .S(E0[3:0]));
BCD_adder BCD_adder_12(.A({3'b0, C4}), .B(4'b0000), .Cin(C7), .Cout(), .S(E0[7:4]));
BCD_adder BCD_adder_13(.A(E1[3:0]), .B(E0[3:0]), .Cin(1'b0), .Cout(C8), .S(Y[3:0]));
BCD_adder BCD_adder_14(.A(E1[7:4]), .B(E0[7:4]), .Cin(C8), .Cout(C9), .S(Y[7:4]));
BCD_adder BCD_adder_15(.A(E1[11:8]), .B(4'b0000), .Cin(C9), .Cout(), .S(Y[11:8]));

endmodule