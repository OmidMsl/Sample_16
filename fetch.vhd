library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fetch is
    Port ( pc_en : in STD_LOGIC;
           pc_rst : in STD_LOGIC;
           pc_inp : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           pc_sel : in STD_LOGIC;
           inst_out : out STD_LOGIC_VECTOR (15 downto 0);
           pc_plus_2 : out STD_LOGIC_VECTOR (15 downto 0));
end fetch;

architecture Behavioral of fetch is

component program_counter is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           pc_rst : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component pc_adder is
    Port ( din : in STD_LOGIC_VECTOR (15 downto 0) := x"0000";
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux_2 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component instruction_memory is
    Port ( input : in STD_LOGIC_VECTOR (15 downto 0);
           output : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal adder_out , mux_out , pc_in , pc_out : STD_LOGIC_VECTOR (15 downto 0);

begin

process(clk)
  begin
    if(clk='1' and clk'event) then
        if(pc_en='1') then
            pc_in <= pc_out;
        else
            pc_in <= mux_out;
        end if;
    end if;
end process;

u0:pc_adder port map (pc_out , adder_out);
u1:mux_2 port map (adder_out , pc_inp , pc_sel , mux_out);
u2:program_counter port map (pc_in , clk , pc_rst , pc_out);
u3:instruction_memory port map (pc_out , inst_out);

pc_plus_2 <= adder_out;

end Behavioral;
