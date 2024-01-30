// Code your testbench here
// or browse Examples
`timescale 1 ns/10 ps
module test;
 reg CLK;
 reg Reset;
 reg S;
 reg [7:0] X;
 wire[7:0] sqrt;
 parameter period=10;
  Int_SQRT_Calculator f1(CLK,Reset,S,X,sqrt);
 initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
   forever
begin
    CLK = 1; 
    #period; 

    CLK = 0;
    #period; 
    end
end
initial begin
Reset=1;S=0;
  for(int k=1;k<256;k++)
    begin 
    X=k;         
   S=1;
      #( 2*period);
   S=0;
      #(80*period); 
    end 
  Reset=0;
  S=1;
  X=245;
  #(60*period);
  X=1;
  #(60*period)
  
$finish;  
end
  initial begin
    $monitor("time=%d ,rest=%b, X=%d  , sqrt=%d",$time,Reset,X,sqrt);
     end
endmodule
