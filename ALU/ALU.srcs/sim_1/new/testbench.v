`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/02 22:16:57
// Design Name: 
// Module Name: testbench
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


module ALU_tb();
    // 定义测试信号
    reg [2:0] OP;
    reg [31:0] A, B;
    wire [31:0] RESULT;
    
    // 实例化 ALU
    ALU uut (
        .OP(OP),
        .A(A),
        .B(B),
        .RESULT(RESULT)
    );
    
    // 测试激励
    initial begin
        // 测试加法 (OP = 000)
        OP = 3'b000; A = 32'h0000_0001; B = 32'h0000_0002; #100;
        if (RESULT !== 32'h0000_0003) $display("ERROR: Add test failed");
        
        // 测试左移 (OP = 001)
        OP = 3'b001; A = 32'h0000_0001; B = 32'h0000_0002; #100;
        if (RESULT !== 32'h0000_0004) $display("ERROR: Shift left test failed");
        
        // 测试传递A (OP = 010)
        OP = 3'b010; A = 32'h1234_5678; B = 32'h0000_0000; #100;
        if (RESULT !== 32'h1234_5678) $display("ERROR: Pass A test failed");
        
        // 测试按位与 (OP = 011)
        OP = 3'b011; A = 32'hFFFF_0000; B = 32'h0000_FFFF; #100;
        if (RESULT !== 32'h0000_0000) $display("ERROR: AND test failed");
        
        // 测试按位或 (OP = 100)
        OP = 3'b100; A = 32'hFFFF_0000; B = 32'h0000_FFFF; #100;
        if (RESULT !== 32'hFFFF_FFFF) $display("ERROR: OR test failed");
        
        // 测试取反 (OP = 101)
        OP = 3'b101; A = 32'hFFFF_FFFF; B = 32'h0000_0000; #100;
        if (RESULT !== 32'h0000_0000) $display("ERROR: NOT test failed");
        
        // 测试异或 (OP = 110)
        OP = 3'b110; A = 32'hFFFF_0000; B = 32'h0000_FFFF; #100;
        if (RESULT !== 32'hFFFF_FFFF) $display("ERROR: XOR test failed");
        
        // 测试完成
        #100 $display("All tests completed");
        $finish;
    end
    
    // 波形输出
    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0, ALU_tb);
    end
    
    // 监控输出
    initial begin
        $monitor("Time=%0t OP=%b A=%h B=%h RESULT=%h", 
                 $time, OP, A, B, RESULT);
    end
endmodule
