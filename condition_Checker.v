`include "defines.v"

module condition_Checker (reg1, reg2, cuBranchComm, brCond);
  input [31: 0] reg1, reg2;
  input [1:0] cuBranchComm;
  output reg brCond;

  always @ ( * ) begin
    case (cuBranchComm)
      2'b10: brCond <= 1;
      2'b11: brCond <= (reg1 == 0) ? 1 : 0;
      2'b01: brCond <= (reg1 != reg2) ? 1 : 0;
      default: brCond <= 0;
    endcase
  end
endmodule