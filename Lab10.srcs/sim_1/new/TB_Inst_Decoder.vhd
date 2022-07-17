----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 09:22:43 AM
-- Design Name: 
-- Module Name: TB_Inst_Decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Inst_Decoder is
--  Port ( );
end TB_Inst_Decoder;

architecture Behavioral of TB_Inst_Decoder is
component Inst_Decoder
    Port ( Inst : in STD_LOGIC_VECTOR (0 to 11); -- Instruction
           Clk : in STD_LOGIC;
           Reg_Chk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
           Load_Sel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
           Add_Sub_Sel : out STD_LOGIC; -- Add Sub selector
           Jmp : out STD_LOGIC; -- Jump flag
           Jmp_Address : out STD_LOGIC_VECTOR (2 downto 0)); -- Address to jump
end component;

signal Inst : STD_LOGIC_VECTOR (0 to 11);
signal Reg_Chk, Imd_Val : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Sel_A, Reg_Sel_B, Reg_En, Jmp_Address : STD_LOGIC_VECTOR (2 downto 0);
signal Clk, Load_Sel, Add_Sub_Sel, Jmp : STD_LOGIC := '0';

begin
UUT: Inst_Decoder PORT MAP(
           Inst => Inst,
           Clk => Clk,
           Reg_Chk => Reg_Chk,
           Reg_Sel_A => Reg_Sel_A,
           Reg_Sel_B => Reg_Sel_B,
           Imd_Val => Imd_Val,
           Reg_En => Reg_En,
           Load_Sel => Load_Sel,
           Add_Sub_Sel => Add_Sub_Sel,
           Jmp => Jmp,
           Jmp_Address => Jmp_Address
    );
    
    process 
    begin
        wait for 20ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
        Inst <= "101010001101"; -- MOV
        wait for 100ns;
        
        Inst <= "000110010000"; -- ADD
        wait for 100ns;
        
        Inst <= "010100000000"; -- NEG
        wait for 100ns;
        
        Inst <= "111110000011"; -- JZR
        Reg_Chk <= "0000";
        wait for 100ns;
    
    end process;

end Behavioral;
