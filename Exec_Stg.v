`include "defines.v"

module Exec_Stg (clock, EXE_CMD, val1_sel, val2_sel, ST_val_sel, val1, val2, ALU_res_MEM, result_WB, ST_value_in, ALUResult, ST_value_out);
  input clock;
  input [1:0] val1_sel, val2_sel, ST_val_sel;
  input [3:0] EXE_CMD;
  input [31:0] val1, val2, ALU_res_MEM, result_WB, ST_value_in;
  output [31:0] ALUResult, ST_value_out;

  wire [31:0] ALU_val1, ALU_val2;

  mux_3 #(.LENGTH(32)) mux_val1 (
    .input1(val1),
    .input2(ALU_res_MEM),
    .input3(result_WB),
    .selector(val1_sel),
    .out(ALU_val1)
  );

  mux_3 #(.LENGTH(32)) mux_val2 (
    .input1(val2),
    .input2(ALU_res_MEM),
    .input3(result_WB),
    .selector(val2_sel),
    .out(ALU_val2)
  );

  mux_3 #(.LENGTH(32)) mux_ST_value (
    .input1(ST_value_in),
    .input2(ALU_res_MEM),
    .input3(result_WB),
    .selector(ST_val_sel),
    .out(ST_value_out)
  );

  ALU ALU(
    .val1(ALU_val1),
    .val2(ALU_val2),
    .EXE_CMD(EXE_CMD),
    .aluOut(ALUResult)
  );
endmodule // EXEStage
