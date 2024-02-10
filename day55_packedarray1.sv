module tb;
 logic [1:0][7:0]data=16'h1ab9;
 logic [1:0][7:0]value;
 initial begin
 $display("The array elements are:");
 foreach(data[i])begin
 $write("%0h",data[i]);
 end
 value=data;//copying data array to value array
 $display();
 $display("after asigning the elements in value array is:");
 foreach(value[i])begin
 $write("%0h",value[i]);
 end
 data[1]=value[0];//slicing 
 $display();
 $display("After the operation slicing");
 $display("-----DATA ARRAY ITEMS------");
 foreach(data[i])begin
 $write("%0h",data[i]);
 end
 $display();
 $display("-----VALLUE ARRAY ITEMS-----");
 foreach(value[i])begin
 $write("%0h",value[i]);
 end
 end
endmodule
