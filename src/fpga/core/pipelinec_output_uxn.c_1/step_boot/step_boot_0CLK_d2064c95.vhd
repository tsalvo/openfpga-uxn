-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 22
entity step_boot_0CLK_d2064c95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out boot_step_result_t);
end step_boot_0CLK_d2064c95;
architecture arch of step_boot_0CLK_d2064c95 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ram_address : unsigned(15 downto 0) := to_unsigned(254, 16);
signal rom_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal rom_byte : unsigned(7 downto 0) := to_unsigned(0, 8);
signal boot_phase : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_finished : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_rom_address : unsigned(15 downto 0);
signal REG_COMB_rom_byte : unsigned(7 downto 0);
signal REG_COMB_boot_phase : unsigned(0 downto 0);
signal REG_COMB_is_finished : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l31_c6_602c]
signal BIN_OP_EQ_uxn_c_l31_c6_602c_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_602c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_602c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_6ebf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_bca8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_ba24]
signal rom_address_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_ba24]
signal ram_address_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(15 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_ba24]
signal rom_byte_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_ba24]
signal is_finished_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l32_c14_ac58]
signal read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_ac58_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_ac58_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_27b2[uxn_c_l33_c3_27b2]
signal printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_313a]
signal BIN_OP_EQ_uxn_c_l36_c11_313a_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_313a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_313a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_7301]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_bca8]
signal rom_address_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_bca8]
signal ram_address_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(15 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_bca8]
signal rom_byte_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_bca8]
signal is_finished_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l37_c14_2724]
signal read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_2724_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_2724_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_e283[uxn_c_l38_c3_e283]
signal printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_d0bb]
signal BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_a969]
signal BIN_OP_PLUS_uxn_c_l40_c3_a969_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_a969_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_5f77]
signal BIN_OP_GT_uxn_c_l41_c17_5f77_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_5f77_right : unsigned(9 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_5f77_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_45db]
signal BIN_OP_PLUS_uxn_c_l45_c2_45db_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_45db_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output : unsigned(1 downto 0);

function CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return boot_step_result_t is
 
  variable base : boot_step_result_t; 
  variable return_output : boot_step_result_t;
begin
      base.is_valid_byte := ref_toks_0;
      base.is_finished := ref_toks_1;
      base.rom_byte := ref_toks_2;
      base.ram_address := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l31_c6_602c
BIN_OP_EQ_uxn_c_l31_c6_602c : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_602c_left,
BIN_OP_EQ_uxn_c_l31_c6_602c_right,
BIN_OP_EQ_uxn_c_l31_c6_602c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output);

-- rom_address_MUX_uxn_c_l31_c2_ba24
rom_address_MUX_uxn_c_l31_c2_ba24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_ba24_cond,
rom_address_MUX_uxn_c_l31_c2_ba24_iftrue,
rom_address_MUX_uxn_c_l31_c2_ba24_iffalse,
rom_address_MUX_uxn_c_l31_c2_ba24_return_output);

-- ram_address_MUX_uxn_c_l31_c2_ba24
ram_address_MUX_uxn_c_l31_c2_ba24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_ba24_cond,
ram_address_MUX_uxn_c_l31_c2_ba24_iftrue,
ram_address_MUX_uxn_c_l31_c2_ba24_iffalse,
ram_address_MUX_uxn_c_l31_c2_ba24_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_ba24
rom_byte_MUX_uxn_c_l31_c2_ba24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_ba24_cond,
rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue,
rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse,
rom_byte_MUX_uxn_c_l31_c2_ba24_return_output);

-- is_finished_MUX_uxn_c_l31_c2_ba24
is_finished_MUX_uxn_c_l31_c2_ba24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_ba24_cond,
is_finished_MUX_uxn_c_l31_c2_ba24_iftrue,
is_finished_MUX_uxn_c_l31_c2_ba24_iffalse,
is_finished_MUX_uxn_c_l31_c2_ba24_return_output);

-- read_rom_byte_uxn_c_l32_c14_ac58
read_rom_byte_uxn_c_l32_c14_ac58 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_ac58_read_address,
read_rom_byte_uxn_c_l32_c14_ac58_return_output);

-- printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2
printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2 : entity work.printf_uxn_c_l33_c3_27b2_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE,
printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_313a
BIN_OP_EQ_uxn_c_l36_c11_313a : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_313a_left,
BIN_OP_EQ_uxn_c_l36_c11_313a_right,
BIN_OP_EQ_uxn_c_l36_c11_313a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output);

-- rom_address_MUX_uxn_c_l36_c7_bca8
rom_address_MUX_uxn_c_l36_c7_bca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_bca8_cond,
rom_address_MUX_uxn_c_l36_c7_bca8_iftrue,
rom_address_MUX_uxn_c_l36_c7_bca8_iffalse,
rom_address_MUX_uxn_c_l36_c7_bca8_return_output);

