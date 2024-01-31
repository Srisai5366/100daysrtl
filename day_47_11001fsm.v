module fsm_11101(input clk,rst,ip,output seq_det);
  reg [2:0] pr_st,nx_st;
  parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
  always @(posedge clk)begin
    if(rst)
      pr_st<=A;
    else
      pr_st<=nx_st;
  end
  assign seq_det=(pr_st==F)?1'b1:1'b0;
  
  always @(pr_st,ip)begin
    case(pr_st)
      A:if(ip==1)
          nx_st<=B;
        else
          nx_st<=A;
      B:if(ip==1)
          nx_st<=C;
        else
          nx_st<=A;
      C:if(ip==1)
          nx_st<=D;
        else
          nx_st<=A;
      D:if(ip==0)
          nx_st<=E;
        else
          nx_st<=D;
      E:if(ip==1)
          nx_st<=F;
        else
          nx_st<=A;
      F:if(ip==1)
          nx_st<=B;
        else
          nx_st<=A;
      default:nx_st<=A;
    endcase
  end
endmodule



module tb;
  reg clk,rst,ip;
  wire seq_det;
  fsm_11101 dut(clk,rst,ip,seq_det);
  always #5 clk = ~clk;
  initial begin
    clk=0;rst=1;
    #10 rst=0;ip=0;
    #10 ip=1;
    #10 ip=1;
    #10 ip=1;
    #10 ip=0;
    #10 ip=1;
    #10 ip=0;
    #10 ip=1;
    #10 ip=1;
    #10 ip=1;
    #10 ip=0;
    #10 ip=1;
    #10 ip=0;
    #150 $finish();
  end
  initial
    $monitor($time,"clk=%b,rst=%b,ip=%b,seq_det=%b",clk,rst,ip,seq_det);
endmodule
