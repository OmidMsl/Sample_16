library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity exe is
    Port ( reg1 : in STD_LOGIC_VECTOR (15 downto 0);
           reg2 : in STD_LOGIC_VECTOR (15 downto 0);
           inst_y : in STD_LOGIC_VECTOR (4 downto 0);
           inst_w : in STD_LOGIC_VECTOR (5 downto 0);
           alu_sel_1 : in STD_LOGIC;
           alu_sel_2 : in STD_LOGIC_VECTOR (1 downto 0);
           alu_opr : in STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0));
end exe;

architecture Behavioral of exe is

component mux_2 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux_3 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           c : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component alu is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           alu_opr : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component sign_extend_w is
    Port ( imm_in : in STD_LOGIC_VECTOR (5 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component sign_extend_y is
    Port ( imm_in : in STD_LOGIC_VECTOR (4 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component shift_1 is
    Port ( din : in STD_LOGIC_VECTOR (15 downto 0);
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal se_y , se_w , sh_y , sh_w , sh_reg1 , mux2_out , mux3_out : STD_LOGIC_VECTOR (15 downto 0);

begin

a1: sign_extend_y port map (inst_y , se_y);
a2: shift_1 port map (se_y , sh_y);
b1: sign_extend_w port map (inst_w , se_w);
b2: shift_1 port map (se_w , sh_w);

u0: shift_1 port map (reg1 , sh_reg1);
u1: mux_2 port map (reg1 , sh_reg1 , alu_sel_1 , mux2_out);
u2: mux_3 port map (reg2 , sh_y , sh_w , alu_sel_2 , mux3_out);

x0: alu port map (mux2_out , mux3_out , alu_opr , alu_out);
end Behavioral;
