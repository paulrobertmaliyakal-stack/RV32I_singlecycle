`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 10:58:23
// Design Name: 
// Module Name: PC_IMM
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


module PC_IMM(
    input [31:0] pc,
    input [31:0] imm,
    output reg [31:0] out
    );
    always@(*)
    begin
        out=$signed(pc)+$signed(imm);
    end
endmodule
