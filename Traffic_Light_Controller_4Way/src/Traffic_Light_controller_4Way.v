`timescale 1ns / 1ps
module Traffic_Light_Controller_4way #(
    parameter integer SEC7 = 70,    // default: 70 clock cycles
    parameter integer SEC2 = 20     // default: 20 clock cycles
)(
    input clk, rst,
    output reg [2:0] light_N,
    output reg [2:0] light_E,
    output reg [2:0] light_S,
    output reg [2:0] light_W
);
    // states
    parameter S1=0, S2=1, S3=2, S4=3, S5=4, S6=5, S7=6, S8=7;
    reg [3:0] ps;
    reg [15:0] count; // wider to hold larger counts

    // FSM transitions
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= S1;
            count <= 0;
        end else begin
            case (ps)
                S1: if (count < SEC7-1) count <= count + 1; else begin ps <= S2; count <= 0; end
                S2: if (count < SEC2-1) count <= count + 1; else begin ps <= S3; count <= 0; end
                S3: if (count < SEC7-1) count <= count + 1; else begin ps <= S4; count <= 0; end
                S4: if (count < SEC2-1) count <= count + 1; else begin ps <= S5; count <= 0; end
                S5: if (count < SEC7-1) count <= count + 1; else begin ps <= S6; count <= 0; end
                S6: if (count < SEC2-1) count <= count + 1; else begin ps <= S7; count <= 0; end
                S7: if (count < SEC7-1) count <= count + 1; else begin ps <= S8; count <= 0; end
                S8: if (count < SEC2-1) count <= count + 1; else begin ps <= S1; count <= 0; end
                default: begin ps <= S1; count <= 0; end
            endcase
        end
    end

    // outputs (combinational)
    always @(*) begin
        case (ps)
            S1: begin light_N=3'b001; light_E=3'b100; light_S=3'b100; light_W=3'b100; end
            S2: begin light_N=3'b010; light_E=3'b100; light_S=3'b100; light_W=3'b100; end
            S3: begin light_N=3'b100; light_E=3'b001; light_S=3'b100; light_W=3'b100; end
            S4: begin light_N=3'b100; light_E=3'b010; light_S=3'b100; light_W=3'b100; end
            S5: begin light_N=3'b100; light_E=3'b100; light_S=3'b001; light_W=3'b100; end
            S6: begin light_N=3'b100; light_E=3'b100; light_S=3'b010; light_W=3'b100; end
            S7: begin light_N=3'b100; light_E=3'b100; light_S=3'b100; light_W=3'b001; end
            S8: begin light_N=3'b100; light_E=3'b100; light_S=3'b100; light_W=3'b010; end
            default: begin light_N=3'b000; light_E=3'b000; light_S=3'b000; light_W=3'b000; end
        endcase
    end

endmodule