module picoMIPS (
    input clk,
    input [9:0] SW,
    output logic [7:0] LED
);

timeunit 1ns; timeprecision 100ps;

  wire [4:0] pc;
  wire [12:0] prog_mem_out;
  wire [7:0] Rdata1_ram;
  wire [7:0] Rdata2_ram;
  wire [7:0] Rdata_rom;
  wire [7:0] alu_mux_out1;
  wire [7:0] alu_mux_out2;
  wire [7:0] ram_mux_out0;
  wire [7:0] result_alu;
  wire [2:0] mult_address_out;
  wire [2:0] mult_address_out2;
  wire alu_flag;
  wire ram_flag;
  wire alu_ctrl;
  wire mult_flag;
  wire nw;
  wire bran;


  RAM ram0 (
      .Clock(clk),
      .nReset(SW[9]),
      .nw(nw),
      .addr1(mult_address_out),
      .addr2(mult_address_out2),
      .Rdata1(Rdata1_ram),
      .Rdata2(Rdata2_ram),
      .Wdata_ram(ram_mux_out0),
      .usr_input(SW[7:0]),
      .LED(LED)
  );

  ROM rom0 (
      .Rdata  (Rdata_rom),
      .address(Rdata2_ram)
  );

  alu alu0 (
      .input1  (alu_mux_out1),
      .input2  (alu_mux_out2),
      .result  (result_alu),
      .alu_ctrl(alu_ctrl)
  );

  alu_mux alu_mux0 (
      .prog_value(prog_mem_out[7:0]),
      .Rdata_rom(Rdata_rom),
      .Rdata1_ram(Rdata1_ram),
      .Rdata2_ram(Rdata2_ram),
      .alu_flag(alu_flag),
      .out1(alu_mux_out1),
      .out2(alu_mux_out2)
  );

  decoder decoder0 (
      .instruction(prog_mem_out[12:11]),
      .alu_flag(alu_flag),
      .ram_flag(ram_flag),
      .alu_ctrl(alu_ctrl),
      .mult_flag(mult_flag),
      .bran(bran),
      .nw(nw)
  );

  prog_mem prog_mem0 (
      .address(pc),
      .Rdata  (prog_mem_out)
  );

  mult_mux mult_mux0 (
      .prog_address(prog_mem_out[10:8]),
      .prog_address2(prog_mem_out[2:0]),
      .address2(mult_address_out2),
      .mult_flag(mult_flag),
      .address(mult_address_out)
  );

  program_counter program_counter0 (
      .Clock(clk),
      .nReset(SW[9]),
      .sw8(SW[8]),
      .bran(bran),
      .is_hold(prog_mem_out[0]),
      .condition(prog_mem_out[1]),
      .pc(pc)
  );

  ram_mux ram_mux0 (
      .ram_flag(ram_flag),
      .result_alu(result_alu),
      .prog_value(prog_mem_out[7:0]),
      .out0(ram_mux_out0)
  );

endmodule
