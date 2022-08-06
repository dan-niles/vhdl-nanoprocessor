----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 01:56:30 AM
-- Design Name: 
-- Module Name: Mux_2_to_1 - Behavioral
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

entity Mux_2_to_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : out STD_LOGIC);
end Mux_2_to_1;

architecture Behavioral of Mux_2_to_1 is

begin

Q <= (NOT(S) AND I0) OR (S AND I1);

end Behavioral;
