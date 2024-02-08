module tb;
bit[8*15:1]message;
string str;
initial begin
message ="Hello linked In";
str="This is strings";
$display("The message is: %s",message);
$display("The str is: %s",str);
$display("----------------------");
$display("characters in the string:");
foreach(str[i])begin
$write("%c ",str[i]);
end
end
endmodule

module tb;
string name;
string vow="aeiouAEIOU";
int cnt;
initial begin
cnt=0;
name="Linked In";
foreach(name[i])begin
foreach(vow[j])begin
if(name[i]==vow[j])
cnt++;
end
end
$display("no of vowels in name: [%s] is: %0d",name,cnt);
end
endmodule
