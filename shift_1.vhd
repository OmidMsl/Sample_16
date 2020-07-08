library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_1 is
    Port ( din : in STD_LOGIC_VECTOR (15 downto 0);
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end shift_1;

architecture Behavioral of shift_1 is

begin

dout(15 downto 1) <= din(14 downto 0);
dout(0) <= '0';

end Behavioral;
