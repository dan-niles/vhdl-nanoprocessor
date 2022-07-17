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
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (0 to 11));
           
end component;

signal S : STD_LOGIC_VECTOR (2 downto 0);
signal Q : STD_LOGIC_VECTOR (0 to 11);

begin
UUT: Program_Rom PORT MAP(
        S => S,                   
        Q => Q
    );
    
    process 
    begin
        S <= "000";
        wait for 100ns; 
        
        S <= "001";
        wait for 100ns;
        
        S <= "010";
        wait for 100ns;
        
        S <= "011";
        wait for 100ns;
        
        S <= "100";
        wait for 100ns;
        
        S <= "101";
        wait for 100ns;
        
        S <= "110";
        wait for 100ns;
                
        S <= "111";
        wait;
        
    end process;
    
end Behavioral;
