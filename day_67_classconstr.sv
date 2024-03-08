class main;
bit [3:0] addr;
bit [3:0] data;
//constructor
function new(input [3:0]addr,input[3:0] data);
this.addr=addr;
this.data=data;
endfunction
//methods
function void display();
$display("The addr=%0d,data=%0d",addr,data);
endfunction
endclass
module tb;
main m,n;
initial begin
m = new(10,11);
n = new(4,8);
m.display();
n.display();
end
endmodule
