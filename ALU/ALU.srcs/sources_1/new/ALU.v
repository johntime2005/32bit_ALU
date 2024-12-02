`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/01 19:15:31
// Design Name: 
// Module Name: ALU
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


module ALU (
    OP,
    A,
    B,
    RESULT
);
    parameter SIZE = 31;
    input [2:0] OP;
    input [SIZE:0] A;
    input [SIZE:0] B;
    output [SIZE:0] RESULT;
    
endmodule
