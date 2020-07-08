library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity alu is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           alu_opr : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0));
end alu;

architecture Behavioral of alu is

begin

process(alu_opr)
begin
    if alu_opr='0' then
        s <= STD_LOGIC_VECTOR(unsigned(a)+unsigned(b));
    else
        s <= STD_LOGIC_VECTOR(unsigned(a)-unsigned(b));
    end if;
end process;

end Behavioral;
