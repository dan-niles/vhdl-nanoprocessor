----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2022 02:47:32 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC := '0';
           En : in STD_LOGIC := '1';
           Reset : in STD_LOGIC;
           Clk_out : out STD_LOGIC := '0';
           Clk_out_bar : out STD_LOGIC := '1'
           );
end Slow_Clk;

architecture Behavioral of Slow_Clk is

signal count : integer := 1;
signal clk_status : STD_LOGIC := '0';

begin

process (Clk_in,Reset) begin
    if (Reset = '1') then
        clk_status <= '0';
        Clk_out <= clk_status;
        Clk_out_bar <= not clk_status;
    elsif (En = '0') then
        Clk_out <= '0';
        Clk_out_bar <= '1';
    elsif (rising_edge(Clk_in)) then
        count <= count + 1;           
        if(count  = 50000000) then  -- For Basys3 board
--        if(count = 4) then         -- For simulation in vivado
            clk_status <= not clk_status;
            Clk_out <= clk_status;
            Clk_out_bar <= not clk_status;
            count <= 1;
        end if;
    end if;
end process;

end Behavioral;
