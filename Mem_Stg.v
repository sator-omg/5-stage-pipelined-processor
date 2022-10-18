`include "defines.v"

module Mem_Stg (clock, reset, MEM_R_EN, MEM_W_EN, ALU_res, ST_value, dataMem_out);
  input clock, reset, MEM_R_EN, MEM_W_EN;
  input [31:0] ALU_res, ST_value;
  output [31:0]  dataMem_out;

  dataMem dataMem (
    .clock(clock),
    .reset(reset),
    .writeEn(MEM_W_EN),
    .readEn(MEM_R_EN),
    .address(ALU_res),
    .dataIn(ST_value),
    .dataOut(dataMem_out)
  );
endmodule
