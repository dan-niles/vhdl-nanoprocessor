----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 01:34:06 AM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0) := "000";
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (2 downto 0) := "000");
end PC;

architecture Behavioral of PC is

begin
    process (Clk, Res) begin   
        if(Res = '1') then
            PC_out <= "000";
        elsif(rising_edge(Clk)) then
            PC_out <= PC_in;
        end if;
    end process;
end Behavioral;
