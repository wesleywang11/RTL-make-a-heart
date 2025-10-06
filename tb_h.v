`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg reset;
    wire signal1, signal2, signal3, signal4, signal5;
    wire signal6, signal7, signal8, signal9, signal10;
    wire signal11, signal12;
    // Instantiate the heart_pattern module
    heart_pattern uut (
        .clk(clk),
        .reset(reset),
        .signal1(signal1),
        .signal2(signal2),
        .signal3(signal3),
        .signal4(signal4),
        .signal5(signal5),
        .signal6(signal6),
        .signal7(signal7),
        .signal8(signal8),
        .signal9(signal9),
        .signal10(signal10),
        .signal11(signal11),
        .signal12(signal12)

    );

    // Clock generation
    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;  // 1ns clock period
    end

    // FSDB dump
    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars(0, testbench);
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #2;
        reset = 0;
        
        // Run for test duration
        #500;
        $finish;
    end

endmodule
