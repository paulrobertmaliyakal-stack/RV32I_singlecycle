`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 10:58:23
// Design Name: 
// Module Name: PC_4
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


module PC_4(
    input [31:0] pc,
    output reg [31:0] out
    );
    always@(*)
    begin
        out=$signed(pc)+$signed(4);
    end
endmodule
