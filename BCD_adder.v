/* BCD adder */
module BCD_adder(A, B, Cin, Cout, S);

input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

wire [3:0] A, B, S;
wire Cin, Cout;
wire check;
wire [4:0] temp;

assign temp = A + B + Cin;
assign check = temp[4] | (temp[3] & (temp[1] | temp[2])); // 10以上かを検出
assign {Cout, S} = (check) ? (temp + 4'b0110) : temp;

endmodule