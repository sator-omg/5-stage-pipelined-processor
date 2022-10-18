`include "defines.v"

module controller (opCode, branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN, hazard_detected);
  input hazard_detected;
  input [5:0] opCode;
  output reg branchEn;
  output reg [3:0] EXE_CMD;
  output reg [1:0] Branch_command;
  output reg Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN;

  always @ ( * ) begin
    if (hazard_detected == 0) begin
      {branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN} <= 0;
      case (opCode)

        `opcode_add: begin EXE_CMD <= 4'b0000; WB_EN <= 1; end
        `opcode_sub: begin EXE_CMD <= 4'b0010; WB_EN <= 1; end
        `opcode_and: begin EXE_CMD <= 4'b0100; WB_EN <= 1; end
        `opcode_or : begin EXE_CMD <= 4'b0101; WB_EN <= 1; end
        `opcode_nor: begin EXE_CMD <= 4'b0110; WB_EN <= 1; end
        `opcode_xor: begin EXE_CMD <= 4'b0111; WB_EN <= 1; end
        `opcode_sla: begin EXE_CMD <= 4'b1000; WB_EN <= 1; end
        `opcode_sll: begin EXE_CMD <= 4'b1000; WB_EN <= 1; end
        `opcode_sra: begin EXE_CMD <= 4'b1001; WB_EN <= 1; end
        `opcode_srl: begin EXE_CMD <= 4'b1010; WB_EN <= 1; end
        `opcode_addi: begin EXE_CMD <= 4'b0000; WB_EN <= 1; Is_Imm <= 1; end
        `opcode_load: begin EXE_CMD <= 4'b0000; WB_EN <= 1; Is_Imm <= 1; ST_or_BNE <= 1; MEM_R_EN <= 1; end
        `opcode_store: begin EXE_CMD <= 4'b0000; Is_Imm <= 1; MEM_W_EN <= 1; ST_or_BNE <= 1; end

        `opcode_bez: begin EXE_CMD <= 4'b1111; Is_Imm <= 1; Branch_command <= 2'b10; branchEn <= 1; end
        `opcode_bne: begin EXE_CMD <= 4'b1111; Is_Imm <= 1; Branch_command <= 2'b01; branchEn <= 1; ST_or_BNE <= 1; end
        `opcode_j: begin EXE_CMD <= 4'b1111; Is_Imm <= 1; Branch_command <= 2'b10; branchEn <= 1; end
        default: {branchEn, EXE_CMD, Branch_command, Is_Imm, ST_or_BNE, WB_EN, MEM_R_EN, MEM_W_EN} <= 0;
      endcase
    end

    else if (hazard_detected ==  1) begin
      {EXE_CMD, WB_EN, MEM_W_EN} <= 0;
    end
  end
endmodule