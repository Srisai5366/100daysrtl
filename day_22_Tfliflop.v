module tff(input clk,rst,t,output reg q);
  always @(posedge clk)begin
    if(rst)
      q<=0;
    else
      case(t)
        1'b0:q<=q;
        1'b1:q<=~q;
      endcase
  end
endmodule



module tb();
  reg clk,rst,t;
  wire q;
  tff fp(clk,rst,t,q);
  always #5 clk=~clk;
  initial begin
    clk=0;
    rst=1;t=0;
    #10 rst=0;
    #10 t=0;
    #10 t=1;
    #40 $finish();
  end
  initial
    $monitor($time,"clk=%b,rst=%b,t=%b,q=%b",clk,rst,t,q);
endmodule