-- ram_address_MUX_uxn_c_l36_c7_bca8
ram_address_MUX_uxn_c_l36_c7_bca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_bca8_cond,
ram_address_MUX_uxn_c_l36_c7_bca8_iftrue,
ram_address_MUX_uxn_c_l36_c7_bca8_iffalse,
ram_address_MUX_uxn_c_l36_c7_bca8_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_bca8
rom_byte_MUX_uxn_c_l36_c7_bca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_bca8_cond,
rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue,
rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse,
rom_byte_MUX_uxn_c_l36_c7_bca8_return_output);

-- is_finished_MUX_uxn_c_l36_c7_bca8
is_finished_MUX_uxn_c_l36_c7_bca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_bca8_cond,
is_finished_MUX_uxn_c_l36_c7_bca8_iftrue,
is_finished_MUX_uxn_c_l36_c7_bca8_iffalse,
is_finished_MUX_uxn_c_l36_c7_bca8_return_output);

-- read_rom_byte_uxn_c_l37_c14_2724
read_rom_byte_uxn_c_l37_c14_2724 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_2724_read_address,
read_rom_byte_uxn_c_l37_c14_2724_return_output);

-- printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283
printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283 : entity work.printf_uxn_c_l38_c3_e283_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE,
printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0,
printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_d0bb
BIN_OP_PLUS_uxn_c_l39_c3_d0bb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left,
BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right,
BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_a969
BIN_OP_PLUS_uxn_c_l40_c3_a969 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_a969_left,
BIN_OP_PLUS_uxn_c_l40_c3_a969_right,
BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_5f77
BIN_OP_GT_uxn_c_l41_c17_5f77 : entity work.BIN_OP_GT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_5f77_left,
BIN_OP_GT_uxn_c_l41_c17_5f77_right,
BIN_OP_GT_uxn_c_l41_c17_5f77_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_45db
BIN_OP_PLUS_uxn_c_l45_c2_45db : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_45db_left,
BIN_OP_PLUS_uxn_c_l45_c2_45db_right,
BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 ram_address,
 rom_address,
 rom_byte,
 boot_phase,
 is_finished,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l31_c6_602c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output,
 rom_address_MUX_uxn_c_l31_c2_ba24_return_output,
 ram_address_MUX_uxn_c_l31_c2_ba24_return_output,
 rom_byte_MUX_uxn_c_l31_c2_ba24_return_output,
 is_finished_MUX_uxn_c_l31_c2_ba24_return_output,
 read_rom_byte_uxn_c_l32_c14_ac58_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_313a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output,
 rom_address_MUX_uxn_c_l36_c7_bca8_return_output,
 ram_address_MUX_uxn_c_l36_c7_bca8_return_output,
 rom_byte_MUX_uxn_c_l36_c7_bca8_return_output,
 is_finished_MUX_uxn_c_l36_c7_bca8_return_output,
 read_rom_byte_uxn_c_l37_c14_2724_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output,
 BIN_OP_GT_uxn_c_l41_c17_5f77_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_bca8_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_ba24_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_ba24_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ac58_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ac58_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_5d91 : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_436b : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_daab : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_bca8_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_2724_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_2724_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_7e88 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_fe4d_return_output : boot_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_rom_address : unsigned(15 downto 0);
