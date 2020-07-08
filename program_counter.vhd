library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity program_counter is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           pc_rst : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end program_counter;

architecture Behavioral of program_counter is

signal temp : STD_LOGIC_VECTOR (15 downto 0):=x"0000";

begin

process(clk)
begin
    if clk='1' and clk'event and pc_rst='0' then
        temp <= input;
    end if;
end process;

output <= temp;
        
end Behavioral;
