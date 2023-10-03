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
-- BIN_OP_EQ[uxn_c_l31_c6_9513]
signal BIN_OP_EQ_uxn_c_l31_c6_9513_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_9513_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_9513_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_50e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_beda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_378d]
signal ram_address_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_378d_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_378d]
signal rom_address_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_378d_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_378d]
signal is_finished_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_378d_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_378d]
signal rom_byte_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_378d_return_output : unsigned(7 downto 0);

-- read_rom_byte[uxn_c_l32_c14_3b13]
signal read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_3b13_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_3b13_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_70c8[uxn_c_l33_c3_70c8]
signal printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_9baa]
signal BIN_OP_EQ_uxn_c_l36_c11_9baa_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_9baa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_e2f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_beda]
signal ram_address_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_beda_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_beda]
signal rom_address_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_beda_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_beda]
signal is_finished_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_beda_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_beda]
signal rom_byte_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_beda_return_output : unsigned(7 downto 0);

-- read_rom_byte[uxn_c_l37_c14_c179]
signal read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_c179_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_c179_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_7acc[uxn_c_l38_c3_7acc]
signal printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_ac09]
signal BIN_OP_PLUS_uxn_c_l39_c3_ac09_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_ac09_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_8d98]
signal BIN_OP_PLUS_uxn_c_l40_c3_8d98_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_8d98_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_7297]
signal BIN_OP_GT_uxn_c_l41_c17_7297_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_7297_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_7297_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_b499]
signal BIN_OP_PLUS_uxn_c_l45_c2_b499_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_b499_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_9513
BIN_OP_EQ_uxn_c_l31_c6_9513 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_9513_left,
BIN_OP_EQ_uxn_c_l31_c6_9513_right,
BIN_OP_EQ_uxn_c_l31_c6_9513_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output);

-- ram_address_MUX_uxn_c_l31_c2_378d
ram_address_MUX_uxn_c_l31_c2_378d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_378d_cond,
ram_address_MUX_uxn_c_l31_c2_378d_iftrue,
ram_address_MUX_uxn_c_l31_c2_378d_iffalse,
ram_address_MUX_uxn_c_l31_c2_378d_return_output);

-- rom_address_MUX_uxn_c_l31_c2_378d
rom_address_MUX_uxn_c_l31_c2_378d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_378d_cond,
rom_address_MUX_uxn_c_l31_c2_378d_iftrue,
rom_address_MUX_uxn_c_l31_c2_378d_iffalse,
rom_address_MUX_uxn_c_l31_c2_378d_return_output);

-- is_finished_MUX_uxn_c_l31_c2_378d
is_finished_MUX_uxn_c_l31_c2_378d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_378d_cond,
is_finished_MUX_uxn_c_l31_c2_378d_iftrue,
is_finished_MUX_uxn_c_l31_c2_378d_iffalse,
is_finished_MUX_uxn_c_l31_c2_378d_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_378d
rom_byte_MUX_uxn_c_l31_c2_378d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_378d_cond,
rom_byte_MUX_uxn_c_l31_c2_378d_iftrue,
rom_byte_MUX_uxn_c_l31_c2_378d_iffalse,
rom_byte_MUX_uxn_c_l31_c2_378d_return_output);

-- read_rom_byte_uxn_c_l32_c14_3b13
read_rom_byte_uxn_c_l32_c14_3b13 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_3b13_read_address,
read_rom_byte_uxn_c_l32_c14_3b13_return_output);

-- printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8
printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8 : entity work.printf_uxn_c_l33_c3_70c8_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE,
printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_9baa
BIN_OP_EQ_uxn_c_l36_c11_9baa : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_9baa_left,
BIN_OP_EQ_uxn_c_l36_c11_9baa_right,
BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output);

-- ram_address_MUX_uxn_c_l36_c7_beda
ram_address_MUX_uxn_c_l36_c7_beda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_beda_cond,
ram_address_MUX_uxn_c_l36_c7_beda_iftrue,
ram_address_MUX_uxn_c_l36_c7_beda_iffalse,
ram_address_MUX_uxn_c_l36_c7_beda_return_output);

-- rom_address_MUX_uxn_c_l36_c7_beda
rom_address_MUX_uxn_c_l36_c7_beda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_beda_cond,
rom_address_MUX_uxn_c_l36_c7_beda_iftrue,
rom_address_MUX_uxn_c_l36_c7_beda_iffalse,
rom_address_MUX_uxn_c_l36_c7_beda_return_output);

