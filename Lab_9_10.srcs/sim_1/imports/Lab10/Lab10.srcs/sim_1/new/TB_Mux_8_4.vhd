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
        R0 => "0000", --0
        R1 => "0010", --2
        R2 => "0000", --0
        R3 => "0000", --0
        R4 => "0100", --4
        R5 => "1000", --8
        R6 => "0001", --1
        R7 => "1100", --C                
        S => S,        
        Q => Q
    );
    
    process
    begin
        -- Index Number : 200481C = 11 0000 1111 0010 0001
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
