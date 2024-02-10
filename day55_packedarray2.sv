module pack_data;
reg [3:0][7:0]data=32'hea12_12ea;
reg [3:0][7:0]addr;
initial begin
$display("The data items are:");
foreach(data[i])begin
$write("%0h ",data[i]);
end
$display();
addr=data;
$display("The addr items are:");
foreach(addr[i])begin
$write("%0h ",addr[i]);
end
$display();
if(data==addr)
$display("Both data and addr array are equal");
else
$display("Both data and addr array are not equal");
end
endmodule
