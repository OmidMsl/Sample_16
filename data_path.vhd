library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity data_path is
    Port ( clk : in STD_LOGIC;
           pc_sel : in STD_LOGIC;
           pc_en : in STD_LOGIC;
           pc_rst : in STD_LOGIC;
           reg_file_en : in STD_LOGIC;
           reg_file_rst : in STD_LOGIC;
           rd_sel : in STD_LOGIC_VECTOR (1 downto 0);
           wr_reg_sel : in STD_LOGIC;
           wr_data_sel : in STD_LOGIC_VECTOR (2 downto 0);
           alu_sel_1 : in STD_LOGIC;
           alu_sel_2 : in STD_LOGIC_VECTOR (1 downto 0);
           alu_opr : in STD_LOGIC;
           mem_en : in STD_LOGIC;
           op_code : out STD_LOGIC_VECTOR (2 downto 0);
           L : out STD_LOGIC;
           alu_15 : out STD_LOGIC);
end data_path;

architecture Behavioral of data_path is

component fetch is
    Port ( pc_en : in STD_LOGIC;
           pc_rst : in STD_LOGIC;
           pc_inp : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           pc_sel : in STD_LOGIC;
           inst_out : out STD_LOGIC_VECTOR (15 downto 0);
           pc_plus_2 : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component decode is
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
end component;

component exe is
    Port ( reg1 : in STD_LOGIC_VECTOR (15 downto 0);
           reg2 : in STD_LOGIC_VECTOR (15 downto 0);
           inst_y : in STD_LOGIC_VECTOR (4 downto 0);
           inst_w : in STD_LOGIC_VECTOR (5 downto 0);
           alu_sel_1 : in STD_LOGIC;
           alu_sel_2 : in STD_LOGIC_VECTOR (1 downto 0);
           alu_opr : in STD_LOGIC;
           alu_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component data_memory is
    Port ( adr : in STD_LOGIC_VECTOR (15 downto 0);
           d_in : in STD_LOGIC_VECTOR (15 downto 0);
           mem_en : in STD_LOGIC;
           clk : in STD_LOGIC;
           d_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal inst , pc_plus_2 , dm_out , reg1 , reg2 , reg3 , adr , alu_out : STD_LOGIC_VECTOR (15 downto 0);

begin

u0: fetch port map (pc_en , pc_rst , alu_out , clk , pc_sel , inst , pc_plus_2);
u1: decode port map (inst(12 downto 0) , clk , reg_file_en , reg_file_rst , rd_sel , wr_reg_sel , wr_data_sel , alu_out , pc_plus_2 , dm_out , reg1 , reg2 , reg3);
u2: exe port map ( reg1 , reg2 , inst(8 downto 4) , inst(5 downto 0) , alu_sel_1 , alu_sel_2 , alu_opr , alu_out);
u3: data_memory port map (alu_out , reg3 , mem_en , clk , dm_out);

op_code <= inst(15 downto 13);
L <= inst(12);
alu_15 <= alu_out(15);

end Behavioral;
