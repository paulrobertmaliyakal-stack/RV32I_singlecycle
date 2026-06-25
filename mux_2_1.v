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


module mux_2_1(
    input [31:0] i0,
    input [31:0] i1,
    input  sel,
    output reg [31:0] out
    );
    always@(*) 
    begin
        case(sel)
        2'b0:out=i0;
        2'b1:out=i1;
        endcase
    end
endmodule
