library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity rd_mux_3 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (2 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0));
end rd_mux_3;

architecture Behavioral of rd_mux_3 is

begin

process(sel)
  begin
    if(sel="00") then
        o <= a;
    elsif(sel="01") then
        o <= b;
    elsif(sel="10") then
        o(2 downto 0) <= c;
        o(3) <= '0';
    else
        o <= "XXXX";
    end if;
end process;

end Behavioral;
