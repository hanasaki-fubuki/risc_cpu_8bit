LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY ALU181 IS
PORT ( S  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0 );
	A, B  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	F  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ALU181;
ARCHITECTURE behav OF ALU181 IS
	SIGNAL A9, B9, F9 : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
	A9 <= '0' & A ;  B9 <= '0' & B ;
	PROCESS(A9,B9)
		BEGIN
			CASE S  IS
				WHEN "000"=>F9<= A9;
				WHEN "001"=>F9<= A9 + B9;
				WHEN "101"=>F9<= A9 - B9;
				WHEN OTHERS  =>F9<= "000000000" ;
			END CASE;
		END PROCESS;
	F<= F9(7 DOWNTO 0) ;
	
END behav;