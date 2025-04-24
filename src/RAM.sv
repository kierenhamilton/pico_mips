module RAM (
    input Clock,
    input nReset,
    input [2:0] address,
    input [7:0] Wdata,
    input [7:0] sswitch,
    input rw,
    output logic [7:0] Rdata
);

  logic [8:0] ram[0:4];

  always_ff @(posedge Clock, negedge nReset)
    if (!nReset) begin
    end else begin

    end

endmodule
