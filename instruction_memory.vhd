library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity instruction_memory is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is

type ROM is array (0 to 15) of std_logic_vector(15 downto 0);
	signal instruction : ROM :=(x"0000",
	                            x"0123",
	                            x"0000",
	                            x"2123",
	                            x"0000",
	                            x"4123",
	                            x"0000",
	                            x"6123",
	                            x"0000",
	                            x"8202",
	                            x"0000",
	                            x"a001",
	                            x"0000",
	                            x"c001",
	                            x"0000",
	                            x"e040");
	begin
		output <= instruction(to_integer ( unsigned (input)));

end Behavioral;
