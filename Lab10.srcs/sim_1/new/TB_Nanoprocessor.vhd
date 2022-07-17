----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 12:50:08 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
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

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is
component Nanoprocessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           L : out STD_LOGIC_VECTOR (3 downto 0); 
           C_Flag : out STD_LOGIC; -- Carry flag
           Z_Flag : out STD_LOGIC; -- Zero flag
           N_Flag : out STD_LOGIC; -- Negetive flag
           P_Flag : out STD_LOGIC; -- Parity flag (Odd parity detector)
           Seg_7 : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

signal Clk : STD_LOGIC := '0';
signal Reset, C_Flag, Z_Flag , N_Flag, P_Flag : STD_LOGIC;
signal L : STD_LOGIC_VECTOR (3 downto 0); 
signal Seg_7 : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT: Nanoprocessor PORT MAP(
       Clk => Clk,
       Reset => Reset,
       L => L,
       C_Flag => C_Flag,
       Z_Flag => Z_Flag,
       N_Flag => N_Flag,
       P_Flag => P_Flag,
       Seg_7 => Seg_7
    );
    
    process 
    begin
        wait for 5ns;
        Clk <= NOT(Clk);
    end process;
    
    process
    begin
        Reset <= '1';
        wait for 80ns;
        
        Reset <= '0';
        wait;
    end process;

end Behavioral;
