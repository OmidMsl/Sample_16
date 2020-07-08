library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity data_memory is
    Port ( adr : in STD_LOGIC_VECTOR (15 downto 0);
           d_in : in STD_LOGIC_VECTOR (15 downto 0);
           mem_en : in STD_LOGIC;
           clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (15 downto 0));
end data_memory;

architecture Behavioral of data_memory is

type inst_mem is array(0 to 15) of std_logic_vector(15 downto 0);
signal memory : inst_mem:=(x"0000",x"0000",x"0000",x"0000"
	                      ,x"0000",x"0000",x"0000",x"0000"
		                  ,x"0000",x"0000",x"0000",x"0000"
						  ,x"0000",x"0000",x"0000",x"0000");

begin

d_out <= memory(to_integer(unsigned(adr)));

process(clk)
    begin
    
    if (clk='1' and clk'event) then
        if (mem_en='1') then
            memory(to_integer(unsigned(adr))) <= d_in;
        end if;
    end if;
end process;

end Behavioral;
