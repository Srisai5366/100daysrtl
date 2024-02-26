module strct;
 struct{
 string name;
 int id;
 bit[31:0] salary;
 }employee;
 initial begin
 employee.name="Liked in";
 employee.id=10;
 employee.salary='h1234; 
 /* OR
 employee = '{"linked in",10,'h1234}; */
 $display("Employee: %0p",employee);
 $display("name: %0s\nid: %0d\nsalary: %0h
\n",employee.name,employee.id,employee.salary);
 end
endmodule

typedef struct packed{
 bit [31:0] addr;
 int value;
 bit [15:0] wdata;
 byte data;
 }packet;
module strctb;
 initial begin
 packet p1,p2;
 p1.addr = 'h12d3;
 p1.value = 31;
 p1.wdata = 'h2e;
 p1.data = 8'b10101011;
 $display("The packed structure packet1 is: %0p",p1);
 $display("Addr: %0h\nvalue: %0d\nwdata: %0h\ndata:
%0b",p1.addr,p1.value,p1.wdata,p1.data);
 p2.addr='h12c1;
 p2.wdata='hc3;
 p2.value=21;
 $display("The packed structure packet2 is: %0p",p2);
 $display("Addr: %0h\nvalue: %0d\nwdata: %0h\ndata:
%0b",p2.addr,p2.value,p2.wdata,p2.data); 
 end
endmodule
          
