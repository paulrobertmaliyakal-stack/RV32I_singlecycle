`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 21:20:28
// Design Name: 
// Module Name: PC
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


module PC(
    input rst,
    input [31:0] ADDR_IN,
    output reg [31:0] ADDR_OUT,
    input clk
    );
    always @(posedge clk) begin 
        if(rst==1)begin
            ADDR_OUT<=32'b0;
        end
        else ADDR_OUT<=ADDR_IN;
    end
endmodule
