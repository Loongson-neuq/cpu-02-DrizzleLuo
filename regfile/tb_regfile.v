module tb_regfile;

reg clk;
reg [4:0] raddr1, raddr2, waddr;
reg [31:0] wdata;
reg we;
wire [31:0] rdata1, rdata2;
regfile uut (
    .clk(clk),
    .raddr1(raddr1),
    .raddr2(raddr2),
    .waddr(waddr),
    .wdata(wdata),
    .we(we),
    .rdata1(rdata1),
    .rdata2(rdata2)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    we = 0;
    raddr1 = 5'b0;
    raddr2 = 5'b0;
    waddr = 5'b0;
    wdata = 32'b0;

    #10;
    we = 1;
    waddr = 5'b00001;
    wdata = 32'hDEADBEEF;
    #10;
    we = 0;
    #10;

    raddr1 = 5'b00001;
    #10;

    $display("Read data 1: %h", rdata1);

    we = 1;
    waddr = 5'b00010;
    wdata = 32'hCAFEBABE;
    #10;
    we = 0;
    #10;

    raddr2 = 5'b00010;
    #10;

    $display("Read data 2: %h", rdata2);
    $stop;
end

endmodule
