--Synchronous Sequential Machine
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity mss is
	port(
		resetn,clk: in std_logic;
		start,ORteclado,P,ClaveAdmin,ClaveCorrecta: in std_logic;
		TresErrores,Minuto,Mayor0: in std_logic;
		est: out std_logic_vector(5 downto 0);
		eRegAdmin,eReg1,eReg2,eReg3,eReg4: out std_logic;
		eCntRAM,eCntErrores,eTemp: out std_logic;
		resRegAdmin,resReg1,resReg2,resReg3,resReg4: out std_logic;
		resCntRAM,resCntErrores,resTemp: out std_logic;
		wr,sel,Puerta,Error,Alarma: out std_logic);
end mss;

--Architecture
architecture solve of mss is
	-- Signals,Constants,Variables,Components
	type estado is (s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,
	s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35);
	signal y: estado;
	begin
	--Process #1: Next state decoder and state memory
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn = '0' then y<= s1;
			elsif (clk'event and clk = '1') then
				case y is
					when s1 => 
							  if start = '1' then y <= s2;
							  else y <= s1; end if;						  
					when s2 => 
							  if start = '0' then y <= s3;
							  else y <= s2; end if;
					when s3 => 
								if ORteclado = '1' then y <= s4;
								else y <= s3; end if;
					when s4 => 
								if ORteclado = '0' then y <= s5;
								else y <= s4; end if;
					when s5 => 
								if ORteclado = '1' then y <= s6;
								else y <= s5; end if;
					when s6 => 
								if ORteclado = '0' then y <= s7;
								else y <= s6; end if;
					when s7 => 
								if ORteclado = '1' then y <= s8;
								else y <= s7; end if;
					when s8 => 
								if ORteclado = '0' then y <= s9;
								else y <= s8; end if;
					when s9 => 
								if ORteclado = '1' then y <= s10;
								else y <= s9; end if;
					when s10 => 
								if ORteclado = '0' then y <= s11;
								else y <= s10; end if;
					when s11 => y <= s12;
					when s12 => 
								if ClaveAdmin = '1' then y <= s13;
								elsif ClaveAdmin ='0' and ClaveCorrecta = '1' then y <= s29;
								elsif ClaveAdmin ='0' and ClaveCorrecta = '0' then y <= s30;
								else y <= s12; end if;
					when s13 => if Mayor0 = '1' then y <= s14;
									else y <= s15; end if;
					when s14 => y <= s15;
					when s15 => 
								if P = '1' then y <= s16;
								else y <= s15; end if;
					when s16 => 
								if P = '0' then y <= s17;
								else y <= s16; end if;
					when s17 => 
								if ORteclado = '1' then y <= s18;
								else y <= s17; end if;
					when s18 => 
								if ORteclado = '0' then y <= s19;
								else y <= s18; end if;
					when s19 => 
								if ORteclado = '1' then y <= s20;
								else y <= s19; end if;
					when s20 => 
								if ORteclado = '0' then y <= s21;
								else y <= s20; end if;
					when s21 => 
								if ORteclado = '1' then y <= s22;
								else y <= s21; end if;
					when s22 => 
								if ORteclado = '0' then y <= s23;
								else y <= s22; end if;
					when s23 => 
								if ORteclado = '1' then y <= s24;
								else y <= s23; end if;
					when s24 => 
								if ORteclado = '0' then y <= s25;
								else y <= s24; end if;
					when s25 => 
								if P = '1' then y <= s26;
								else y <= s25; end if;
					when s26 => 
								if P = '0' then y <= s27;
								else y <= s26; end if;
					when s27 => y <= s28;
					when s28 => y <= s3;
					when s29 => y <= s3;
					when s30 => y <= s31;
					when s31 =>
								if ClaveCorrecta ='1' then y <= s29;
								else y <= s32; end if;
					when s32 => y <= s33;
					when s33 =>
								if ClaveCorrecta ='1' then y <= s29;
								else y <= s34; end if;
					when s34 =>
								if TresErrores ='1' then y <= s35;
								else y <= s3; end if;
					when s35 =>
								if Minuto ='1' then y <= s3;
								else y <= s35; end if;
				end case;
			end if;
	end process;
	--Process #2: Output decoder
	process(y)-- mealy ->(y,d,n)
	--Sequential programming
		begin
			eRegAdmin<='0';eReg1<='0';eReg2<='0';eReg3<='0';eReg4<='0';
			eCntRAM<='0';eCntErrores<='0';eTemp<='0';
			resRegAdmin<='0';resReg1<='0';resReg2<='0';resReg3<='0';resReg4<='0';
			resCntRAM<='0';resCntErrores<='0';resTemp<='0';
			Puerta<='0';Error<='0';Alarma<='0';wr<='0';sel<='0';
			case y is
				when s1 => est<="000001";resRegAdmin<='1';resReg1<='1';resReg2<='1';resReg3<='1';resReg4<='1';
				resCntRAM<='1';resCntErrores<='1';resTemp<='1';
				when s2 => eRegAdmin<='1';est<="000010";
				when s3 => wr<='1';resTemp<='1';eReg1<='1';est<="000011";
				when s4 => est<="000100";
				when s5 => eReg2<='1';est<="000101";
				when s6 => est<="000110";
				when s7 => eReg3<='1';est<="000111";
				when s8 => est<="001000";
				when s9 => eReg4<='1';est<="001001";
				when s10 => est<="001010";
				when s11 => eCntRAM<='1';est<="001011";
				when s12 => est<="001100";
				when s13 => est<="001101";
				when s14 => eCntRAM<='1';est<="001110";
				when s15 => est<="001111";
				when s16 => est<="010000";
				when s17 => eReg1<='1';est<="010001";
				when s18 => est<="010010";
				when s19 => eReg2<='1';est<="010011";
				when s20 => est<="010100";
				when s21 => eReg3<='1';est<="010101";
				when s22 => est<="010110";
				when s23 => eReg4<='1';est<="010111";
				when s24 => est<="011000";
				when s25 => est<="011001";
				when s26 => est<="011010";
				when s27 => wr<='1';sel<='1';est<="011011";
				when s28 => resCntRAM<='1';est<="011100";
				when s29 => Puerta<='1';resCntRAM<='1';est<="011101";
				when s30 => est<="011110";
				when s31 => eCntRAM<='1';est<="011111";
				when s32 => est<="100000";
				when s33 => eCntRAM<='1';est<="100001";
				when s34 => resCntRAM<='1';Error<='1';eCntErrores<='1';est<="100010";
				when s35 => eTemp<='1';Alarma<='1';est<="100011";				
			end case;
	end process;
	--Process #n... 
end solve;