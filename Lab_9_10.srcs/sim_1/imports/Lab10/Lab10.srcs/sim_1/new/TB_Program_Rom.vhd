----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 05:35:26 PM
-- Design Name: 
-- Module Name: TB_Program_Rom - Behavioral
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

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is
component Program_Rom
    Port ( ROM_in : in STD_LOGIC_VECTOR (2 downto 0);
           ROM_out : out STD_LOGIC_VECTOR (0 to 12));
           
end component;

signal ROM_in : STD_LOGIC_VECTOR (2 downto 0);
signal ROM_out : STD_LOGIC_VECTOR (0 to 12);

begin
UUT: Program_Rom PORT MAP(
        ROM_in => ROM_in,                   
        ROM_out => ROM_out
    );
    
    process 
    begin
        -- Index number : 200614N = 110 000 111 110 100 110
        ROM_in <= "110";
        wait for 200ns;
        
        ROM_in <= "100";
        wait for 200ns;
            
        ROM_in <= "110";
        wait for 200ns;
                
        ROM_in <= "111";
        wait;
    end process;
    
end Behavioral;
