----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 02:35:15 AM
-- Design Name: 
-- Module Name: Mux_8_4 - Behavioral
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

entity Mux_8_4 is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_4;

architecture Behavioral of Mux_8_4 is
component Mux_8_to_1
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
mux0 : Mux_8_to_1
    PORT MAP(
        D(0) => R0(0),
        D(1) => R1(0),
        D(2) => R2(0),
        D(3) => R3(0),
        D(4) => R4(0),
        D(5) => R5(0),
        D(6) => R6(0),
        D(7) => R7(0),
        S => S,
        EN => '1',
        Y => Q(0)
    );
    
mux1 : Mux_8_to_1
    PORT MAP(
        D(0) => R0(1),
        D(1) => R1(1),
        D(2) => R2(1),
        D(3) => R3(1),
        D(4) => R4(1),
        D(5) => R5(1),
        D(6) => R6(1),
        D(7) => R7(1),
        S => S,
        EN => '1',
        Y => Q(1)
    );
    
mux2 : Mux_8_to_1
    PORT MAP(
        D(0) => R0(2),
        D(1) => R1(2),
        D(2) => R2(2),
        D(3) => R3(2),
        D(4) => R4(2),
        D(5) => R5(2),
        D(6) => R6(2),
        D(7) => R7(2),
        S => S,
        EN => '1',
        Y => Q(2)
    );
        
mux3 : Mux_8_to_1
    PORT MAP(
        D(0) => R0(3),
        D(1) => R1(3),
        D(2) => R2(3),
        D(3) => R3(3),
        D(4) => R4(3),
        D(5) => R5(3),
        D(6) => R6(3),
        D(7) => R7(3),
        S => S,
        EN => '1',
        Y => Q(3)
    );

end Behavioral;
