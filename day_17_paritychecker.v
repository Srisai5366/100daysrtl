module paritycheck (input [7:0]din,output oddpar,evenpar);
 assign oddpar=^(din);
 assign evenpar=~^(din);
endmodule



module tb;
 reg [7:0] din;
 wire oddpar,evenpar;
 
 paritycheck ch(din,oddpar,evenpar);
 initial begin
 repeat(10)begin
 din=$random;
 #10;
 end
 #200 $finish();
 end
 initial
 $monitor($time,"din=%b,oddpar=%b,evenpar=%b",din,oddpar,evenpar);
endmodule
