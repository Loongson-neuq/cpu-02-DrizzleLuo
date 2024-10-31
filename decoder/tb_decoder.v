module tb_decoder;

reg [2:0] in;
wire [7:0] out;

decoder uut (  // 实例化被测试的译码器模块
    .in(in),
    .out(out)
);

initial begin
    // 生成激励信号进行测试
    in = 3'b000; #10;
    in = 3'b001; #10;
    in = 3'b010; #10;
    in = 3'b011; #10;
    in = 3'b100; #10;
    in = 3'b101; #10;
    in = 3'b110; #10;
    in = 3'b111; #10;
    $stop;  // 结束仿真
end

endmodule
