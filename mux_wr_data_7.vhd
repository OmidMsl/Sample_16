library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_wr_data_7 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           c : in STD_LOGIC_VECTOR (15 downto 0);
           d : in STD_LOGIC_VECTOR (15 downto 0);
           e : in STD_LOGIC_VECTOR (15 downto 0);
           f : in STD_LOGIC_VECTOR (15 downto 0);
           g : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end mux_wr_data_7;

architecture Behavioral of mux_wr_data_7 is

begin

process(sel)
  begin
    if(sel="000") then
        o <= a;
    elsif(sel="001") then
        o <= b;
    elsif(sel="010") then
        o <= c;
    elsif(sel="011") then
        o <= d;
    elsif(sel="100") then
        o <= e;
    elsif(sel="101") then
        o <= f;
    elsif(sel="110") then
        o <= g;
    else
        o <= x"0000";
    end if;
end process;

end Behavioral;
