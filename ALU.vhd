----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:19:12 03/24/2020 
-- Design Name: 
-- Module Name:    Ass1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
    generic ( N       : integer := 5);
    Port    ( a       : in STD_LOGIC_VECTOR (N downto 0);
              b       : in STD_LOGIC_VECTOR (N downto 0);
              cin     : in STD_LOGIC;
              control : in STD_LOGIC_VECTOR (1 downto 0);
              cout    : out STD_LOGIC;
              d       : out STD_LOGIC_VECTOR (N downto 0));
end ALU;

architecture Behavioral of ALU is
signal tmp    : std_logic_vector (N+1 downto 0);

begin

p1:process (a,b,cin,control)
begin

case (control) is 
when "00" => 
tmp<=('0'&a) and ('0'&b) ;

when "01" => 
tmp<=('0'&a) or ('0'&b) ;

when "10" => 
tmp<=('0'&a) xor ('0'&b) ;

when "11" => 
tmp <= ('0'&a) + ('0'&b) + cin ;

when others =>
tmp<=('0'&a) ;

end case ;
end process p1;

d    <= tmp (N downto 0) ;
cout <= tmp (N+1);

end Behavioral;
