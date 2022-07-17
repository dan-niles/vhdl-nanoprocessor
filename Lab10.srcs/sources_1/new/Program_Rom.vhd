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
        "100100001111", -- 0
        "110011000010", -- 1
        "010011000100", -- 2
        "000000001000", -- 3
        "110000010000", -- 4
        "100000101010", -- 5
        "010001001000", -- 6
        "000010101000"  -- 7
    );

begin

Q <= PROGRAM_ROM(to_integer(unsigned(S)));

end Behavioral;
