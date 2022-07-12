----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 02:50:00 AM
-- Design Name: 
-- Module Name: TB_Mux_8_4 - Behavioral
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

entity TB_Mux_8_4 is
--  Port ( );
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is
component Mux_8_4
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0, R1, R2, R3, R4, R5, R6, R7, Q : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal S : STD_LOGIC_VECTOR (2 downto 0);

begin
UUT: Mux_8_4 PORT MAP(
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7,                 
        S => S,        
        Q => Q
    );
    
    process
    begin
    S <= "000";
    R0 <= "1110";
    wait for 50ns;
    
    S <= "001";
    R1 <= "1100";
    wait for 50ns;
    
    S <= "010";
    R2 <= "1010";
    wait for 50ns;
        
    S <= "011";
    R3 <= "0110";
    wait for 50ns;    
    
    S <= "100";
    R4 <= "1111";
    wait for 50ns;
    
    S <= "101";
    R5 <= "0000";
    wait for 50ns;
    
    S <= "110";
    R6 <= "0001";
    wait for 50ns;
    
    S <= "111";
    R7 <= "0110";
    wait for 50ns;
    
    end process;


end Behavioral;
