----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/17/2022 11:24:35 AM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
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
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
-- Slow Clock
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk_out : out STD_LOGIC
         );
end component;

-- Instruction Decoder
component Inst_Decoder
    Port ( Inst : in STD_LOGIC_VECTOR (0 to 11); -- Instruction
           Clk : in STD_LOGIC;
           Reg_Chk : in STD_LOGIC_VECTOR (3 downto 0); -- Check register value for JZR
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           Imd_Val : out STD_LOGIC_VECTOR (3 downto 0); -- Immediate value
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0); -- Enable register for write
           Load_Sel : out STD_LOGIC; -- Choose between Imd value or Add/Sub Unit result
           Add_Sub_Sel : out STD_LOGIC; -- Add Sub selector
           Jmp : out STD_LOGIC; -- Jump flag
           Jmp_Address : out STD_LOGIC_VECTOR (2 downto 0) -- Address to jump
         );
end component;

-- Program Rom
component Program_Rom
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (0 to 11)
         );
end component;

-- Program Counter
component PC
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0)
         );
end component;

-- Register Bank
component Reg_Bank
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Clr : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

-- 4 bit Add/Sub Unit
component Add_Sub_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Add/Sub Selector
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_Out : out STD_LOGIC; -- Carry flag
           Z_Out : out STD_LOGIC; -- Zero flag
           N_Out : out STD_LOGIC; -- Negetive flag
           P_Out : out STD_LOGIC -- Parity flag (Odd parity detector)
         );
end component;

-- 3 bit Adder
component Add_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0)
         );
end component;

-- 2-way 3-bit Mux
component Mux_2_3
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

-- 2-way 4-bit Mux
component Mux_2_4
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

-- 8-way 4-bit Mux
component Mux_8_4
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

type DATA_BUS is array (0 to 7) of std_logic_vector(3 downto 0);

signal Clk_slow : STD_LOGIC; -- Internal clock
signal LD, Sub, Jmp : STD_LOGIC;
signal Sel_A, Sel_B, Reg_En, Address, Jmp_Address, Prg_Address, Mem_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal A, B, S, D, M : STD_LOGIC_VECTOR (3 downto 0);
signal I : STD_LOGIC_VECTOR (0 to 11);
signal R : DATA_BUS;
begin

-- Slow Clock
Slow_Clock : Slow_Clk
    PORT MAP (
        Clk_in => Clk,
        Reset => Reset,
        Clk_out => Clk_slow
    );

-- Instruction Decoder
I_Decoder : Inst_Decoder
    PORT MAP (
        Inst => I, 
        Clk => Clk_slow, 
        Reg_Chk => A,
        Reg_Sel_A => Sel_A, 
        Reg_Sel_B => Sel_B, 
        Imd_Val => M, 
        Reg_En => Reg_En, 
        Load_Sel => LD, 
        Add_Sub_Sel => Sub, 
        Jmp => Jmp, 
        Jmp_Address => Jmp_Address
    );

-- Program Rom
Pro_Rom : Program_Rom
    PORT MAP (
        S => Mem_Sel,
        Q => I
    );

-- Program Counter
Pro_Counter : PC
    PORT MAP ( 
        D => Address,
        Clk => Clk_slow,
        Res => Reset,
        Q => Mem_Sel
    );

-- Register Bank
Register_Bank : Reg_Bank
    PORT MAP ( 
        D => D,
        I => Reg_En,
        Clk => Clk_slow,
        Clr => Reset,
        R0 => R(0),
        R1 => R(1),
        R2 => R(2),
        R3 => R(3),
        R4 => R(4),
        R5 => R(5),
        R6 => R(6),
        R7 => R(7)
    );

-- 4 bit Add/Sub Unit
AS_Unit : Add_Sub_Unit
    PORT MAP ( 
        A => A,
        B => B,
        Sel => Sub,
        S => S,
        C_Out => C_Flag,
        Z_Out => Z_Flag,
        N_Out => N_Flag,
        P_Out => P_Flag
    );

-- 3 bit Adder
Adder_3_bit : Add_3
    PORT MAP ( 
        A => Mem_Sel,
        S => Prg_Address
    );

-- 2-way 3-bit Mux
Mux_2_way_3_bit : Mux_2_3
    PORT MAP ( 
        I0 => Prg_Address,
        I1 => Jmp_Address,
        S => Jmp,
        Q => Address
    );

-- 2-way 4-bit Mux
Mux_2_way_4_bit : Mux_2_4
    PORT MAP ( 
        I0 => S,
        I1 => M,
        S => LD,
        Q => D
    );

-- 8-way 4-bit Mux
Mux_8_4_A : Mux_8_4
    PORT MAP ( 
        R0 => R(0),
        R1 => R(1),
        R2 => R(2),
        R3 => R(3),
        R4 => R(4),
        R5 => R(5),
        R6 => R(6),
        R7 => R(7),
        S => Sel_A,
        Q => A
    );

-- 8-way 4-bit Mux
Mux_8_4_B : Mux_8_4
    PORT MAP ( 
        R0 => R(0),
        R1 => R(1),
        R2 => R(2),
        R3 => R(3),
        R4 => R(4),
        R5 => R(5),
        R6 => R(6),
        R7 => R(7),
        S => Sel_B,
        Q => B
    );
    
-- 7-Segment Display
Seg7_LUT : LUT_16_7
    PORT MAP ( 
        address => R(7),
        data => Seg_7
    );

L <= R(7);
Anode <= "1110";

end Behavioral;
