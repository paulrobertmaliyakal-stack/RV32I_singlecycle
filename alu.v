`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 21:35:00
// Design Name: 
// Module Name: mux_4_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input [3:0] alu_cont,
    input [31:0] i0,
    input [31:0] i1,
    output reg [31:0] out,
    output reg flag
    );
    always@(*) 
    begin
        case(alu_cont)
        0:out=i0+i1;
        1:out=i0-i1;
        2:out=i0^i1;
        3:out=i0|i1;
        4:out=i0&i1;
        5:out=i0<<i1;
        6:out=i0>>i1;
        7:out=i0>>>i1;
        8:flag=($signed(i0)<$signed(i1))?1'b1:1'b0;
        9:flag=(i0<i1)?1'b1:1'b0;
        10:flag=(i0-i1==0)?1'b1:1'b0;
        11:flag=(i0!=i1)?1'b1:1'b0;
        12:flag=($signed(i0)>=$signed(i1))?1'b1:1'b0;
        13:flag=(i0>=i1)?1'b1:1'b0; 
        endcase
    end
endmodule
