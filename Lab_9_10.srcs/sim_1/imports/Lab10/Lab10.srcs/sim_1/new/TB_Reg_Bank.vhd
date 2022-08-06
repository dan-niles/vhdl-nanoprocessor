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
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0); -- Value to be written
           Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0); -- Register address select 
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC; -- Reset all registers to 0000 
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal input : STD_LOGIC_VECTOR(3 downto 0);
signal clk,reset : STD_LOGIC := '0';
signal selecter : STD_LOGIC_VECTOR(2 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: Reg_Bank 
    PORT MAP ( 
       Reg_in => input,
       Clk => clk,
       Reg_Sel => selecter,
       Reset => reset,
       R0 => R0,
       R1 => R1,
       R2 => R2,
       R3 => R3,
       R4 => R4,
       R5 => R5,
       R6 => R6,
       R7 => R7 );
    
    process 
    begin
        wait for 5ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
    reset <= '1';
    wait for 5ns;
    reset <= '0';
    
    -- Index Number : 200481C = 11 0000 1111 0010 0001
    selecter <= "000";
    wait for 5ns;
    input <= "0000";    --0
    wait for 100ns;
    selecter <= "001";
    wait for 5ns;
    input <= "0010";    --2
    wait for 100ns;
    selecter <= "010";
    wait for 5ns;
    input <= "0000";    --0
    wait for 100ns;
    selecter <= "011";
    wait for 5ns;
    input <= "0000";    --0
    wait for 100ns;
    selecter <= "100";
    wait for 5ns;
    input <= "0100";    --4
    wait for 100ns;
    selecter <= "101";
    wait for 5ns;
    input <= "1000";    --8
    wait for 100ns;
    selecter <= "110";
    wait for 5ns;
    input <= "0001";    --1
    wait for 100ns;
    selecter <= "111";
    wait for 5ns;
    input <= "1100";    --C
    wait for 100ns;
    reset <= '1';
    wait;
        
    end process;
    

end Behavioral;
