`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 21:26:22
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input rst,
    input clk,
    input w_en_rf,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    output reg [31:0] r1,
    output reg [31:0] r2
    );
    integer i;
    reg [31:0] registers [31:0];
    always@(*) 
    begin
        r1=registers[rs1];
        r2=registers[rs2];
    end
    always@(posedge clk) 
    begin
        if(rst==1)begin
            for(i=0;i<32;i=i+1) begin
            registers[i]=0;
            end
        end
        else begin
        if(w_en_rf==1'b1 && rd!=0) 
        begin
            registers[rd]<=wd;
        end
        end
    end
endmodule
