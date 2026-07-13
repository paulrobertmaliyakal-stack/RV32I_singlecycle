`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 21:20:28
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [31:0] PC_IN,
    output reg  [6:0] opcode,
    output reg [24:0] immediate,
    output reg [2:0] funct3,
    output reg [6:0] funct7,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd,
    input CLK
    );
    reg [7:0] Instr_Mem [255:0];
    initial begin 
    $readmemh("instructions.hex",Instr_Mem);
    $display("mem[0] = %h",Instr_Mem[0]);
    end
    always @(*)
    begin
    opcode=Instr_Mem[PC_IN+3][6:0];
    immediate={Instr_Mem[PC_IN],Instr_Mem[PC_IN+1],Instr_Mem[PC_IN+2],Instr_Mem[PC_IN+3][7]};
    funct3=Instr_Mem[PC_IN+2][6:4];
    funct7=Instr_Mem[PC_IN][7:1];
    rd={Instr_Mem[PC_IN+2][3:0],Instr_Mem[PC_IN+3][7]};
    rs1={Instr_Mem[PC_IN+1][3:0],Instr_Mem[PC_IN+2][7]};
    rs2={Instr_Mem[PC_IN][0],Instr_Mem[PC_IN+1][7:4]};
        //INSTR_OUT={Instr_Mem[PC_IN+3],Instr_Mem[PC_IN+2],Instr_Mem[PC_IN+1],Instr_Mem[PC_IN]};
    end
endmodule
