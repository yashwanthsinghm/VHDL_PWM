----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2020 12:16:12 AM
-- Design Name: 
-- Module Name: pwm_v - Behavioral
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
--entity pwm_v is
--  Port ( );
--end pwm_v;
--architecture Behavioral of pwm_v is
--begin
--nd Behavioral;*/
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity pwm_v is
    Port (  clk:in std_logic;
            a:in std_logic;
            output : out STD_LOGIC);
end pwm_v;

architecture Behavioral of pwm_v is
signal count : integer := 0;
signal limit : integer := 10;
signal limit1  : integer := 40;
signal count1 : integer := 0;
signal flag : bit :='1'; --
begin
    process(clk,a)
    begin
        if(clk'event and clk='1') then
            if(limit >= 50 and flag='1' ) then
                if(a = '1')then
                    count <= count +1;
                    if(count < 50)then
                        output <= '1';
                    elsif(count > 50 and count < 100)then
                        output <= '0';
                    elsif (count = 100)then
                        limit <= limit + 10;
                        count <= 0;
                    end if;    
                else
                    count1<=count1+1;
                    if (limit1 = 0)then
                        flag<='0';
                    end if;                    
                    if(count1<limit1) then
                        output<='1';
                    elsif(count1>limit1 and count1<100)then
                        output<='0';
                    elsif(count1=100)then
                        count1<=0;
                        limit1<=limit1-10;
                    end if;

                end if;
            elsif(count <= limit and a = '1' and flag ='1') then
                count <= count + 1;
                output <= '1';
            elsif(count > limit and a = '1' and flag ='1') then
                count <= count + 1;
                output <= '0';
                if(count = 100) then
                    count <= 0;
                    limit<=limit + 10;         
                end if;
            elsif(a='0')then
                output <= '0';
                flag<= '0';
            end if;
        end if;
   end process;        
end Behavioral;