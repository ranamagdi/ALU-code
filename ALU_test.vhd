--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:11:47 03/25/2020
-- Design Name:   
-- Module Name:   D:/Alu/ALU_test.vhd
-- Project Name:  Alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(5 downto 0);
         b : IN  std_logic_vector(5 downto 0);
         cin : IN  std_logic;
         control : IN  std_logic_vector(1 downto 0);
         cout : OUT  std_logic;
         d : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(5 downto 0) := (others => '0');
   signal b : std_logic_vector(5 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal cout : std_logic;
   signal d : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	Dut: ALU 
PORT MAP (A,B,cin,control,cout,d);

p1: process
begin  

---Test 1
A<="101011";
B<="010101";
control<="00";
cin<='0';
wait for 50 ns ;
Assert (d="000001") and (cout='0')
report "ERROR in test 1" severity error;
wait for 50 ns ;
---Test 2
A<="101010";
B<="010100";
control<="01";
cin<='0';
wait for 50 ns ;
Assert (d="111110") and (cout='0')
report "ERROR in test 2" severity error;
wait for 50 ns ;

---Test 3
A<="101001";
B<="010101";
control<="10";
cin<='0';
wait for 50 ns ;
Assert (d="111100") and (cout='0')
report "ERROR in test 3" severity error;
wait for 50 ns ;

---Test 4
A<="000000";
B<="111111";
control<="11";
cin<='0';
wait for 50 ns ;
Assert (d="111111") and (cout='0')
report "ERROR in test 4" severity error;
wait for 50 ns ;

---Test 5
A<="000000";
B<="111111";
control<="11";
cin<='1';
wait for 50 ns ;
Assert (d="000000") and (cout='1')
report "ERROR in test 5 " severity error;
wait for 50 ns ;
 
wait;
end process;



      
  

END;
