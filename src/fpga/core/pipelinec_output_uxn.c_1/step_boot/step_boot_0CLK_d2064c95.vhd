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
-- BIN_OP_EQ[uxn_c_l31_c6_c42a]
signal BIN_OP_EQ_uxn_c_l31_c6_c42a_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_c42a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_93f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_3c20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_4052]
signal rom_byte_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4052_return_output : unsigned(7 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_4052]
signal rom_address_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4052_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_4052]
signal ram_address_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4052_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_4052]
signal is_finished_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4052_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l32_c14_a154]
signal read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_a154_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_a154_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_1c28[uxn_c_l33_c3_1c28]
signal printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_2b49]
signal BIN_OP_EQ_uxn_c_l36_c11_2b49_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_2b49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_c12c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_3c20]
signal rom_byte_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(7 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_3c20]
signal rom_address_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_3c20]
signal ram_address_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_3c20]
signal is_finished_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l37_c14_7acd]
signal read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_7acd_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_7acd_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_b5c9[uxn_c_l38_c3_b5c9]
signal printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_e098]
signal BIN_OP_PLUS_uxn_c_l39_c3_e098_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_e098_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_4e37]
signal BIN_OP_PLUS_uxn_c_l40_c3_4e37_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_4e37_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_adbb]
signal BIN_OP_GT_uxn_c_l41_c17_adbb_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_adbb_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_adbb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_e219]
signal BIN_OP_PLUS_uxn_c_l45_c2_e219_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_e219_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_c42a
BIN_OP_EQ_uxn_c_l31_c6_c42a : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_c42a_left,
BIN_OP_EQ_uxn_c_l31_c6_c42a_right,
BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_4052
rom_byte_MUX_uxn_c_l31_c2_4052 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_4052_cond,
rom_byte_MUX_uxn_c_l31_c2_4052_iftrue,
rom_byte_MUX_uxn_c_l31_c2_4052_iffalse,
rom_byte_MUX_uxn_c_l31_c2_4052_return_output);

-- rom_address_MUX_uxn_c_l31_c2_4052
rom_address_MUX_uxn_c_l31_c2_4052 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_4052_cond,
rom_address_MUX_uxn_c_l31_c2_4052_iftrue,
rom_address_MUX_uxn_c_l31_c2_4052_iffalse,
rom_address_MUX_uxn_c_l31_c2_4052_return_output);

-- ram_address_MUX_uxn_c_l31_c2_4052
ram_address_MUX_uxn_c_l31_c2_4052 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_4052_cond,
ram_address_MUX_uxn_c_l31_c2_4052_iftrue,
ram_address_MUX_uxn_c_l31_c2_4052_iffalse,
ram_address_MUX_uxn_c_l31_c2_4052_return_output);

-- is_finished_MUX_uxn_c_l31_c2_4052
is_finished_MUX_uxn_c_l31_c2_4052 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_4052_cond,
is_finished_MUX_uxn_c_l31_c2_4052_iftrue,
is_finished_MUX_uxn_c_l31_c2_4052_iffalse,
is_finished_MUX_uxn_c_l31_c2_4052_return_output);

-- read_rom_byte_uxn_c_l32_c14_a154
read_rom_byte_uxn_c_l32_c14_a154 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_a154_read_address,
read_rom_byte_uxn_c_l32_c14_a154_return_output);

-- printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28
printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28 : entity work.printf_uxn_c_l33_c3_1c28_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE,
printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_2b49
BIN_OP_EQ_uxn_c_l36_c11_2b49 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_2b49_left,
BIN_OP_EQ_uxn_c_l36_c11_2b49_right,
BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_3c20
rom_byte_MUX_uxn_c_l36_c7_3c20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_3c20_cond,
rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue,
rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse,
rom_byte_MUX_uxn_c_l36_c7_3c20_return_output);

-- rom_address_MUX_uxn_c_l36_c7_3c20
rom_address_MUX_uxn_c_l36_c7_3c20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_3c20_cond,
rom_address_MUX_uxn_c_l36_c7_3c20_iftrue,
rom_address_MUX_uxn_c_l36_c7_3c20_iffalse,
rom_address_MUX_uxn_c_l36_c7_3c20_return_output);

