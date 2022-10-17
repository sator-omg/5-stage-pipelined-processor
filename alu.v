`include "defines.v"

module alu (input1, input2, operand, aluOutput);
  input [31:0] input1, input2;
  input [3:0] operand;
  output reg [31:0] aluOutput;

  always @ ( * ) begin
    case (operand)
      4'b0000: aluOutput <= input1 + input2;
      4'b0010: aluOutput <= input1 - input2;
      4'b0100: aluOutput <= input1 & input2;
      4'b0101: aluOutput <= input1 | input2;
      4'b0110: aluOutput <= ~(input1 | input2);
      4'b0111: aluOutput <= input1 ^ input2;
      4'b1000: aluOutput <= input1 << input2;
      4'b1000: aluOutput <= input1 <<< input2;
      4'b1001: aluOutput <= input1 >> input2;
      4'b1010: aluOutput <= input1 >>> input2;
      default: aluOutput <= 0;
    endcase
  end
endmodule
