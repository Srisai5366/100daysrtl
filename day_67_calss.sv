class main;
 //properties 
 bit [3:0] addr;
 bit [3:0] data;
 //methods
 function void display();
 $display("addr=%0d,data=%0b",addr,data);
 endfunction
endclass
module tb;
 main m; //handle 
 initial begin
 m = new(); //object
 repeat(5)begin
 m.addr=$random;
 m.data=$random;
 m.display();
 end
 end
endmodule

