----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:28:05 PM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is
component Reg_Bank
    Port ( 
       D : in STD_LOGIC_VECTOR (3 downto 0);
       I : in STD_LOGIC_VECTOR (2 downto 0);
       Clk : in STD_LOGIC;
       Clr : in STD_LOGIC;
       R0 : out STD_LOGIC_VECTOR (3 downto 0);
       R1 : out STD_LOGIC_VECTOR (3 downto 0);
       R2 : out STD_LOGIC_VECTOR (3 downto 0);
       R3 : out STD_LOGIC_VECTOR (3 downto 0);
       R4 : out STD_LOGIC_VECTOR (3 downto 0);
       R5 : out STD_LOGIC_VECTOR (3 downto 0);
       R6 : out STD_LOGIC_VECTOR (3 downto 0);
       R7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal I : STD_LOGIC_VECTOR (2 downto 0);
signal Clk, Clr : STD_LOGIC := '0';
signal D, R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
UUT: Reg_Bank PORT MAP(
        D => D,
        I => I,
        Clk => Clk,
        Clr => Clr,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7
    );
    
    process 
    begin
        wait for 20ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
        I <= "001"; -- Write to R1
        D <= "1010";
        wait for 50ns;
        
        I <= "100"; -- Write to R4
        D <= "1111";
        wait for 50ns;
        
        I <= "110"; -- Write to R6
        D <= "0010";
        wait for 50ns;
        
        I <= "111"; -- Write to R7
        D <= "0001";
        wait for 50ns;
        
        Clr <= '1';
        wait for 50ns;
        Clr <= '0';
        
        I <= "010"; -- Write to R2
        D <= "0001";
        wait for 50ns;
        
        I <= "011"; -- Write to R3
        D <= "0111";
        wait for 50ns;
        
        I <= "101"; -- Write to R5
        D <= "1010";
        wait for 50ns;
        
        Clr <= '1';
        wait for 50ns;
        Clr <= '0';
        
    end process;
    

end Behavioral;
