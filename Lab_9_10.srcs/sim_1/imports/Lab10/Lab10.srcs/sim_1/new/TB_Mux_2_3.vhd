----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 02:09:56 AM
-- Design Name: 
-- Module Name: TB_Mux_2_3 - Behavioral
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

entity TB_Mux_2_3 is
--  Port ( );
end TB_Mux_2_3;

architecture Behavioral of TB_Mux_2_3 is
component Mux_2_3
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal I0, I1, Q : STD_LOGIC_VECTOR (2 downto 0);
signal S : STD_LOGIC;

begin
UUT: Mux_2_3 PORT MAP(
        I0 => I0,
        I1 => I1,                   
        S => S,        
        Q => Q
    );
    
    -- Index number : 200436 = 110 000 111 011 110 100
    -- Putting inputs
    I0 <= "011";
    I1 <= "111";
    
    process
        begin
        S <= '0'; -- I0 is selected
    
        wait for 100ns;
        
        S <= '1'; -- I1 is selected
        wait;
    end process;

end Behavioral;
