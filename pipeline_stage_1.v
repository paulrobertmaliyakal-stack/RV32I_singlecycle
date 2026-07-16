`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 18:10:46
// Design Name: 
// Module Name: pipeline_stage_1
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


module pipeline_stage_1(
input clk,
input [6:0] opcode,
input [24:0] immediate,
input [2:0] funct3,
input [6:0] funct7,
input [4:0] rs1,
input [4:0] rs2,
input [4:0] rd,
input [31:0] pc,
input [31:0] pc_4,
input en,
input flush_d,

output reg [6:0] opcode_out,
output reg [24:0] immediate_out,
output reg [2:0] funct3_out,
output reg [6:0] funct7_out,
output reg [4:0] rs1_out,
output reg [4:0] rs2_out,
output reg [4:0] rd_out,
output reg [31:0] pc_out,
output reg [31:0] pc_4_out
    );
    
    always @(posedge clk) begin
    if(flush_d==1) begin
    opcode_out<=0;
    immediate_out<=0;
    funct3_out<=0;
    funct7_out<=0;
    rs1_out<=0;
    rs2_out<=0;
    rd_out<=0;
    pc_out<=0;
    pc_4_out<=0;
    end
    else if(en==0)begin
    opcode_out<=opcode;
    immediate_out<=immediate;
    funct3_out<=funct3;
    funct7_out<=funct7;
    rs1_out<=rs1;
    rs2_out<=rs2;
    rd_out<=rd;
    pc_out<=pc;
    pc_4_out<=pc_4;
    end
    end
endmodule
