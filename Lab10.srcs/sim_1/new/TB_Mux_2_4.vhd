----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 02:27:40 AM
-- Design Name: 
-- Module Name: TB_Mux_2_4 - Behavioral
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

entity TB_Mux_2_4 is
--  Port ( );
end TB_Mux_2_4;

architecture Behavioral of TB_Mux_2_4 is
component Mux_2_4
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal I0, I1, Q : STD_LOGIC_VECTOR (3 downto 0);
signal S : STD_LOGIC;

begin
UUT: Mux_2_4 PORT MAP(
        I0 => I0,
        I1 => I1,                   
        S => S,        
        Q => Q
    );
    
    process
    begin
    S <= '0'; -- I0 is selected
    
    I0 <= "0000";
    I1 <= "0000";
    wait for 100ns;
    
    I0 <= "0101";
    wait for 100ns;
    
    I0 <= "0100";
    wait for 100ns;
    
    I0 <= "1111";
    wait for 100ns;
    
    S <= '1'; -- I1 is selected
    
    I1 <= "0001";
    wait for 100ns;
    
    I1 <= "0100";
    wait for 100ns;
    
    I1 <= "1111";
    wait for 100ns;
    
    I1 <= "0011";
    wait;
    
    end process;

end Behavioral;
