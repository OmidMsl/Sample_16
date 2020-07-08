library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity zero_filling is
    Port ( imm_in : in STD_LOGIC_VECTOR (8 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end zero_filling;

architecture Behavioral of zero_filling is

begin

imm_out(8 downto 0) <= imm_in;
imm_out(15 downto 9) <= "0000000";

end Behavioral;
