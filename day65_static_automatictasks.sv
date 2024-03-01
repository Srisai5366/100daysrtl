//Static task
task print();
int i=0;
i++;
$display("The value of i: %0d",i);
endtask
module tb;
initial begin
repeat(5)begin
print();
end
end
endmodule

//Automatic task
task automatic print();
int i;
i++;
$display("The value of the i: %0d",i);
endtask
module tb;
initial begin
repeat(5)begin
print();
end
end
endmodule
