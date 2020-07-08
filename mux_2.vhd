library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
end mux_2;

architecture Behavioral of mux_2 is

begin

process(sel)
  begin
    if (sel='0') then
        o <= a;
    else
        o <= b;
    end if;
end process;

end Behavioral;
