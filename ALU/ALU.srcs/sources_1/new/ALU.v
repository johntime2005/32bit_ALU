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
  output reg [SIZE:0] RESULT;

  task fulladder(input a, b, carryin, output sum, output carryout);
    begin
      sum = a ^ b ^ carryin;
      carryout = (a & b) | (a & carryin) | (b & carryin);
    end
  endtask

  task fulladder_32bit(input [SIZE:0] a, b, carryin, output [SIZE:0] sum, output carryout);
    integer i;
    begin
      sum[0]   = a[0] ^ b[0] ^ carryin;
      carryout = (a[0] & b[0]) | (a[0] & carryin) | (b[0] & carryin);
      for (i = 1; i <= SIZE; i = i + 1) begin
        fulladder(a[i], b[i], carryout, sum[i], carryout);
      end    
    end
  endtask
  
  reg carryout;
  always @(*) begin
    case (OP)
      3'b000:
       begin
        fulladder_32bit(A, B, 1'b0, RESULT,carryout);
      end
      3'b001: begin
        RESULT = A<<B;
      end
      3'b010: begin
        RESULT = A[SIZE:0];
      end
      3'b011: begin
        RESULT = A & B;
      end
      3'b100: begin
        RESULT = A | B;
      end
      3'b101: begin
        RESULT = !A;
      end
      3'b110: begin
        RESULT = A ^ B;
      end
    endcase
  end
endmodule
