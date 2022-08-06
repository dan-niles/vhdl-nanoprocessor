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
    Port ( ROM_in : in STD_LOGIC_VECTOR (2 downto 0);
           ROM_out : out STD_LOGIC_VECTOR (0 to 12));
end Program_Rom;

architecture Behavioral of Program_Rom is

-- Program to calculate the total of all integers between 1 and 3
    type rom_type is array (0 to 7) of std_logic_vector(0 to 12);
        signal PROGRAM_ROM : rom_type := (
            "0100010000011", -- 0 -- MOVI R1, 3
            "0100100000001", -- 1 -- MOVI R2, 1
            "0010100000000", -- 2 -- NEG R2
            "0001110010000", -- 3 -- ADD R7, R1
            "0000010100000", -- 4 -- ADD R1, R2
            "0110010000111", -- 5 -- JZR R1, 7 
            "0110000000011", -- 6 -- JZR R0, 3
            "1110000000000"  -- 7 -- END
        );

---- Program that displays numbers by decrementing 10 by 1
--type rom_type is array (0 to 7) of std_logic_vector(0 to 12);
--    signal PROGRAM_ROM : rom_type := (
--        "0101110001010", -- 0 -- MOVI R7, 10
--        "0100100000001", -- 1 -- MOVI R2, 1
--        "0010100000000", -- 2 -- NEG R2
--        "0001110100000", -- 3 -- ADD R7, R2
--        "0111110000111", -- 4 -- JZR R7, 7
--        "0110000000011", -- 5 -- JZR R0, 3
--        "0111110000111", -- 6 -- JZR R1, 7 
--        "1110000000000"  -- 7 -- END
--    );

begin

ROM_out <= PROGRAM_ROM(to_integer(unsigned(ROM_in)));

end Behavioral;
