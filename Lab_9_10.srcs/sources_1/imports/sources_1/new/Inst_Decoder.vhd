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
    Port ( Inst : in STD_LOGIC_VECTOR (0 to 12); -- Instruction
           Clk : in STD_LOGIC;
           Reg_Chk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX A
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0); -- To select register to load into MUX B
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
           Load_Sel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
           Add_Sub_Sel : out STD_LOGIC; -- Add Sub selector
           Clk_En : out STD_LOGIC; -- Enable/Disable clock
           Jmp : out STD_LOGIC; -- Jump flag
           Jmp_Address : out STD_LOGIC_VECTOR (2 downto 0)); -- Address to jump
end Inst_Decoder;

architecture Behavioral of Inst_Decoder is
component Inst_Reg
    Port ( D : in STD_LOGIC_VECTOR (0 to 12);
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (0 to 12));
end component;

signal I : STD_LOGIC_VECTOR (0 to 12);
signal Jmp_Z, Jmp_NZ, Jmp_C, Sub, Neg : STD_LOGIC;

begin
-- 13 bit instruction register
Inst_Reg_13 : Inst_Reg 
    port map (
        D => Inst,
        Clk => Clk,
        Q => I
    );

-- Mapping 1st three bits of instruction
-- 010 - MOV
-- 000 - ADD
-- 001 - NEG
-- 011 - JZR
-- 100 - SUB
-- 101 - JMP
-- 110 - JNZR
-- 111 - END
Sub <= I(0) AND NOT(I(1)) AND NOT(I(2)); -- Output is 1 when opcode is 100
Neg <= NOT(I(0)) AND NOT(I(1)) AND I(2); -- Output is 1 when opcode is 001
Add_Sub_Sel <= Neg OR Sub; 

Load_Sel <= I(1) AND NOT(I(2)); -- Output is 1 when opcode is 010
Clk_En <= NOT(I(0)) OR NOT(I(1)) OR NOT(I(2));  -- Output is 0 when opcode is 111

Jmp_C <= I(0) AND NOT(I(1)) AND I(2); -- Output is 1 when opcode is 101
Jmp_Z <= (I(1) AND I(2)) AND NOT(Reg_Chk(0) OR Reg_Chk(1) OR Reg_Chk(2) OR Reg_Chk(3)); -- Output is 1 when opcode is 011 and checked register value is 0000
Jmp_NZ <= (I(0) AND I(1) AND NOT(I(2))) AND (Reg_Chk(0) OR Reg_Chk(1) OR Reg_Chk(2) OR Reg_Chk(3)); -- Output is 1 when opcode is 110 and checked register value is not 0000
Jmp <= Jmp_C OR Jmp_Z OR Jmp_NZ;  

-- Mapping bits for register A and B
--Reg_Sel_A <= ((Neg & Neg & Neg) AND (I(3) & I(4) & I(5))) OR ((Sub & Sub & Sub) AND (I(6) & I(7) & I(8)));
--Reg_Sel_B <= ((Neg & Neg & Neg) AND (I(6) & I(7) & I(8))) OR ((Sub & Sub & Sub) AND (I(3) & I(4) & I(5)));

Reg_Sel_A <= I(3) & I(4) & I(5);
Reg_Sel_B <= I(6) & I(7) & I(8);

Reg_En <= I(3) & I(4) & I(5); 

-- Mapping last 4 bits
Imd_Val <= I(9) & I(10) & I(11) & I(12); -- Value to load if MOVI instruction is used
Jmp_Address <= I(10) & I(11) & I(12); -- Address to jump to if JMP instruction is used

end Behavioral;
