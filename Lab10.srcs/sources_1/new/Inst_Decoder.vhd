----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 06:15:16 PM
-- Design Name: 
-- Module Name: Inst_Decoder - Behavioral
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

entity Inst_Decoder is
    Port ( Inst : in STD_LOGIC_VECTOR (0 to 11); -- Instruction
           Clk : in STD_LOGIC;
           Reg_Chk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX A
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX B
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
           Load_Sel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
           Add_Sub_Sel : out STD_LOGIC; -- Add Sub selector
           Jmp : out STD_LOGIC; -- Jump flag
           Jmp_Address : out STD_LOGIC_VECTOR (2 downto 0)); -- Address to jump
end Inst_Decoder;

architecture Behavioral of Inst_Decoder is
component Inst_Reg
    Port ( D : in STD_LOGIC_VECTOR (0 to 11);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (0 to 11));
end component;

signal I : STD_LOGIC_VECTOR (0 to 11);

begin
-- 12 bit instruction register
Inst_Reg_12 : Inst_Reg 
    port map (
        D => Inst,
        En => '1',
        Clk => Clk,
        Q => I
    );

-- Mapping 1st two bits of instruction
-- 10 - MOV, 00 - ADD, 01 - NEG, 11 - JZR
Add_Sub_Sel <= NOT(I(0)) AND I(1); -- Output 1 when opcode is 01
Load_Sel <= I(0) AND NOT(I(1)); -- Output 1 when opcode is 10
Jmp <= (I(0) AND I(1)) AND NOT(Reg_Chk(0) OR Reg_Chk(1) OR Reg_Chk(2) OR Reg_Chk(3)); -- Output 1 when opcode is 11 and checked register value is 0000 

-- Mapping bits 3-5 for register A
Reg_Sel_A <= I(2) & I(3) & I(4);
Reg_En <= I(2) & I(3) & I(4); 

-- Mapping bits 6-8 for register B
Reg_Sel_B <= I(5) & I(6) & I(7);

-- Mapping last 4 bits
Imd_Val <= I(8) & I(9) & I(10) & I(11); -- Value to load if MOVI instruction is used
Jmp_Address <= I(9) & I(10) & I(11); -- Address to jump to if JMP instruction is used

end Behavioral;
