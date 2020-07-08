library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decode is
    Port ( inst : in STD_LOGIC_VECTOR (12 downto 0);
           clk : in STD_LOGIC;
           reg_file_en : in STD_LOGIC;
           reg_file_rst : in STD_LOGIC;
           rd_sel : in STD_LOGIC_VECTOR (1 downto 0);
           wr_reg_sel : in STD_LOGIC;
           wr_data_sel : in STD_LOGIC_VECTOR (2 downto 0);
           alu : in STD_LOGIC_VECTOR (15 downto 0);
           pc_plus_2 : in STD_LOGIC_VECTOR (15 downto 0);
           data_mem : in STD_LOGIC_VECTOR (15 downto 0);
           reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           reg3 : out STD_LOGIC_VECTOR (15 downto 0));
end decode;

architecture Behavioral of decode is

component rd_mux_3 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           c : in STD_LOGIC_VECTOR (2 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component register_file is
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
end component;

component mux_wr_data_7 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           c : in STD_LOGIC_VECTOR (15 downto 0);
           d : in STD_LOGIC_VECTOR (15 downto 0);
           e : in STD_LOGIC_VECTOR (15 downto 0);
           f : in STD_LOGIC_VECTOR (15 downto 0);
           g : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux_wr_reg_2 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component shift_7 is
    Port ( din : in STD_LOGIC_VECTOR (8 downto 0);
           dout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component zero_filling is
    Port ( imm_in : in STD_LOGIC_VECTOR (8 downto 0);
           imm_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal rd_mux_out , wr_reg_mux_out : STD_LOGIC_VECTOR (3 downto 0);
signal wr_data_mux_out , zf , sh_7 : STD_LOGIC_VECTOR (15 downto 0);

begin

u0: rd_mux_3 port map ( inst(7 downto 4) , inst(12 downto 9) , inst(8 downto 6) , rd_sel , rd_mux_out);
u1: mux_wr_reg_2 port map (inst(11 downto 8) , inst(3 downto 0) , wr_reg_sel , wr_reg_mux_out);
u2: zero_filling port map (inst(12 downto 4) , zf);
u3: shift_7 port map (inst(12 downto 4) , sh_7);
u4: mux_wr_data_7 port map (zf , sh_7 , pc_plus_2 , x"0000" , x"0001" , data_mem , alu , wr_data_sel , wr_data_mux_out);
u5: register_file port map ( reg_file_en , reg_file_rst , clk , rd_mux_out , inst(3 downto 0) , inst(11 downto 8) , wr_reg_mux_out , wr_data_mux_out , reg1 , reg2 , reg3);


end Behavioral;
