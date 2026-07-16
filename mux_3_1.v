`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 22:42:53
// Design Name: 
// Module Name: mux_3_1
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


module mux_3_1(
input [31:0] i0,
input [31:0] i1,
input [31:0] i2,
input [1:0] sel,
output reg [31:0] out
    );
    always@(*) begin  
    case(sel)
    0:out=i0;
    1:out=i1;
    2:out=i2;
    default :out =i0;
    endcase
    end
endmodule
