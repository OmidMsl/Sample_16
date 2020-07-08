library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_7 is
    Port ( din : in STD_LOGIC_VECTOR (8 downto 0);
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end shift_7;

architecture Behavioral of shift_7 is

begin

dout(15 downto 7) <= din;
dout(6 downto 0) <= "0000000";

end Behavioral;
