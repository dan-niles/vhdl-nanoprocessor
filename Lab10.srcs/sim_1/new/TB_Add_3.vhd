----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 01:15:42 AM
-- Design Name: 
-- Module Name: TB_Add_3 - Behavioral
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

entity TB_Add_3 is
--  Port ( );
end TB_Add_3;

architecture Behavioral of TB_Add_3 is
component Add_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal a, s : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin

UUT: Add_3 PORT MAP(
        A => a,
        S => s            
    );
        
    process
    begin
        A <= "000";
        wait for 100ns;
        
        A <= "001";
        wait for 100ns;
        
        A <= "010";
        wait for 100ns;
        
        A <= "011";
        wait for 100ns;
        
        A <= "100";
        wait for 100ns;
        
        A <= "101";
        wait for 100ns;
        
        A <= "110";
        wait for 100ns;
        
        A <= "111";
        wait for 100ns;
    end process;
        
end Behavioral;
