module prog_mem (
    input [4:0] address,
    output logic [12:0] Rdata
);

  logic [0:12] mem[30:0];

  initial $readmemh("prog.hex", mem);

  assign Rdata = mem[address];

endmodule