-- ram_address_MUX_uxn_c_l36_c7_3c20
ram_address_MUX_uxn_c_l36_c7_3c20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_3c20_cond,
ram_address_MUX_uxn_c_l36_c7_3c20_iftrue,
ram_address_MUX_uxn_c_l36_c7_3c20_iffalse,
ram_address_MUX_uxn_c_l36_c7_3c20_return_output);

-- is_finished_MUX_uxn_c_l36_c7_3c20
is_finished_MUX_uxn_c_l36_c7_3c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_3c20_cond,
is_finished_MUX_uxn_c_l36_c7_3c20_iftrue,
is_finished_MUX_uxn_c_l36_c7_3c20_iffalse,
is_finished_MUX_uxn_c_l36_c7_3c20_return_output);

-- read_rom_byte_uxn_c_l37_c14_7acd
read_rom_byte_uxn_c_l37_c14_7acd : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_7acd_read_address,
read_rom_byte_uxn_c_l37_c14_7acd_return_output);

-- printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9
printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9 : entity work.printf_uxn_c_l38_c3_b5c9_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE,
printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0,
printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_e098
BIN_OP_PLUS_uxn_c_l39_c3_e098 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_e098_left,
BIN_OP_PLUS_uxn_c_l39_c3_e098_right,
BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_4e37
BIN_OP_PLUS_uxn_c_l40_c3_4e37 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_4e37_left,
BIN_OP_PLUS_uxn_c_l40_c3_4e37_right,
BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_adbb
BIN_OP_GT_uxn_c_l41_c17_adbb : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_adbb_left,
BIN_OP_GT_uxn_c_l41_c17_adbb_right,
BIN_OP_GT_uxn_c_l41_c17_adbb_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_e219
BIN_OP_PLUS_uxn_c_l45_c2_e219 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_e219_left,
BIN_OP_PLUS_uxn_c_l45_c2_e219_right,
BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output,
 rom_byte_MUX_uxn_c_l31_c2_4052_return_output,
 rom_address_MUX_uxn_c_l31_c2_4052_return_output,
 ram_address_MUX_uxn_c_l31_c2_4052_return_output,
 is_finished_MUX_uxn_c_l31_c2_4052_return_output,
 read_rom_byte_uxn_c_l32_c14_a154_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output,
 rom_byte_MUX_uxn_c_l36_c7_3c20_return_output,
 rom_address_MUX_uxn_c_l36_c7_3c20_return_output,
 ram_address_MUX_uxn_c_l36_c7_3c20_return_output,
 is_finished_MUX_uxn_c_l36_c7_3c20_return_output,
 read_rom_byte_uxn_c_l37_c14_7acd_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output,
 BIN_OP_GT_uxn_c_l41_c17_adbb_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4052_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4052_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4052_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4052_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4052_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_3c20_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4052_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4052_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_a154_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_a154_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_aeb8 : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_efea : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_23cb : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_3c20_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_7acd_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_7acd_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_8d95 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8fd5_return_output : boot_step_result_t;
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
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_right := to_unsigned(511, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse := to_unsigned(0, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_4052_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_4052_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_left := rom_address;
     VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_a154_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_7acd_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_4052_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l39_c3_e098] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_e098_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_left;
     BIN_OP_PLUS_uxn_c_l39_c3_e098_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output := BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output;

     -- BIN_OP_EQ[uxn_c_l36_c11_2b49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_2b49_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_left;
     BIN_OP_EQ_uxn_c_l36_c11_2b49_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output := BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;

     -- BIN_OP_PLUS[uxn_c_l45_c2_e219] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_e219_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_left;
     BIN_OP_PLUS_uxn_c_l45_c2_e219_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output := BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_4e37] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_4e37_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_left;
     BIN_OP_PLUS_uxn_c_l40_c3_4e37_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output := BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_c42a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_c42a_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_left;
     BIN_OP_EQ_uxn_c_l31_c6_c42a_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output := BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_4052_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_4052_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_4052_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_4052_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_c42a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_3c20_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_3c20_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_3c20_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2b49_return_output;
     VAR_rom_address_uxn_c_l39_c3_efea := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_e098_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_23cb := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_4e37_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_8d95 := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_e219_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_8d95;
     VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iftrue := VAR_ram_address_uxn_c_l40_c3_23cb;
     VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_left := VAR_rom_address_uxn_c_l39_c3_efea;
     VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iftrue := VAR_rom_address_uxn_c_l39_c3_efea;
     -- ram_address_MUX[uxn_c_l36_c7_3c20] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_3c20_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_3c20_cond;
     ram_address_MUX_uxn_c_l36_c7_3c20_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iftrue;
     ram_address_MUX_uxn_c_l36_c7_3c20_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_3c20_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_3c20_return_output := ram_address_MUX_uxn_c_l36_c7_3c20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_93f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_3c20] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_3c20_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_3c20_cond;
     rom_address_MUX_uxn_c_l36_c7_3c20_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iftrue;
     rom_address_MUX_uxn_c_l36_c7_3c20_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_3c20_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_3c20_return_output := rom_address_MUX_uxn_c_l36_c7_3c20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_3c20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output;

     -- BIN_OP_GT[uxn_c_l41_c17_adbb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_adbb_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_left;
     BIN_OP_GT_uxn_c_l41_c17_adbb_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_return_output := BIN_OP_GT_uxn_c_l41_c17_adbb_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_adbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_3c20_return_output;
     VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_93f9_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_4052_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_3c20_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_4052_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_3c20_return_output;
     -- rom_address_MUX[uxn_c_l31_c2_4052] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_4052_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_4052_cond;
     rom_address_MUX_uxn_c_l31_c2_4052_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_4052_iftrue;
     rom_address_MUX_uxn_c_l31_c2_4052_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_4052_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_4052_return_output := rom_address_MUX_uxn_c_l31_c2_4052_return_output;

     -- read_rom_byte[uxn_c_l32_c14_a154] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_a154_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_a154_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_a154_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_a154_return_output := read_rom_byte_uxn_c_l32_c14_a154_return_output;

     -- printf_uxn_c_l33_c3_1c28[uxn_c_l33_c3_1c28] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0 <= VAR_printf_uxn_c_l33_c3_1c28_uxn_c_l33_c3_1c28_arg0;
     -- Outputs

     -- ram_address_MUX[uxn_c_l31_c2_4052] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_4052_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_4052_cond;
     ram_address_MUX_uxn_c_l31_c2_4052_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_4052_iftrue;
     ram_address_MUX_uxn_c_l31_c2_4052_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_4052_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_4052_return_output := ram_address_MUX_uxn_c_l31_c2_4052_return_output;

     -- is_finished_MUX[uxn_c_l36_c7_3c20] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_3c20_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_3c20_cond;
     is_finished_MUX_uxn_c_l36_c7_3c20_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iftrue;
     is_finished_MUX_uxn_c_l36_c7_3c20_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_3c20_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_3c20_return_output := is_finished_MUX_uxn_c_l36_c7_3c20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_c12c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_c12c_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_4052_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_3c20_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_4052_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_a154_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_4052_return_output;
     -- read_rom_byte[uxn_c_l37_c14_7acd] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_7acd_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_7acd_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_7acd_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_7acd_return_output := read_rom_byte_uxn_c_l37_c14_7acd_return_output;

     -- is_finished_MUX[uxn_c_l31_c2_4052] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_4052_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_4052_cond;
     is_finished_MUX_uxn_c_l31_c2_4052_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_4052_iftrue;
     is_finished_MUX_uxn_c_l31_c2_4052_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_4052_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_4052_return_output := is_finished_MUX_uxn_c_l31_c2_4052_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_4052_return_output;
     VAR_rom_byte_uxn_c_l37_c3_aeb8 := VAR_read_rom_byte_uxn_c_l37_c14_7acd_return_output;
     VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_aeb8, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue := VAR_rom_byte_uxn_c_l37_c3_aeb8;
     -- printf_uxn_c_l38_c3_b5c9[uxn_c_l38_c3_b5c9] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0 <= VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg0;
     printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1 <= VAR_printf_uxn_c_l38_c3_b5c9_uxn_c_l38_c3_b5c9_arg1;
     -- Outputs

     -- rom_byte_MUX[uxn_c_l36_c7_3c20] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_3c20_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_cond;
     rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_return_output := rom_byte_MUX_uxn_c_l36_c7_3c20_return_output;

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_3c20_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_4052] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_4052_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_4052_cond;
     rom_byte_MUX_uxn_c_l31_c2_4052_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_4052_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_4052_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_4052_return_output := rom_byte_MUX_uxn_c_l31_c2_4052_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_4052_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_8fd5] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8fd5_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_4052_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_4052_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_4052_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8fd5_return_output;
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
