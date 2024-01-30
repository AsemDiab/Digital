// Code your design here
module Int_SQRT_Calculator (
 input Clk,
 input Reset,
 input S,
 input [7:0] X,
  output reg [7:0] sqrt,
  output reg [2:0]state,
  output reg [7:0]a,
  output reg [8:0]q,
  output reg [7:0]d
 ); 
 reg [2:0] Current_State, Next_State;
parameter T0 = 3'b000, T1 = 3'b001, T2 = 3'b010, T3 = 3'b011,T4=3'b100;
 // output reg [7:0]a;
  //output reg [7:0]q;
  //output reg [7:0]d;
//************************
  always @( q,a,S,Current_State)
 begin
case (Current_State)
  T0:Next_State=S?T1:T0;
  T1:Next_State = T2;
  T2:Next_State = q>a ? T3:T1;
  T3:  Next_State = T4;
  default: Next_State = T0;
endcase
   state=Current_State;
end
//***********
always @(negedge Reset, posedge Clk)
begin
  if (Reset == 0)begin Current_State <= T0;sqrt=0;end
else Current_State <= Next_State;
end
//*************
always @(posedge Clk)
begin
case (Current_State)
T0: 
  begin
    if(S)
begin
a = X[7:0];
q = 1;
d = 3;
end
  end
T1: q =q+d;
T2: d = d+2;
T3: d=d>>1;
T4:sqrt=d-1;
endcase
end
endmodule