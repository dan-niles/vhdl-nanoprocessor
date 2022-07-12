----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 01:50:24 AM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
component PC
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal D, Q : STD_LOGIC_VECTOR (2 downto 0);
signal Clk, Res : STD_LOGIC := '0';

begin
UUT: PC PORT MAP(
        D => D,               
        Clk => Clk,
        Res => Res,        
        Q => Q
    );
    
    process 
    begin
        wait for 5ns;
        Clk <= NOT(Clk);
    end process;
    
    process 
    begin
        Res <= '0';
        D <= "000";
        wait for 200ns;
        
        D <= "001";
        wait for 200ns;
        
        D <= "010";
        wait for 200ns;
        
        Res <= '1';
        wait for 100ns;
        
        Res <= '0';
        D <= "111";
        wait for 200ns;
        
    end process;

end Behavioral;
