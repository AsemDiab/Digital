library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Transition_Calculatoris
 port( CLK, Load, Clear : in std_logic;
 Data : in std_logic_vector(9 downto 0);
 Count : out std_logic_vector(3 downto 0));
end Transition_Calculator;
architecture behavioral of Transition_Calculator is
type state is (S0,S1,S2,S3);
signal currstate:state:=S0;
signal nextstate:state;
signal co:std_logic(3 downto 0);
begin
--process to select nextsate 
process(currstate,enable,clk,clear)
begin
case currstate is
when s0=>
if clk'event and clk='1' then 
if load='0' then nextstate<=s0;
elsif load='1' then nextstate<=S1;
end if ;end if;
when S1 =>
if enable='0' then nextstate<=s1;
elsif enable='1' then nextstate<=s2; 
end if;
when s2=> nextstate<=s3;
when s3=> nextstate<=s0;
end case;
end process
----------------
---process to change output & state
process(clear,clk)
begin
if clear ='0' then
currstate<=S0;
elsif clk'event and clk='1' then
if load='1'then data<=input;endif
if currstate=s1 then E=data(9);end if;
if currstate=s2 then data<=data sll 1;end if;
if(E /= data(9)) co<=co+1; end if;
currstate<=nextsate;
end process;
process (co)
begin
Count<=co;
end process;
end ;