`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 13:16:10
// Design Name: 
// Module Name: sra_test
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


module sra_test(
input [31:0] a,
input [31:0] b,
output [31:0] out
    );
    assign out=$signed(a)>>b;
    
endmodule
