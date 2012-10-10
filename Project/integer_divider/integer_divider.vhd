----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:56 10/07/2012 
-- Design Name: 
-- Module Name:    integer_divider - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity integer_divider is
	port(clock : in std_logic;
		  reset : in std_logic;
		  dividend : in integer;
		  divisor : in integer;
		  quotient : out integer;
		  remainder : out integer);
end integer_divider;

architecture Behavioral of integer_divider is
	signal numerator, quotient_signal, remainder_signal : integer;
	begin
		quotient <= quotient_signal;
		remainder <= remainder_signal;
		process(clock, reset) begin
			if (reset = '1') then
				numerator <= 0;
				quotient_signal <= 0;
				remainder_signal <= 0;
			elsif (clock'event and clock = '1') then
				if((dividend - numerator) >= divisor) then
					numerator <= numerator + divisor;
					quotient_signal <= quotient_signal + 1;
				else
					remainder_signal <= dividend - numerator;
				end if;
			end if;
		end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package integer_divider_package is
	component integer_divider
		port(clock : in std_logic;
			  reset : in std_logic;
			  dividend : in integer;
			  divisor : in integer;
			  quotient : out integer;
			  remainder : out integer);
	end component;
end package;
























