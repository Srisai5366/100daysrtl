module fsm_1001(input clk,rst,ip,output seq_det);
 reg [2:0] pr_st,nx_st;
 parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
 always @(posedge clk)begin
 if(rst)
 pr_st<=s0;
 else
 pr_st<=nx_st;
 end
 assign seq_det=(pr_st==s4)?1'b1:1'b0;
 always @(pr_st,ip)begin
 case(pr_st)
 s0:if(ip==1)
 nx_st<=s1;
 else
 nx_st<=s0;
 s1:if(ip==0)
 nx_st<=s2;
 else
 nx_st<=s1;
 s2:if(ip==0)
 nx_st<=s3;
 else
 nx_st<=s1;
 s3:if(ip==1)
 nx_st<=s4;
 else
 nx_st<=s0;
 s4:if(ip==0)
 nx_st<=s2;
 else
 nx_st<=s1;
 default:nx_st<=s0;
 endcase
 end
endmodule


module tb;
 reg clk,rst,ip;
 wire seq_det;
 fsm_1001 dut(clk,rst,ip,seq_det);
 always #5 clk=~clk;
 initial begin
 clk=0;rst=1;
 #10 rst=0;ip=0;
 #10 ip=1;
 #10 ip=0;
 #10 ip=0;
 #10 ip=1;
 #10 ip=0;
 #10 ip=0;
 #10 ip=1;
 #10 ip=0;
 #10 ip=0;
 #10 ip=1;
 #10 ip=0;
 #150 $finish();
 end
 initial 
 $monitor($time,"clk=%b,rst=%b,ip=%b,seq_det=%b",clk,rst,ip,seq_det);
endmodule
