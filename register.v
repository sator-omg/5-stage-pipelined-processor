`include "defines.v"

module register (clock, reset, isWrite, regInput, regOutput);
  input clk, rst, isWrite;
  input [31:0] regInput;
  output reg [31:0] regOutput;

  always @ (posedge clk) begin
    if (rst == 1) regOutput <= 0;
    else if (isWrite) regOutput <= regInput;
  end
endmodule
