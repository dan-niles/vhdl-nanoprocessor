----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 01:52:06 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
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
end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Decoder_3_to_8
    Port (
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal Reg_en_sig : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder : Decoder_3_to_8
    port map (
        I => Reg_Sel,
        EN => '1',
        Y => Reg_en_sig
    );

Reg_0 : Reg
    port map (
        D => "0000",
        En => Reg_en_sig(0),
        Clk => Clk,
        Clr => Reset,
        Q => R0
    );
    
Reg_1 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(1),
        Clk => Clk,
        Clr => Reset,
        Q => R1
    );

Reg_2 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(2),
        Clk => Clk,
        Clr => Reset,
        Q => R2
    );

Reg_3 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(3),
        Clk => Clk,
        Clr => Reset,
        Q => R3
    );
    
Reg_4 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(4),
        Clk => Clk,
        Clr => Reset,
        Q => R4
    );
    
Reg_5 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(5),
        Clk => Clk,
        Clr => Reset,
        Q => R5
    );
    
Reg_6 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(6),
        Clk => Clk,
        Clr => Reset,
        Q => R6
    );    
    
Reg_7 : Reg
    port map (
        D => Reg_in,
        En => Reg_en_sig(7),
        Clk => Clk,
        Clr => Reset,
        Q => R7
    );   

end Behavioral;
