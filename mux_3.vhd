library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_3 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           c : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end mux_3;

architecture Behavioral of mux_3 is

begin

process(sel)
  begin
    if(sel="00") then
        o <= a;
    elsif(sel="01") then
        o <= b;
    elsif(sel="10") then
        o <= c;
    else
        o <= x"0000";
    end if;
end process;

end Behavioral;
