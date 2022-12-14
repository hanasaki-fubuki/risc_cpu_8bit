LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY CTRL_CTR IS
 PORT(ADDR_N:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      OP_CODE:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      CLK:IN STD_LOGIC;
      M_ADDR:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
END CTRL_CTR;
ARCHITECTURE BEHAV OF CTRL_CTR IS
 
 BEGIN
 PROCESS(ADDR_N,CLK)
  BEGIN
   IF CLK='1' AND CLK'EVENT THEN
    IF ADDR_N="1111" THEN  --P
     CASE OP_CODE IS
     WHEN "0000"=>M_ADDR<="0010"; --IN
     WHEN "0001"=>M_ADDR<="0011"; --ADD
     WHEN "0010"=>M_ADDR<="0110"; --STA
     WHEN "0011"=>M_ADDR<="1000"; --OUT
     WHEN "0100"=>M_ADDR<="1001"; --MOV
     WHEN "0101"=>M_ADDR<="1010"; --SUB
     WHEN OTHERS=>M_ADDR<="0000";
     END CASE;
    ELSE
    M_ADDR<=ADDR_N;
    END IF;
   END IF;
 END PROCESS;
END BEHAV; 