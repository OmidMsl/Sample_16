library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sign_extend_y is
    Port ( imm_in : in STD_LOGIC_VECTOR (4 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end sign_extend_y;

architecture Behavioral of sign_extend_y is

signal sign : STD_LOGIC;

begin

sign <= imm_in(4);

process(imm_in)
  begin
    for I in 4 to 15 loop
    imm_out(I) <= sign;
    end loop;
end process;

imm_out(3 downto 0) <= imm_in(3 downto 0);

end Behavioral;
