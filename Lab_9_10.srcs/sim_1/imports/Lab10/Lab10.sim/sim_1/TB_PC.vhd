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
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Clk : STD_LOGIC := '0';
signal PC_in,PC_out : STD_LOGIC_VECTOR (2 downto 0);
signal Res : STD_LOGIC;

begin
UUT: PC PORT MAP(
        PC_in => PC_in,               
        Clk => Clk,
        Res => Res,        
        PC_out => PC_out
    );
    
    process 
    begin
        wait for 20ns;
        Clk <= NOT(Clk);
    end process;
    
    process 
    begin
    
        -- Index number : 200614N = 110 000 111 110 100 110
        Res <= '1';
        wait for 100ns;
        
        Res <='0';
        PC_in <= "110";
        wait for 200ns;
        
        PC_in <= "100";
        wait for 200ns;
        
        PC_in <= "110";
        wait for 200ns;
        
        PC_in <= "111";
        wait;
       
    end process;

end Behavioral;
