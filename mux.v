`include "defines.v"

module mux #(parameter integer LENGTH) (input1, input2, selector, out);
  input selector;
  input [LENGTH-1:0] input1, input2;
  output [LENGTH-1:0] out;

always@(*) begin
  if (selector==1'b1) begin
   assign out = input2;
  end 
  else begin 
   assign out = input1;
  end
end

endmodule