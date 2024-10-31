module regfile (
    input         clk,
    input  [4:0]  raddr1,
    output [31:0] rdata1,
    input  [4:0]  raddr2,
    output [31:0] rdata2,
    input         we,
    input  [4:0]  waddr,
    input  [31:0] wdata
);
    reg [31:0] rf[31:0];
    always @(posedge clk) begin
        if (we) begin
            rf[waddr] <= wdata;
        end
    end

    // READ OUT 1
    assign rdata1 = rf[raddr1];

    // READ OUT 2
    assign rdata2 = rf[raddr2];

endmodule
