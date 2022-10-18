`include "defines.v"

module sign_extension (input_, out);
  input [15:0] input_;
  output [31:0] out;

  assign out = (input_[15] == 1) ? {16'b1111111111111111, in} : {16'b0000000000000000, in};
endmodule 
