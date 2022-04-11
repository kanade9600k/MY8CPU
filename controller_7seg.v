/* Dynamic 7segment LED controller */
module controller_7seg(clock, nReset, BCD, S, LED);

input clock;
input nReset;   // Negative logic
input [11:0] BCD;
output [2:0] S; // select digit
output [6:0] LED;

wire clock, nReset;
wire [11:0] BCD;
wire [6:0] LED;
reg [2:0] S;
reg [2:0] count;
reg [3:0] temp;

/* 6 counter */
always @(posedge clock or negedge nReset) begin
    if(!nReset) begin
        count <= 3'b0;
    end
    else if(count == 3'b101) begin
        count <= 3'b0;
    end
    else 
        count <= count + 3'b001;
    
end

always @* begin
    if(count[0] == 1'b0) begin
        S <= 3'b000;
        temp <= 4'b0000;
    end
    else if(count[2:1] == 2'b00) begin
        S <= 3'b001;
        temp <= BCD[3:0];
    end
    else if(count[2:1] == 2'b01) begin
        S <= 3'b010;
        temp <= BCD[7:4];
    end
    else if(count[2:1] == 2'b10) begin
        S <= 3'b100;
        temp <= BCD[11:8];
    end
    else begin
        S <= 3'b000;
        temp <= 4'b0000;
    end
end

// /* 2bit counter */
// always @(posedge clock or negedge nReset) begin

//     if(!nReset) begin
//         count <= 2'b0;
//     end
//     else if(count == 2'b11) begin
//         count <= 2'b0;
//     end
//     else 
//         count <= count + 2'b01;

// end

// always @* begin
    
//     case(count)
//     2'b00: begin
//            S <= 3'b000;
//            temp <= 4'b0000;
//     end
//     2'b01: begin 
//            S <= 3'b001;
//            temp <= BCD[3:0];
//     end
//     2'b10: begin
//            S <= 3'b010;
//            temp <= BCD[7:4];
//     end
//     2'b11: begin
//            S <= 3'b100;
//            temp <= BCD[11:8];
//     end
//     default: begin
//              S <= 3'bxxx;
//              temp <= 4'bxxxx;
//     end
//     endcase

// end

dec7seg dec7seg_01(.BCD(temp), .S(LED));

endmodule