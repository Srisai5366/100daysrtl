module jkff (input clk,rst,j,k,output reg q,output qbar);
 always @(posedge clk)begin
 if(rst)begin
 q<=0;
 end
 else
 case({j,k})
 2'b00:q<=q;
 2'b01:q<=0;
 2'b10:q<=1;
 2'b11:q<=~q;
 default q<=0;
 endcase
 end
 assign qbar=~q;
endmodule


module tbx;
 reg clk,rst,j,k;
 wire q,qbar;
 always #5 clk=~clk;
 jkff txt(clk,rst,j,k,q,qbar);
 initial begin
 clk=0;rst=1;
 #10 rst=0;
 j=0;k=0;
 #10 j=0;k=1;
 #10 j=1;k=0;
 #10 j=1;k=1;
 #50 $finish();
 end
 initial
 $monitor($time,"clk=%b,rst=%b,j=%b,k=%b,q=%b,qbar=%b",clk,rst,j,k,q,qbar);
endmodule
