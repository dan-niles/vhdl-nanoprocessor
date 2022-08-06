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

signal selecter : STD_LOGIC;
signal I0 : STD_LOGIC_VECTOR(3 downto 0);
signal I1 : STD_LOGIC_VECTOR(3 downto 0);
signal output : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: Mux_2_4 PORT MAP(
        I0 => I0,
        I1 => I1,                   
        S => selecter,        
        Q => output
    );
    
    process
    begin
       -- Index Number : 200481C = 11 0000 1111 0010 0001
       I0 <= "0100";   --4
       I1 <= "1000";   --8
       selecter <= '0';
       wait for 150ns;
       
       selecter <= '1';
       wait for 150ns;
       
       I0 <= "0001";   --1
       I1 <= "1100";   --c
       selecter <= '0';
       wait for 150 ns;
       
       selecter <= '1';
       wait;
    
    end process;

end Behavioral;
