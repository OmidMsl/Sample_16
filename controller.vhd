library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity controller is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end controller;

architecture Behavioral of controller is

component data_path is
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
end component;

signal pc_sel , pc_en , pc_rst , reg_file_en , reg_file_rst , wr_reg_sel , alu_sel_1 , alu_opr , mem_en , L , alu_15: STD_LOGIC;
signal wr_data_sel , op_code: STD_LOGIC_VECTOR (2 downto 0);
signal rd_reg_sel , alu_sel_2: STD_LOGIC_VECTOR (1 downto 0);

begin

process(clk , rst)
  begin
    if(clk='1' and clk'event) then
        if(rst='1') then
            pc_en <= '0';
            pc_rst <= '1';
            reg_file_en <= '0';
            reg_file_rst <= '1';
            mem_en <= '0';
            
        elsif(op_code="000") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            rd_reg_sel <= "00";
            wr_reg_sel <= '0';
            wr_data_sel <= "110";
            alu_sel_1 <= '0';
            alu_sel_2 <= "00";
            alu_opr <= '1';
            mem_en <= '0';
            
        elsif(op_code="001") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '0';
            reg_file_rst <= '0';
            rd_reg_sel <= "00";
            alu_sel_1 <= '0';
            alu_sel_2 <= "00";
            alu_opr <= '0';
            mem_en <= '1';
            
        elsif(op_code="010") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            rd_reg_sel <= "00";
            wr_reg_sel <= '0';
            wr_data_sel <= "101";
            alu_sel_1 <= '0';
            alu_sel_2 <= "00";
            alu_opr <= '0';
            mem_en <= '0';
            
        elsif(op_code="011") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            rd_reg_sel <= "00";
            wr_reg_sel <= '0';
            wr_data_sel(2) <= alu_15;
            wr_data_sel(1) <= not alu_15;
            wr_data_sel(0) <= not alu_15;
            alu_sel_1 <= '0';
            alu_sel_2 <= "00";
            alu_opr <= '1';
            mem_en <= '0';
            
        elsif(op_code="100") then
            pc_sel <= '1';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            rd_reg_sel <= "01";
            wr_reg_sel <= '1';
            wr_data_sel <= "010";
            alu_sel_1 <= '1';
            alu_sel_2 <= "01";
            alu_opr <= '0';
            mem_en <= '0';
            
        elsif(op_code="101") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            wr_reg_sel <= '1';
            wr_data_sel <= "001";
            mem_en <= '0';
            
        elsif(op_code="110") then
            pc_sel <= '0';
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '1';
            reg_file_rst <= '0';
            wr_reg_sel <= '1';
            wr_data_sel <= "000";
            mem_en <= '0';
            
        elsif(op_code="111") then
            pc_sel <= L;
            pc_en <= '1';
            pc_rst <= '0';
            reg_file_en <= '0';
            reg_file_rst <= '0';
            rd_reg_sel <= "10";
            alu_sel_1 <= '1';
            alu_sel_2 <= "10";
            alu_opr <= '0';
            mem_en <= '0';
        end if;
    end if;
end process;

u: data_path port map (clk , pc_sel , pc_en , pc_rst , reg_file_en , reg_file_rst , rd_reg_sel , wr_reg_sel , wr_data_sel , alu_sel_1 , alu_sel_2 , alu_opr , mem_en , op_code , L , alu_15);


end Behavioral;
