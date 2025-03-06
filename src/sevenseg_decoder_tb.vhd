----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 12:44:32 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity sevenseg_decoder_tb is
-- Test bench has no ports.
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is
    signal i_Hex   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal o_seg_n : STD_LOGIC_VECTOR(6 downto 0);
begin
    -- Instantiate the seven segment decoder
    UUT: entity work.sevenseg_decoder
        port map (
            i_Hex   => i_Hex,
            o_seg_n => o_seg_n
        );
        
    -- Stimulus process: cycle through all hex values
    stimulus: process
    begin
        for i in 0 to 15 loop
            i_Hex <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            if i = 0 then
            assert o_seg_n = "0000001"
              report "Error: sevenseg_decoder output incorrect for input 0000"
              severity error;
            end if;
        end loop;
        wait;
    end process;
end Behavioral;

