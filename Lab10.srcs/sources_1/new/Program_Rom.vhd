----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 05:26:35 PM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (0 to 11));
end Program_Rom;

architecture Behavioral of Program_Rom is
type rom_type is array (0 to 7) of std_logic_vector(0 to 11);
    signal PROGRAM_ROM : rom_type := (
        "101110000010", -- 0 -- MOV 2 to Reg 7
        "101100000011", -- 1 -- MOV 3 to Reg 6
        "001111100000", -- 2 -- ADD Reg 7 and Reg 6 (2+3) = 5
        "011110000000", -- 3 -- NEG Reg 7 = (-5)
        "001111100000", -- 4 -- ADD Reg 7 and Reg 6 (-5+3) = -2
        "011110000000", -- 5 -- NEG Reg 7 = (2)
        "000000000000", -- 6 
        "110000000110"  -- 7 -- Jump to instruction 6 if Reg_0 = 000
    );

begin

Q <= PROGRAM_ROM(to_integer(unsigned(S)));

end Behavioral;
