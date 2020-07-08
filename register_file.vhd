library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity register_file is
    Port ( reg_file_en : in STD_LOGIC;
           reg_file_rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           rd_reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
           rd_reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
           rd_reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
           wr_reg : in STD_LOGIC_VECTOR (3 downto 0);
           wr_data : in STD_LOGIC_VECTOR (15 downto 0);
           reg_1 : out STD_LOGIC_VECTOR (15 downto 0);
           reg_2 : out STD_LOGIC_VECTOR (15 downto 0);
           reg_3 : out STD_LOGIC_VECTOR (15 downto 0));
end register_file;

architecture Behavioral of register_file is

type regFile is array(0 to 15) of std_logic_vector(15 downto 0);
   signal registers : regFile:=(x"0001",x"0011",x"0111",x"1111"
	                           ,x"a111",x"b111",x"c111",x"d111"
							   ,x"2111",x"1212",x"2321",x"1321"
							   ,x"25a1",x"23b1",x"321a",x"a4a2");

begin

reg_1 <= registers(to_integer(unsigned(rd_reg_1)));
reg_2 <= registers(to_integer(unsigned(rd_reg_2)));
reg_3 <= registers(to_integer(unsigned(rd_reg_3)));
  process(clk)
    begin
        if ( clk ='1' and clk'event ) then 
            if(reg_file_en = '1') then
                registers(to_integer(unsigned(wr_reg))) <= wr_data;
            elsif (reg_file_rst='1') then
                registers<=(x"0001",x"0011",x"0111",x"1111"
                           ,x"a111",x"b111",x"c111",x"d111"
                           ,x"2111",x"1212",x"2321",x"1321"
                           ,x"25a1",x"23b1",x"321a",x"a4a2");
			end if;
            
        end if;
    end process;

end Behavioral;
