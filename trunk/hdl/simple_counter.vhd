----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:07 04/14/2012 
-- Design Name: 
-- Module Name:    simple_counter - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_counter is
	 generic(MODULO : positive := 16 ; NBIT : positive := 4);
    Port ( clk : in  STD_LOGIC;
           arazb : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(NBIT - 1 downto 0)
			  );
end simple_counter;

architecture Behavioral of simple_counter is
signal Qp : std_logic_vector(NBIT - 1 downto 0);
begin

 process(clk, arazb)
    begin
	if arazb = '0' then
 	    Qp <= (others => '0') ;
	elsif clk'event and clk = '1' then
	    if sraz = '1' then
			Qp <= (others => '0') ;
		 elsif en = '1' then
				Qp <= Qp + 1;
	    end if;
	end if;
 end process;	
	
    -- concurrent assignment statement
    Q <=  Qp;
end Behavioral;