-- is_finished_MUX_uxn_c_l36_c7_beda
is_finished_MUX_uxn_c_l36_c7_beda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_beda_cond,
is_finished_MUX_uxn_c_l36_c7_beda_iftrue,
is_finished_MUX_uxn_c_l36_c7_beda_iffalse,
is_finished_MUX_uxn_c_l36_c7_beda_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_beda
rom_byte_MUX_uxn_c_l36_c7_beda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_beda_cond,
rom_byte_MUX_uxn_c_l36_c7_beda_iftrue,
rom_byte_MUX_uxn_c_l36_c7_beda_iffalse,
rom_byte_MUX_uxn_c_l36_c7_beda_return_output);

-- read_rom_byte_uxn_c_l37_c14_c179
read_rom_byte_uxn_c_l37_c14_c179 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_c179_read_address,
read_rom_byte_uxn_c_l37_c14_c179_return_output);

-- printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc
printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc : entity work.printf_uxn_c_l38_c3_7acc_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE,
printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0,
printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_ac09
BIN_OP_PLUS_uxn_c_l39_c3_ac09 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_ac09_left,
BIN_OP_PLUS_uxn_c_l39_c3_ac09_right,
BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_8d98
BIN_OP_PLUS_uxn_c_l40_c3_8d98 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_8d98_left,
BIN_OP_PLUS_uxn_c_l40_c3_8d98_right,
BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_7297
BIN_OP_GT_uxn_c_l41_c17_7297 : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_7297_left,
BIN_OP_GT_uxn_c_l41_c17_7297_right,
BIN_OP_GT_uxn_c_l41_c17_7297_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_b499
BIN_OP_PLUS_uxn_c_l45_c2_b499 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_b499_left,
BIN_OP_PLUS_uxn_c_l45_c2_b499_right,
BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_9513_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output,
 ram_address_MUX_uxn_c_l31_c2_378d_return_output,
 rom_address_MUX_uxn_c_l31_c2_378d_return_output,
 is_finished_MUX_uxn_c_l31_c2_378d_return_output,
 rom_byte_MUX_uxn_c_l31_c2_378d_return_output,
 read_rom_byte_uxn_c_l32_c14_3b13_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output,
 ram_address_MUX_uxn_c_l36_c7_beda_return_output,
 rom_address_MUX_uxn_c_l36_c7_beda_return_output,
 is_finished_MUX_uxn_c_l36_c7_beda_return_output,
 rom_byte_MUX_uxn_c_l36_c7_beda_return_output,
 read_rom_byte_uxn_c_l37_c14_c179_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output,
 BIN_OP_GT_uxn_c_l41_c17_7297_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_beda_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_378d_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_beda_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_378d_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_beda_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_378d_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_beda_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_378d_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_378d_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_3b13_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_3b13_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_660b : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_5b72 : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_c8b0 : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_beda_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_c179_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_c179_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_7297_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_7297_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_7297_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_593e : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_70fc_return_output : boot_step_result_t;
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
     VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_right := to_unsigned(1, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_378d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_7297_right := to_unsigned(511, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_beda_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_378d_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_beda_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_left := rom_address;
     VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_3b13_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_c179_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_378d_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_beda_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iffalse := rom_byte;
     -- BIN_OP_EQ[uxn_c_l36_c11_9baa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_9baa_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_left;
     BIN_OP_EQ_uxn_c_l36_c11_9baa_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output := BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_8d98] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_8d98_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_left;
     BIN_OP_PLUS_uxn_c_l40_c3_8d98_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output := BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_9513] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_9513_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_left;
     BIN_OP_EQ_uxn_c_l31_c6_9513_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output := BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;

     -- BIN_OP_PLUS[uxn_c_l39_c3_ac09] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_ac09_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_left;
     BIN_OP_PLUS_uxn_c_l39_c3_ac09_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output := BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output;

     -- BIN_OP_PLUS[uxn_c_l45_c2_b499] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_b499_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_left;
     BIN_OP_PLUS_uxn_c_l45_c2_b499_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output := BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_378d_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_378d_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_378d_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_378d_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_9513_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_beda_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_beda_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_beda_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_beda_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_9baa_return_output;
     VAR_rom_address_uxn_c_l39_c3_5b72 := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_ac09_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_660b := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_8d98_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_593e := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_b499_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_593e;
     VAR_ram_address_MUX_uxn_c_l36_c7_beda_iftrue := VAR_ram_address_uxn_c_l40_c3_660b;
     VAR_BIN_OP_GT_uxn_c_l41_c17_7297_left := VAR_rom_address_uxn_c_l39_c3_5b72;
     VAR_rom_address_MUX_uxn_c_l36_c7_beda_iftrue := VAR_rom_address_uxn_c_l39_c3_5b72;
     -- BIN_OP_GT[uxn_c_l41_c17_7297] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_7297_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_7297_left;
     BIN_OP_GT_uxn_c_l41_c17_7297_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_7297_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_7297_return_output := BIN_OP_GT_uxn_c_l41_c17_7297_return_output;

     -- ram_address_MUX[uxn_c_l36_c7_beda] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_beda_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_beda_cond;
     ram_address_MUX_uxn_c_l36_c7_beda_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_beda_iftrue;
     ram_address_MUX_uxn_c_l36_c7_beda_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_beda_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_beda_return_output := ram_address_MUX_uxn_c_l36_c7_beda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_50e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_beda] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_beda_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_beda_cond;
     rom_address_MUX_uxn_c_l36_c7_beda_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_beda_iftrue;
     rom_address_MUX_uxn_c_l36_c7_beda_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_beda_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_beda_return_output := rom_address_MUX_uxn_c_l36_c7_beda_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_beda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_beda_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_7297_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_beda_return_output;
     VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_50e1_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_378d_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_beda_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_378d_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_beda_return_output;
     -- ram_address_MUX[uxn_c_l31_c2_378d] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_378d_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_378d_cond;
     ram_address_MUX_uxn_c_l31_c2_378d_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_378d_iftrue;
     ram_address_MUX_uxn_c_l31_c2_378d_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_378d_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_378d_return_output := ram_address_MUX_uxn_c_l31_c2_378d_return_output;

     -- printf_uxn_c_l33_c3_70c8[uxn_c_l33_c3_70c8] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0 <= VAR_printf_uxn_c_l33_c3_70c8_uxn_c_l33_c3_70c8_arg0;
     -- Outputs

     -- rom_address_MUX[uxn_c_l31_c2_378d] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_378d_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_378d_cond;
     rom_address_MUX_uxn_c_l31_c2_378d_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_378d_iftrue;
     rom_address_MUX_uxn_c_l31_c2_378d_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_378d_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_378d_return_output := rom_address_MUX_uxn_c_l31_c2_378d_return_output;

     -- is_finished_MUX[uxn_c_l36_c7_beda] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_beda_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_beda_cond;
     is_finished_MUX_uxn_c_l36_c7_beda_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_beda_iftrue;
     is_finished_MUX_uxn_c_l36_c7_beda_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_beda_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_beda_return_output := is_finished_MUX_uxn_c_l36_c7_beda_return_output;

     -- read_rom_byte[uxn_c_l32_c14_3b13] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_3b13_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_3b13_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_3b13_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_3b13_return_output := read_rom_byte_uxn_c_l32_c14_3b13_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_e2f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e2f8_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_378d_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_beda_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_378d_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_3b13_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_378d_return_output;
     -- read_rom_byte[uxn_c_l37_c14_c179] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_c179_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_c179_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_c179_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_c179_return_output := read_rom_byte_uxn_c_l37_c14_c179_return_output;

     -- is_finished_MUX[uxn_c_l31_c2_378d] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_378d_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_378d_cond;
     is_finished_MUX_uxn_c_l31_c2_378d_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_378d_iftrue;
     is_finished_MUX_uxn_c_l31_c2_378d_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_378d_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_378d_return_output := is_finished_MUX_uxn_c_l31_c2_378d_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_378d_return_output;
     VAR_rom_byte_uxn_c_l37_c3_c8b0 := VAR_read_rom_byte_uxn_c_l37_c14_c179_return_output;
     VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_c8b0, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iftrue := VAR_rom_byte_uxn_c_l37_c3_c8b0;
     -- rom_byte_MUX[uxn_c_l36_c7_beda] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_beda_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_beda_cond;
     rom_byte_MUX_uxn_c_l36_c7_beda_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_beda_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_beda_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_beda_return_output := rom_byte_MUX_uxn_c_l36_c7_beda_return_output;

     -- printf_uxn_c_l38_c3_7acc[uxn_c_l38_c3_7acc] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0 <= VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg0;
     printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1 <= VAR_printf_uxn_c_l38_c3_7acc_uxn_c_l38_c3_7acc_arg1;
     -- Outputs

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_beda_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_378d] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_378d_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_378d_cond;
     rom_byte_MUX_uxn_c_l31_c2_378d_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_378d_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_378d_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_378d_return_output := rom_byte_MUX_uxn_c_l31_c2_378d_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_378d_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_70fc] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_70fc_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_378d_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_378d_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_378d_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_70fc_return_output;
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
