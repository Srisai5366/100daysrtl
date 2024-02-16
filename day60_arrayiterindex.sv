module arrindexque;
int arr[];
int qu[$];
initial begin
arr=new[5];
arr='{0,1,4,3,5};
$display("----------------------------");
qu=arr.find(x) with (x==x.index);
$display("The element equal to index is %0p",qu);
qu=arr.find with (item != item.index);
$display("The elements not equal to index is %0p",qu);
$display("---------------------------");
end
endmodule
