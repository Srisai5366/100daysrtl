module asary;
 int arr[int];
 initial begin
 arr[0]=1;
 arr[1]=2;
 arr[2]=3;
 arr[3]=4;
 arr[4]=5;
 $display("arr is %0p",arr);
 $display("The size of the array is %0d",$size(arr));
 $display("The elements of the arr is:");
 foreach(arr[i])begin
 $write("%0d ",arr[i]);
 end
 end
endmodule

module tb;
 int arr[string];
 initial begin
 arr["A"]=10;
 arr["B"]=21;
 arr["C"]=32;
 arr["D"]=12;
 arr["E"]=33;
 arr["F"]=12;
 $display("The size of the array %0d",$size(arr));
 $display("The elements of the array is:");
 foreach(arr[i])begin
 $display("index=%0s-->value=%0d",i,arr[i]);
 end
 end
endmodule
