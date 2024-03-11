class base_cls;
bit [3:0] paddr;
bit [4:0] pdata;
function new(bit [3:0] paddr,bit [3:0] pdata);
this.paddr=paddr;
this.pdata=pdata;
endfunction
function void display();
$display("The base_class values of paddr=%0d,pdata=%0d",paddr,pdata);
endfunction
endclass

class sub_cls extends base_cls;
bit [7:0] pw_data;
bit wr_en,rd_en;
function new(bit [7:0] pw_data,bit wr_en,rd_en);
super.new(4,10);
this.pw_data=pw_data;
this.wr_en=wr_en;
this.rd_en=rd_en;
endfunction
function void display1();
super.display();
$display("The values of sub_class is
paddr=%0d,pdata=%0d,pw_data=%0d,wr_en=%0b,rd_en=%0d",paddr,pdata,pw_data,
wr_en,rd_en);
endfunction
endclass

module tb;
base_cls ba;
sub_cls su;
initial begin
ba=new(2,13);
su=new(24,1,0);
ba.display();
su.display1();
end
endmodul
