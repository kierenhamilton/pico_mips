module prog_mem (
    input address,
    output logic Rdata
);

  logic [] mem[];

  initial $readmemh("wave.hex", mem);

endmodule
