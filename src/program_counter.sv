module program_counter (
    input Clock,
    input nReset,
    input sw8,
    input bran,
    input is_hold,
    input condition,
    output logic [4:0] pc
);

  timeunit 1ns; timeprecision 100ps;

  always_ff @(posedge Clock, negedge nReset)
    if (!nReset) pc <= 0;
    else begin
      case ({bran, is_hold})
        2'b10: pc <= 0;
        2'b11: if (sw8 == condition) pc <= pc + 5'd1;
        default: pc <= pc + 5'd1;
      endcase
    end


endmodule
