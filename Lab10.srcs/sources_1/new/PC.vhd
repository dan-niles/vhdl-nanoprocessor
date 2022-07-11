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
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

component D_FF
Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);  
end component;

component Slow_Clk
Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

signal D0, D1, D2 : STD_LOGIC; -- Internal signals
signal Q_0, Q_1, Q_2 : STD_LOGIC; -- Internal signals  
signal Clk_slow : STD_LOGIC; -- Internal clock

begin

Slow_Clk0 : Slow_Clk
    PORT MAP (
        Clk_in => Clk,
        Clk_out => Clk_slow
    );

 D_FF0 : D_FF
    PORT MAP (
        D => D(0),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(0)
    );
    
 D_FF1 : D_FF
    PORT MAP (
        D => D(1),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(1)
    );
    
 D_FF2 : D_FF
    PORT MAP (
        D => D(2),
        Res => Res,
        Clk => Clk_slow,
        Q => Q(2)
    );

end Behavioral;