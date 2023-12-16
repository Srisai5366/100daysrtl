module dec24(input e,input [1:0]a,output reg [3:0]y);
 always @(e,a) begin
 if(e)begin
 case(a)
 2'b00:y=4'b0001;
 2'b01:y=4'b0010;
 2'b10:y=4'b0100;
 2'b11:y=4'b1000;
 endcase
 end
 else
 y=4'b0000;
 end
endmodule


module tbx;
 reg e;
 reg [1:0]a;
 wire [3:0]y;
 dec24 dec(e,a,y);
 initial begin
 e=0;
 #10 e=1;a=0;
 #10 a=1;
 #10 a=2;
 #10 a=3;
 #50 $finish();
 end
 initial
 $monitor($time,"e=%b,a=%b,y=%b",e,a,y);
endmodule
