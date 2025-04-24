module RAM (
    input Clock,
    input nReset,
    input nw,
    input [2:0] addr1,
    input [2:0] addr2,
    input [7:0] Wdata_ram,
    input [7:0] usr_input,

    output logic [7:0] Rdata1,
    output logic [7:0] Rdata2,
    output logic [7:0] LED
);

  logic [7:0] ram_mem[0:4];

  always_ff @(posedge Clock, negedge nReset)
    if (!nReset) begin
    end else begin
      ram_mem[0] <= usr_input;
      if (!nw) ram_mem[addr1] <= Wdata_ram;
    end
  always_comb begin
    Rdata1 = ram_mem[addr1];
    Rdata2 = ram_mem[addr2];
    LED = ram_mem[3];

  end
endmodule
