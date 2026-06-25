`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 10:58:23
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input clk,
    input w_en_dm,
    input [1:0] dm_cont,
    input [31:0] wd,
    input [31:0] addr,
    output reg [31:0] out 
    );
    reg [7:0] data_mem [255:0];
    always @ (*)
    begin
        out={data_mem[addr+3],data_mem[addr+2],data_mem[addr+1],data_mem[addr]};
    end
    always @ (posedge clk) 
    begin
        if(w_en_dm==1'b1)
        begin
            case(dm_cont)
            0:data_mem[addr]<=wd[7:0];
            1:
            begin
                data_mem[addr]<=wd[7:0];
                data_mem[addr+1]<=wd[15:8];
            end
            2:
            begin
                data_mem[addr]<=wd[7:0];
                data_mem[addr+1]<=wd[15:8];
                data_mem[addr+2]<=wd[23:16];
                data_mem[addr+3]<=wd[31:24];                
            end
            endcase
        end
    end

endmodule
