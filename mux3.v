`include "defines.v"

module mux_3 #(parameter integer LENGTH) (input1, input2, input3, selector, out);
  input [LENGTH-1:0] input1, input2, input3;
  input [1:0] selector;
  output [LENGTH-1:0] out;

  assign out = (selector == 2'd0) ? input1 :
               (selector == 2'd1) ? input2 : input3;
endmodule 