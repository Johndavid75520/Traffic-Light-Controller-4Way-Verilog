`timescale 1ns/1ps
module tb_Traffic_Light_Controller_4way;
    // Testbench parameters
    parameter CLOCK_PERIOD = 10; // ns (10ns => 100 MHz)
    // We set SEC7 = 70 cycles -> 700 ns green visible in waveform
    parameter DUT_SEC7 = 70;
    parameter DUT_SEC2 = 20;

    reg clk, rst;
    wire [2:0] light_N, light_E, light_S, light_W;

    // Instantiate DUT with parameter overrides
    Traffic_Light_Controller_4way #(
        .SEC7(DUT_SEC7),
        .SEC2(DUT_SEC2)
    ) dut (
        .clk(clk), .rst(rst),
        .light_N(light_N), .light_E(light_E),
        .light_S(light_S), .light_W(light_W)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #(CLOCK_PERIOD/2) clk = ~clk;
    end

    // Reset and controlled start
    initial begin
        rst = 1;
        #(CLOCK_PERIOD*5); // hold reset for 5 clock cycles
        rst = 0;
    end

    // Convenience: print header once
    initial begin
        $display("TB start: CLOCK_PERIOD=%0d ns, SEC7=%0d cycles", CLOCK_PERIOD, DUT_SEC7);
        $monitor("Time=%0t | N=%b E=%b S=%b W=%b | rst=%b", $time, light_N, light_E, light_S, light_W, rst);
    end

    // Run long enough to capture several complete cycles
    initial begin
        #(CLOCK_PERIOD * (DUT_SEC7 + DUT_SEC2) * 10); // run for ~10 state sets
        $finish;
    end

    // Optional: task to wait until a particular state by observing outputs
    // Example usage from interactive run (not called here):
    // wait_for_state(3'b001, 3'b100, 3'b100, 3'b100); // waits for N green
    task wait_for_state;
        input [2:0] n, e, s, w;
        begin
            @(posedge clk);
            while (!(light_N==n && light_E==e && light_S==s && light_W==w)) @(posedge clk);
        end
    endtask

endmodule