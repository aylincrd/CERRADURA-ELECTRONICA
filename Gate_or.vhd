--N-bit single and gate
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity Gate_or is
	generic ( n: integer :=1);--<-- nbits
	port(
		A,B,C,D,E,F,G,H,I,J: in std_logic_vector(n-1 downto 0);
		Q: out std_logic_vector(n-1 downto 0));
end Gate_or;

--Architecture
architecture solve of Gate_or is
	-- Signals,Constants,Variables,Components
	begin
		Q<= A or B or C or D or E or F or G or H or I or J;
end solve;