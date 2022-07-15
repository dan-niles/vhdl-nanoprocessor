----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2022 05:14:07 PM
-- Design Name: 
-- Module Name: TB_Add_Sub - Behavioral
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

entity TB_Add_Sub is
--  Port ( );
end TB_Add_Sub;

architecture Behavioral of TB_Add_Sub is
component Add_Sub_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Add/Sub Selector
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC; -- Zero flag
           N_Out : out STD_LOGIC; -- Negetive flag
           P_Out : out STD_LOGIC -- Parity flag
          );
end component;

signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
signal sel, c_out, z_out, n_out, p_out: STD_LOGIC;

begin
UUT: Add_Sub_Unit PORT MAP(
        A => A,
        B => B,                   
        Sel => sel,
        S => S,        
        C_out => c_out,
        Z_Out => z_out,
        N_Out => n_out,
        P_Out => p_out
    );
    
    process
    begin
    -- sel = 0 : Adder
    -- sel = 1 : Subtractor (Negates A)
    
    -- 0010 + 0011 === 2 + 3
    sel <= '0';
    A <= "0010";
    B <= "0011";
    wait for 100ns;
    
    -- 0100 + 1101 === 4 + (-3)
    A <= "0100";
    B <= "1101";
    wait for 100ns;
    
    -- 0001 + 1111 === 1 + (-1)
    A <= "0001";
    B <= "1111";
    wait for 100ns;
    
    -- Negate 2 and add with 4
    sel <= '1';
    A <= "0010";
    B <= "0100";
    wait for 100ns;
    
    -- Negate 6 
    A <= "0110";
    B <= "0000";
    wait for 100ns;
    
    -- Reset all
    sel <= '0';
    A <= "0000";
    B <= "0000";
    wait;  
    end process;

end Behavioral;
