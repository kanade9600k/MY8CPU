/* test bench */
`timescale 1ns/1ns
module MY8CPU_test;

reg clock;
reg nReset; // Negative logic
reg [7:0] IN;
wire [7:0] OUT;

MY8CPU MY8CPU_01(IN, OUT, clock, nReset);

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
    $dumpfile("MY8CPU.vcd");
    $dumpvars(0);
end

endmodule