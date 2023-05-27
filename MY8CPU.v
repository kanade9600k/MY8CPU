/* MY8CPU top module */
module MY8CPU(IN, OUT, clock_in, nReset);

input [7:0] IN;
input clock_in;
input nReset;   // Negative logic
output [7:0] OUT;

// 入力信号
wire [7:0] IN, OUT;
wire clock_in, nReset;

// 内部信号
wire [7:0] A_reg_out, B_reg_out, C_reg_out, OUT_reg_out, PC_out;
wire [7:0] A_mux_out, B_mux_out;
wire [15:0] rom_data;
wire [7:0] ALU_out;
wire C_flag, Flag_reg_out;
wire [1:0] Dec_muxA_out;
wire [2:0] Dec_muxB_out, Dec_ALU_out;
wire [4:0] load;
wire clock;


assign OUT = OUT_reg_out;

// シミュレーション量が多くなるので、ダイナミック制御のクロックは10分周にする
Clock_10to1 Clock_10to1_01(.clock_in(clock_in), .clock_out(clock), .nReset(nReset));

Multiplexer_A Multiplexer_A_01(.A(A_reg_out), .B(B_reg_out), .C(C_reg_out), .D(8'b00000000), .S(Dec_muxA_out), .Y(A_mux_out));
Multiplexer_B Multiplexer_B_01(.A(A_reg_out), .B(B_reg_out), .C(C_reg_out), .D(rom_data[7:0]), .E(IN), .S(Dec_muxB_out), .Y(B_mux_out));

ALU ALU_01(.A(A_mux_out), .B(B_mux_out), .op(Dec_ALU_out), .S(ALU_out), .C_out(C_flag));

Flag_register Flag_register_01(.IN(C_flag), .OUT(Flag_reg_out), .clock(clock), .nReset(nReset));

Register Register_A(.IN(ALU_out), .OUT(A_reg_out), .clock(clock), .nReset(nReset), .load(load[0]));
Register Register_B(.IN(ALU_out), .OUT(B_reg_out), .clock(clock), .nReset(nReset), .load(load[1]));
Register Register_C(.IN(ALU_out), .OUT(C_reg_out), .clock(clock), .nReset(nReset), .load(load[2]));
Register Register_OUT(.IN(ALU_out), .OUT(OUT_reg_out), .clock(clock), .nReset(nReset), .load(load[3]));

Program_counter Program_counter_01(.IN(ALU_out), .OUT(PC_out), .clock(clock), .nReset(nReset), .load(load[4]));

Decoder Decoder_01(.op(rom_data[15:8]), .C_frag(Flag_reg_out), .select_A_mux(Dec_muxA_out), .select_B_mux(Dec_muxB_out), .select_ALU(Dec_ALU_out), .load(load));

ROM_A ROM_A_01(.address(PC_out), .data(rom_data));   // フィボナッチ数列プログラム
// ROM_B ROM_B_01(.address(PC_out), .data(rom_data));      // テニスゲームのプログラム

endmodule