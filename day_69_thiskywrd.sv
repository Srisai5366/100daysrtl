class parent_cls;
bit [7:0] p_addr;
bit [7:0] pw_data;
bit wr_en,rd_en;
function new(bit [7:0] p_addr,bit [7:0] pw_data);
this.p_addr=p_addr;
this.pw_data=pw_data;
this.wr_en=1'b1;
this.rd_en=1'b0;
endfunction
function void display();
$display("The values of the
p_addr=%b,pw_data=%0d,wr_en=%b,rd_en=%b",p_addr,pw_data,wr_en,rd_en);
endfunction
endclass
module tb;
parent_cls pa;
initial begin
pa=new(10,28);
pa.display();
end
endmodule
