----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/27/2022 10:04:32 PM
-- Design Name: 
-- Module Name: TB_Clock_Control - Behavioral
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

entity TB_Clock_Control is
--  Port ( );
end TB_Clock_Control;

architecture Behavioral of TB_Clock_Control is
component Clock_Control
    Port ( Clk_in : in STD_LOGIC;
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk_out_1 : out STD_LOGIC;
           Clk_out_2 : out STD_LOGIC);
end component;

signal en : STD_LOGIC := '1';
signal clk, reset : STD_LOGIC := '0';
signal Clk_out_1, Clk_out_2 : STD_LOGIC;

begin
UUT: Clock_Control 
    PORT MAP ( 
       Clk_in => clk,
       En => en,
       Reset => reset,
       Clk_out_1 => Clk_out_1,
       Clk_out_2 => Clk_out_2 
       );
       
    process 
    begin
        wait for 5ns;
        Clk <= NOT(Clk);
    end process;
    
    process 
    begin
        reset <= '1';  
        wait for 20ns;
        
        reset <= '0';
        wait;  
    end process;


end Behavioral;
