/* test bench */
`timescale 1ns/1ns
module Program_A_test;

reg clock;
reg nReset; // Negative logic
reg [7:0] IN;
wire [2:0] S;
wire [6:0] LED;

Program_A Program_A_01(IN, S, LED, clock, nReset);

always #5 clock <= ~clock;

initial begin
    IN <= 8'b00000000;
    clock <= 1'b0;
    nReset <= 1'b0;
#10
    nReset <= 1'b1;
#200000
    $finish;

end

initial begin
    $dumpfile("Program_A.vcd");
    $dumpvars(0);
end

endmodule