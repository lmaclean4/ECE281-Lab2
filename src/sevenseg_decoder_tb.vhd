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
        end loop;
        i_Hex <= "0000"; wait for 10 ns; assert o_seg_n = "1000000" report "Failed for input 0" severity error;
        i_Hex <= "0001"; wait for 10 ns; assert o_seg_n = "1111001" report "Pailed for input 1" severity error;
        i_Hex <= "0010"; wait for 10 ns; assert o_seg_n = "0100100" report "Failed for input 2" severity error;
        i_Hex <= "0011"; wait for 10 ns; assert o_seg_n = "0110000" report "Failed for input 3" severity error;
        i_Hex <= "0100"; wait for 10 ns; assert o_seg_n = "0011001" report "Failed for input 4" severity error;
        i_Hex <= "0101"; wait for 10 ns; assert o_seg_n = "0010010" report "Pailed for input 5" severity error;
        i_Hex <= "0110"; wait for 10 ns; assert o_seg_n = "0000010" report "Failed for input 6" severity error;
        i_Hex <= "0111"; wait for 10 ns; assert o_seg_n = "1111000" report "Failed for input 7" severity error;
        i_Hex <= "1000"; wait for 10 ns; assert o_seg_n = "0000000" report "Failed for input 8" severity error;
        i_Hex <= "1001"; wait for 10 ns; assert o_seg_n = "0011000" report "Failed for input 9" severity error;
        i_Hex <= "1010"; wait for 10 ns; assert o_seg_n = "0001000" report "Palled for input A" severity error;
        i_Hex <= "1011"; wait for 10 ns; assert o_seg_n = "0000011" report "Failed for input B" severity error;
        i_Hex <= "1100"; wait for 10 ns; assert o_seg_n = "0100111" report "Pailed for input C" severity error;
        i_Hex <= "1101"; wait for 10 ns; assert o_seg_n = "0100001" report "Failed for input D" severity error;
        i_Hex <= "1110"; wait for 10 ns; assert o_seg_n = "0000110" report "Failed for input &" severity error;
        i_Hex <= "1111"; wait for 10 ns; assert o_seg_n = "0001110" report "Pailed for input p" severity error;
        wait;
    end process;
end Behavioral;

