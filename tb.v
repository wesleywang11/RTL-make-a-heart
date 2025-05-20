`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg reset;
    wire signal1;
    wire signal2;
    wire signal3;
    wire signal4;
    wire signal5;
    wire signal6;
    wire signal7;
    wire signal8;
    wire signal9;
    wire signal10;
    wire signal11;
    wire signal12;

    // Instantiate the cross_pattern module
    cross_pattern uut (
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

    // Clock generation - faster clock (1ns period)
    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;  // Toggle every 0.5ns
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
        #2;  // Shorter reset time
        reset = 0;
        
        // Run for longer to see the complete pattern
        #400;  // Run for 200ns
        
        $finish;
    end

endmodule
