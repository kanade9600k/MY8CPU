/* test bench */
`timescale 1ns/1ns
module Program_B_test;

reg clock;
reg nReset; // Negative logic
reg [7:0] IN;
wire [7:0] OUT;

MY8CPU MY8CPU_01(.IN(IN), .OUT(OUT), .clock_in(clock), .nReset(nReset));

always #5 clock <= ~clock;

initial begin
    IN <= 8'b00000000;
    clock <= 1'b0;
    nReset <= 1'b0;
#10
    nReset <= 1'b1;
#9500
    IN <= 8'b00000001;
#1000
    IN <= 8'b00000000;
#8000
    IN <= 8'b00000010;
#1000
    IN <= 8'b00000000;
#7000
    IN <= 8'b00000001;
#1000
    IN <= 8'b00000000;
#20000
    $finish;

end

initial begin
    $dumpfile("Program_B.vcd");
    $dumpvars(0);
end

endmodule