variable REG_VAR_rom_byte : unsigned(7 downto 0);
variable REG_VAR_boot_phase : unsigned(0 downto 0);
variable REG_VAR_is_finished : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ram_address := ram_address;
  REG_VAR_rom_address := rom_address;
  REG_VAR_rom_byte := rom_byte;
  REG_VAR_boot_phase := boot_phase;
  REG_VAR_is_finished := is_finished;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse := to_unsigned(0, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_right := to_unsigned(1023, 10);
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left := rom_address;
     VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_ac58_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_2724_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l45_c2_45db] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_45db_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_left;
     BIN_OP_PLUS_uxn_c_l45_c2_45db_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output := BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_a969] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_a969_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_left;
     BIN_OP_PLUS_uxn_c_l40_c3_a969_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output := BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_602c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_602c_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_left;
     BIN_OP_EQ_uxn_c_l31_c6_602c_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output := BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;

     -- BIN_OP_PLUS[uxn_c_l39_c3_d0bb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_left;
     BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output := BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output;

     -- BIN_OP_EQ[uxn_c_l36_c11_313a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_313a_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_left;
     BIN_OP_EQ_uxn_c_l36_c11_313a_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output := BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_ba24_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_ba24_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_ba24_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_602c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_313a_return_output;
     VAR_rom_address_uxn_c_l39_c3_5d91 := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_d0bb_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_436b := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_a969_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_7e88 := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_45db_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_7e88;
     VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iftrue := VAR_ram_address_uxn_c_l40_c3_436b;
     VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_left := VAR_rom_address_uxn_c_l39_c3_5d91;
     VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iftrue := VAR_rom_address_uxn_c_l39_c3_5d91;
     -- BIN_OP_GT[uxn_c_l41_c17_5f77] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_5f77_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_left;
     BIN_OP_GT_uxn_c_l41_c17_5f77_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_return_output := BIN_OP_GT_uxn_c_l41_c17_5f77_return_output;

     -- ram_address_MUX[uxn_c_l36_c7_bca8] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_bca8_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_bca8_cond;
     ram_address_MUX_uxn_c_l36_c7_bca8_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iftrue;
     ram_address_MUX_uxn_c_l36_c7_bca8_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_bca8_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_bca8_return_output := ram_address_MUX_uxn_c_l36_c7_bca8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_6ebf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_bca8] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_bca8_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_bca8_cond;
     rom_address_MUX_uxn_c_l36_c7_bca8_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iftrue;
     rom_address_MUX_uxn_c_l36_c7_bca8_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_bca8_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_bca8_return_output := rom_address_MUX_uxn_c_l36_c7_bca8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_bca8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_5f77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_bca8_return_output;
     VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6ebf_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_bca8_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_bca8_return_output;
     -- is_finished_MUX[uxn_c_l36_c7_bca8] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_bca8_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_bca8_cond;
     is_finished_MUX_uxn_c_l36_c7_bca8_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iftrue;
     is_finished_MUX_uxn_c_l36_c7_bca8_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_bca8_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_bca8_return_output := is_finished_MUX_uxn_c_l36_c7_bca8_return_output;

     -- ram_address_MUX[uxn_c_l31_c2_ba24] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_ba24_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_ba24_cond;
     ram_address_MUX_uxn_c_l31_c2_ba24_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iftrue;
     ram_address_MUX_uxn_c_l31_c2_ba24_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_ba24_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_ba24_return_output := ram_address_MUX_uxn_c_l31_c2_ba24_return_output;

     -- printf_uxn_c_l33_c3_27b2[uxn_c_l33_c3_27b2] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0 <= VAR_printf_uxn_c_l33_c3_27b2_uxn_c_l33_c3_27b2_arg0;
     -- Outputs

     -- read_rom_byte[uxn_c_l32_c14_ac58] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_ac58_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_ac58_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_ac58_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_ac58_return_output := read_rom_byte_uxn_c_l32_c14_ac58_return_output;

     -- rom_address_MUX[uxn_c_l31_c2_ba24] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_ba24_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_ba24_cond;
     rom_address_MUX_uxn_c_l31_c2_ba24_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iftrue;
     rom_address_MUX_uxn_c_l31_c2_ba24_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_ba24_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_ba24_return_output := rom_address_MUX_uxn_c_l31_c2_ba24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_7301] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7301_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_bca8_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_ba24_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_ac58_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_ba24_return_output;
     -- read_rom_byte[uxn_c_l37_c14_2724] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_2724_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_2724_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_2724_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_2724_return_output := read_rom_byte_uxn_c_l37_c14_2724_return_output;

     -- is_finished_MUX[uxn_c_l31_c2_ba24] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_ba24_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_ba24_cond;
     is_finished_MUX_uxn_c_l31_c2_ba24_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iftrue;
     is_finished_MUX_uxn_c_l31_c2_ba24_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_ba24_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_ba24_return_output := is_finished_MUX_uxn_c_l31_c2_ba24_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_ba24_return_output;
     VAR_rom_byte_uxn_c_l37_c3_daab := VAR_read_rom_byte_uxn_c_l37_c14_2724_return_output;
     VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_daab, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue := VAR_rom_byte_uxn_c_l37_c3_daab;
     -- rom_byte_MUX[uxn_c_l36_c7_bca8] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_bca8_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_cond;
     rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_return_output := rom_byte_MUX_uxn_c_l36_c7_bca8_return_output;

     -- printf_uxn_c_l38_c3_e283[uxn_c_l38_c3_e283] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0 <= VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg0;
     printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1 <= VAR_printf_uxn_c_l38_c3_e283_uxn_c_l38_c3_e283_arg1;
     -- Outputs

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_bca8_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_ba24] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_ba24_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_cond;
     rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_return_output := rom_byte_MUX_uxn_c_l31_c2_ba24_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_fe4d] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_fe4d_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_ba24_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_ba24_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_ba24_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_fe4d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_rom_address <= REG_VAR_rom_address;
REG_COMB_rom_byte <= REG_VAR_rom_byte;
REG_COMB_boot_phase <= REG_VAR_boot_phase;
REG_COMB_is_finished <= REG_VAR_is_finished;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ram_address <= REG_COMB_ram_address;
     rom_address <= REG_COMB_rom_address;
     rom_byte <= REG_COMB_rom_byte;
     boot_phase <= REG_COMB_boot_phase;
     is_finished <= REG_COMB_is_finished;
 end if;
 end if;
end process;

end arch;
