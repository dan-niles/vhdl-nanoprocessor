----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 02:24:44 AM
-- Design Name: 
-- Module Name: Mux_2_4 - Behavioral
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

entity Mux_2_4 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_4;

architecture Behavioral of Mux_2_4 is
component Mux_2_to_1
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin
mux1 : Mux_2_to_1
    PORT MAP(
        I0 => I0(0),
        I1 => I1(0),
        S => S,
        Q => Q(0)
    );
    
mux2 : Mux_2_to_1
    PORT MAP(
        I0 => I0(1),
        I1 => I1(1),
        S => S,
        Q => Q(1)
    );
    
mux3 : Mux_2_to_1
    PORT MAP(
        I0 => I0(2),
        I1 => I1(2),
        S => S,
        Q => Q(2)
    );
    
mux4 : Mux_2_to_1
    PORT MAP(
        I0 => I0(3),
        I1 => I1(3),
        S => S,
        Q => Q(3)
    );

end Behavioral;
