module gray2bin(input [3:0]g,output [3:0]b);
 assign b[3]=g[3];
 assign b[2]=g[3]^g[2];
 assign b[1]=g[3]^g[2]^g[1];
 assign b[0]=g[3]^g[2]^g[1]^g[0];
endmodule


module tb;
reg [3:0] g;
wire [3:0]b;
gray2bin gb(g,b);
initial begin
g=4'b0000;
#5 g=4'b0001;
#5 g=4'b0010;
#5 g=4'b0011;
#5 g=4'b0100;
#5 g=4'b0101;
#5 g=4'b0110;
#5 g=4'b0111;
#5 g=4'b1000;
#5 g=4'b1001;
#5 g=4'b1010;
#5 g=4'b1011;
#5 g=4'b1100;
#5 g=4'b1101;
#5 g=4'b1110;
#5 g=4'b1111;
#100 $finish();
end
initial
$monitor($time,"g=%b,b=%b",g,b);
endmodule
