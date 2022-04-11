/* Program_A top modlule */
module Program_A(IN, S, LED, clock_in, nReset);

input [7:0] IN;
input clock_in;
input nReset;   // Negative logic
output [2:0] S;
output [6:0] LED;

// 入力信号
wire [7:0] IN;
wire [2:0] S;
wire [6:0] LED;
wire clock_in, nReset;

// 内部信号
wire [7:0] OUT;
wire [11:0] BCD_out;

MY8CPU MY8CPU_01(.IN(IN), .OUT(OUT), .clock_in(clock_in), .nReset(nReset));

Bin_to_BCD Bin_to_BCD_01(.A(OUT), .Y(BCD_out));

controller_7seg controller_7seg_01(.clock(clock_in), .nReset(nReset), .BCD(BCD_out), .S(S), .LED(LED));

endmodule