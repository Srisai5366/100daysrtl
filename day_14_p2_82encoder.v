module enco83(en,i,y);
  input [7:0]i;
  input en;
  output reg[2:0]y;
  always @(en,i)begin
    if(en)
      case(i)
        8'b00000001:y=0;
        8'b00000010:y=1;
        8'b00000100:y=2;
        8'b00001000:y=3;
        8'b00010000:y=4;
        8'b00100000:y=5;
        8'b01000000:y=6;
        8'b10000000:y=7;
        default y=3'bxxx;
      endcase
    else
      y=3'bzzz;
  end
endmodule

//Testbench:
module tbx;
  reg [7:0] i;
  reg en;
  wire [2:0]y;
  enco83 dut(en,i,y);
  initial begin
    en=0;i=4;
    #10 en=1;i=32;
    #10 i=64;
    #10 i=128;
    #50 $finish();
  end
  initial
    $monitor($time,"i=%d,en=%b,y=%d",i,en,y);
endmodule
