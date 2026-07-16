`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 12:38:59
// Design Name: 
// Module Name: controlunit
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


module controlunit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] alu_cont,
    output reg [1:0] dm_cont,
    output reg [2:0] extend_cont_2,
    output reg [2:0] extend_cont_1,
    output reg w_en_rf,
    output reg r2_im,
    output reg w_en_dm,
    output reg alu_dm,
    output reg [1:0] alu_pc_4,
    output reg [1:0] pcmux_cont
    );
    always @(*)
    
    begin
        case(opcode)
        7'b0110011:
        begin
            w_en_rf=1;
            r2_im=0;
            w_en_dm=0;
            alu_dm=0;
            alu_pc_4=0;
            pcmux_cont=0;
            case(funct3)
            0:
            begin
                if(funct7==7'h00)begin
                    alu_cont=4'd0;
                end
                else if(funct7==7'h20)begin
                    alu_cont=4'd1;
                end
            end
            4:alu_cont=4'd2;
            6:alu_cont=4'd3;
            7:alu_cont=4'd4;
            1:alu_cont=4'd5;
            5:
            begin
                if(funct7==7'h00)begin
                    alu_cont=4'd6;
                end
                else if(funct7==7'h20)begin
                    alu_cont=4'd7;
                end
            end
            2:alu_cont=4'd8;
            3:alu_cont=4'd9;
            endcase
        end
        7'b0010011:
        begin
            w_en_rf=1;
            r2_im=1;
            w_en_dm=0;
            alu_dm=0;
            alu_pc_4=0;
            pcmux_cont=0; 
            extend_cont_1=0; 
            case(funct3)
            0:
            begin
                alu_cont=0; 
                extend_cont_1=0;
            end
            4:
            begin
                alu_cont=2; 
                extend_cont_1=0;
            end 
            6:
            begin
                alu_cont=3; 
                extend_cont_1=0;
            end 
            7:
            begin
                alu_cont=4; 
                extend_cont_1=0;
            end  
            1:
            begin
                alu_cont=5; 
                extend_cont_1=0;
            end  
            5:
            begin
                if(funct7==7'h00) begin
                    alu_cont=6;
                    extend_cont_1=0;
                end
                else if(funct7==7'h20) begin
                    alu_cont=7;
                    extend_cont_1=5;
                end
            end
            2:
            begin
                alu_cont=8; 
                extend_cont_1=0;
            end 
            3:
            begin
                alu_cont=9; 
                extend_cont_1=0;
            end                     
            endcase            
        end
        7'b0000011:
        begin
            w_en_rf=1;
            r2_im=1;
            w_en_dm=0;
            alu_dm=1;   
            alu_pc_4=0;
            pcmux_cont=0; 
            extend_cont_1=0; 
            case(funct3)
            0:
            begin
                alu_cont=0;
                extend_cont_2=1;
                extend_cont_1=0;
            end
            1:
            begin
                alu_cont=0;
                extend_cont_2=2;
                extend_cont_1=0;
            end
            2:
            begin
                alu_cont=0;
                extend_cont_2=0;
                extend_cont_1=0;
            end 
            4:
            begin
                alu_cont=0;
                extend_cont_2=3;
                extend_cont_1=0;
            end  
            5:
            begin
                alu_cont=0;
                extend_cont_2=4;
                extend_cont_1=0;
            end        
            endcase          
        end
        7'b0100011:
        begin
            w_en_rf=0;
            r2_im=1;
            w_en_dm=1;
            // alu_dm=0;
            // alu_pc_4=0;
            pcmux_cont=0;
            extend_cont_1=1;
            case(funct3)
            0:
            begin
                alu_cont=0;
                dm_cont=0;
                extend_cont_1=1;
            end
            1:
            begin
                alu_cont=0;
                dm_cont=1;
                extend_cont_1=1;
            end 
            2:
            begin
                alu_cont=0;
                dm_cont=2;
                extend_cont_1=1;
            end
            endcase
        end
        7'b1100011:
        begin
            w_en_rf=0;
            r2_im=0;
            w_en_dm=0;
            extend_cont_1=2;
            // alu_dm=0;
            // alu_pc_4=0;
            pcmux_cont=2;
            case(funct3)
            0:
            begin
                alu_cont=4'd10;
                extend_cont_2=2;
            end
            1:
            begin
                alu_cont=4'd11;
                extend_cont_2=2;
            end 
            4:
            begin
                alu_cont=4'd8;
                extend_cont_2=2;
            end
            5:
            begin
                alu_cont=4'd12;
                extend_cont_2=2;
            end
            6:
            begin
                alu_cont=4'd9;
                extend_cont_2=2;
            end
            7:
            begin
                alu_cont=4'd13;
                extend_cont_2=2;
            end
            endcase
        end
        7'b1101111:
        begin
            w_en_rf=1;
            // r2_im=0;
            w_en_dm=0;
            // alu_dm=0;
            alu_pc_4=1;
            pcmux_cont=3;
            extend_cont_1=4;
        end
        7'b1100111:
        begin
            w_en_rf=1;
            r2_im=1;
            w_en_dm=0;
            // alu_dm=0;
            alu_pc_4=1;
            pcmux_cont=1;
            alu_cont=0;
            extend_cont_1=0;
        end
        7'b0110111:
        begin
            w_en_rf=1;
            // r2_im=0;
            w_en_dm=0;
            alu_dm=0;
            alu_pc_4=3;
            pcmux_cont=0;
            extend_cont_1=3;
        end
        7'b0010111:
        begin
            w_en_rf=1;
            // r2_im=0;
            w_en_dm=0;
            // alu_dm=0;
            alu_pc_4=2;
            pcmux_cont=0;
            extend_cont_1=3;
        end
        endcase
    end
endmodule
