library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sign_extend_w is
    Port ( imm_in : in STD_LOGIC_VECTOR (5 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end sign_extend_w;

architecture Behavioral of sign_extend_w is

signal sign : STD_LOGIC;

begin

sign <= imm_in(5);

process(imm_in)
  begin
    for I in 5 to 15 loop
    imm_out(I) <= sign;
    end loop;
end process;

imm_out(4 downto 0) <= imm_in(4 downto 0);

end Behavioral;
