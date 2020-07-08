library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity pc_adder is
    Port ( din : in STD_LOGIC_VECTOR (15 downto 0) := x"0000";
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end pc_adder;

architecture Behavioral of pc_adder is

constant a : INTEGER :=2;

begin

dout <= STD_LOGIC_VECTOR(a + unsigned (din));

end Behavioral;
