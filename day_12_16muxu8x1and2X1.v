module mux21(input i0,i1,s,output y);
 assign y=s?i1:i0;
endmodule

module mux81(input [7:0]i,input [3:0]s,output reg y);
 always @(*) begin
 case({s})
 3'b000:y=i[0];
 3'b001:y=i[1];
 3'b010:y=i[2];
 3'b011:y=i[3];
 3'b100:y=i[4];
 3'b101:y=i[5];
 3'b110:y=i[6];
 3'b111:y=i[7];
 endcase
 end
endmodule

module mux16(input [15:0]i,input [3:0]s,output y);
 wire y1,y2;
 mux81 m1(i[15:8],s[2:0],y1);
 mux81 m2(i[7:0],s[2:0],y2);
 mux21 m3(y1,y2,s[3],y);
endmodule


module tb ;
 reg [15:0]i;
 reg [3:0]s;
 wire y;
 mux16 mu(i,s,y);
 initial begin
 i=16'd21569;
 s=4'b0000;
 #10 s=4'b0001;
 #10 s=4'b0010;
 #10 s=4'b0011;
 #10 s=4'b0100;
 #10 s=4'b0101;
 #10 s=4'b0110;
 #10 s=4'b0111;
 #10 s=4'b1000;
 #10 s=4'b1001;
 #10 s=4'b1010;
 #10 s=4'b1011;
 #10 s=4'b1100;
 #10 s=4'b1101;
 #10 s=4'b1110;
 #10 s=4'b1111;
 #200 $finish();
 end
 initial
 $monitor($time,"i=%b,s=%b,y=%b",i,s,y);
endmodule
