----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 12:44:35 AM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Add/Sub Selector --sel=0 ADD , sel=1 SUBSTRACT
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC; -- Zero flag
           N_Out : out STD_LOGIC; -- Negetive flag
           P_Out : out STD_LOGIC -- Parity flag (Odd parity detector)
         );
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is
component RCA
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC );
end component;

signal A_Sel, S_out  : STD_LOGIC_VECTOR (3 downto 0);

begin

A_Sel(0) <= A(0) XOR Sel;
A_Sel(1) <= A(1) XOR Sel;
A_Sel(2) <= A(2) XOR Sel;
A_Sel(3) <= A(3) XOR Sel;

RCA_4 : RCA
    port map (
        A => A_Sel,
        B => B,
        C_in => Sel,
        S => S_out,
        C_Out => C_Out);
        
S <= S_out;
Z_Out <= NOT (S_out(0) OR S_out(1) OR S_out(2) OR S_out(3));
N_Out <= S_out(3);
P_Out <= S_out(0) XOR S_out(1) XOR S_out(2) XOR S_out(3);
        
end Behavioral;
