module enco42(en,i,y);
  input [3:0]i;
  input en;
  output reg [1:0]y;
  always @(en,i)begin
    if(en)
      case(i)
        4'b0001:y=0;
        4'b0010:y=1;
        4'b0100:y=2;
        4'b1000:y=3;
        default y=2'bxx;
      endcase
    else
      y=2'bzz;
  end
endmodule

Testbench:
module tbx;
  reg [3:0]i;
  reg en;
  wire [1:0]y;
  enco42 xr(en,i,y);
  initial begin
    en=0;i=4;
    #10 en=1;i=1;
    #10 i=2;
    #10 i=4;
    #10 i=8;
    #60 $finish();
  end
  initial
    $monitor($time,"i=%d,en=%b,y=%d",i,en,y);
endmodule
