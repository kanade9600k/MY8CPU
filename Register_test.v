/* test bench */
`timescale 1ns/1ns
module Register_test;

reg [7:0] IN;
reg clock, load;
reg nReset;     // Negative logic
wire [7:0] OUT;

Register Register_00(IN, OUT, clock, nReset, load);

always #5 clock <= ~clock;

initial begin
    clock <= 1'b0;
    nReset <= 1'b0;
    load <= 1'b0;
#20
    nReset <= 1'b1;
#20
    IN <= 8'b10010010;
#20
    load <= 1'b1;
#20
    IN <= 8'b11110000;
#20
    load <= 1'b0;
#20 
    nReset <= 1'b0;
#20
    IN <= 8'b01010101;
#20
    $finish;
end

initial begin
    $dumpfile("Register.vcd");
    $dumpvars(0);
end

endmodule