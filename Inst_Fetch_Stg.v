`include "defines.v"

module Inst_Fetch_Stg (clock, reset, branchTaken, branchOffset, freeze, pc, instruction);
  input clock, reset, branchTaken, freeze;
  input [31:0] branchOffset;
  output [31:0] pc, instruction;

  wire [31:0] adderInput1, adderOutput, brOffserTimes4;
  

  assign brOffserTimes4 = branchOffset << 2;

  mux #(.LENGTH(32)) adderInput (
    .input1(32'd4),
    .input2(brOffserTimes4),
    .selector(branchTaken),
    .out(adderInput1)
  );

  pc_adder add_4 (
    .input1(adderInput1),
    .input2(pc),
    .out(adderOutput)
  );

  register PCReg (
    .clock(clock),
    .reset(reset),
    .writeEn(~freeze),
    .regIn(adderOutput),
    .regOut(pc)
  );

  instructionMem instructions (
    .reset(reset),
    .addr(pc),
    .instruction(instruction)
  );
endmodule 
