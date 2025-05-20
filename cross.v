module cross_pattern (
    input wire clk,
    input wire reset,
    output reg signal1,
    output reg signal2,
    output reg signal3,
    output reg signal4,
    output reg signal5,
    output reg signal6,
    output reg signal7,
    output reg signal8,
    output reg signal9,
    output reg signal10,
    output reg signal11,
    output reg signal12
);

    reg toggle;
    reg [7:0] counter;

    // Toggle signal for blinking effect
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            toggle <= 0;
            counter <= 0;
        end else begin
            toggle <= ~toggle;
            if (counter < 8'd60) begin  // Stop counting at 60
                counter <= counter + 1;
            end
        end
    end

    // Cross pattern generation
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            signal1 <= 0;
            signal2 <= 0;
            signal3 <= 0;
            signal4 <= 0;
            signal5 <= 0;
            signal6 <= 0;
            signal7 <= 0;
            signal8 <= 0;
            signal9 <= 0;
            signal10 <= 0;
            signal11 <= 0;
            signal12 <= 0;

        end else begin
            // toggle only between time 20-40
            signal1 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal2 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal7 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal8 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal9 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal10 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal11 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            signal12 <= (counter >= 8'd20 && counter <= 8'd40) ? toggle : 1'b0;
            
            // toggle continuously until counter reaches 60
            signal3 <= (counter < 8'd60) ? toggle : 1'b0;
            signal4 <= (counter < 8'd60) ? toggle : 1'b0;
            signal5 <= (counter < 8'd60) ? toggle : 1'b0;
            signal6 <= (counter < 8'd60) ? toggle : 1'b0;
        end
    end

endmodule
