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
-- BIN_OP_EQ[uxn_c_l31_c6_5db8]
signal BIN_OP_EQ_uxn_c_l31_c6_5db8_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_5db8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_8acb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_03f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_0a57]
signal rom_byte_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_0a57]
signal is_finished_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_0a57]
signal rom_address_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_0a57]
signal ram_address_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l32_c14_ebbe]
signal read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_ebbe_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_ebbe_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_f870[uxn_c_l33_c3_f870]
signal printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_20d4]
signal BIN_OP_EQ_uxn_c_l36_c11_20d4_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_20d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_e6f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_03f8]
signal rom_byte_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_03f8]
signal is_finished_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_03f8]
signal rom_address_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(15 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_03f8]
signal ram_address_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l37_c14_3b97]
signal read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_3b97_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_3b97_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_12f4[uxn_c_l38_c3_12f4]
signal printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_c32c]
signal BIN_OP_PLUS_uxn_c_l39_c3_c32c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_c32c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_decb]
signal BIN_OP_PLUS_uxn_c_l40_c3_decb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_decb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_660c]
signal BIN_OP_GT_uxn_c_l41_c17_660c_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_660c_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_660c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_ab93]
signal BIN_OP_PLUS_uxn_c_l45_c2_ab93_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_ab93_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_5db8
BIN_OP_EQ_uxn_c_l31_c6_5db8 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_5db8_left,
BIN_OP_EQ_uxn_c_l31_c6_5db8_right,
BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_0a57
rom_byte_MUX_uxn_c_l31_c2_0a57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_0a57_cond,
rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue,
rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse,
rom_byte_MUX_uxn_c_l31_c2_0a57_return_output);

-- is_finished_MUX_uxn_c_l31_c2_0a57
is_finished_MUX_uxn_c_l31_c2_0a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_0a57_cond,
is_finished_MUX_uxn_c_l31_c2_0a57_iftrue,
is_finished_MUX_uxn_c_l31_c2_0a57_iffalse,
is_finished_MUX_uxn_c_l31_c2_0a57_return_output);

-- rom_address_MUX_uxn_c_l31_c2_0a57
rom_address_MUX_uxn_c_l31_c2_0a57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_0a57_cond,
rom_address_MUX_uxn_c_l31_c2_0a57_iftrue,
rom_address_MUX_uxn_c_l31_c2_0a57_iffalse,
rom_address_MUX_uxn_c_l31_c2_0a57_return_output);

-- ram_address_MUX_uxn_c_l31_c2_0a57
ram_address_MUX_uxn_c_l31_c2_0a57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_0a57_cond,
ram_address_MUX_uxn_c_l31_c2_0a57_iftrue,
ram_address_MUX_uxn_c_l31_c2_0a57_iffalse,
ram_address_MUX_uxn_c_l31_c2_0a57_return_output);

-- read_rom_byte_uxn_c_l32_c14_ebbe
read_rom_byte_uxn_c_l32_c14_ebbe : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_ebbe_read_address,
read_rom_byte_uxn_c_l32_c14_ebbe_return_output);

-- printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870
printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870 : entity work.printf_uxn_c_l33_c3_f870_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE,
printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_20d4
BIN_OP_EQ_uxn_c_l36_c11_20d4 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_20d4_left,
BIN_OP_EQ_uxn_c_l36_c11_20d4_right,
BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_03f8
rom_byte_MUX_uxn_c_l36_c7_03f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_03f8_cond,
rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue,
rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse,
rom_byte_MUX_uxn_c_l36_c7_03f8_return_output);

-- is_finished_MUX_uxn_c_l36_c7_03f8
is_finished_MUX_uxn_c_l36_c7_03f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_03f8_cond,
is_finished_MUX_uxn_c_l36_c7_03f8_iftrue,
is_finished_MUX_uxn_c_l36_c7_03f8_iffalse,
is_finished_MUX_uxn_c_l36_c7_03f8_return_output);

-- rom_address_MUX_uxn_c_l36_c7_03f8
rom_address_MUX_uxn_c_l36_c7_03f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_03f8_cond,
rom_address_MUX_uxn_c_l36_c7_03f8_iftrue,
rom_address_MUX_uxn_c_l36_c7_03f8_iffalse,
rom_address_MUX_uxn_c_l36_c7_03f8_return_output);

-- ram_address_MUX_uxn_c_l36_c7_03f8
ram_address_MUX_uxn_c_l36_c7_03f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_03f8_cond,
ram_address_MUX_uxn_c_l36_c7_03f8_iftrue,
ram_address_MUX_uxn_c_l36_c7_03f8_iffalse,
ram_address_MUX_uxn_c_l36_c7_03f8_return_output);

-- read_rom_byte_uxn_c_l37_c14_3b97
read_rom_byte_uxn_c_l37_c14_3b97 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_3b97_read_address,
read_rom_byte_uxn_c_l37_c14_3b97_return_output);

-- printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4
printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4 : entity work.printf_uxn_c_l38_c3_12f4_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE,
printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0,
printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_c32c
BIN_OP_PLUS_uxn_c_l39_c3_c32c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_c32c_left,
BIN_OP_PLUS_uxn_c_l39_c3_c32c_right,
BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_decb
BIN_OP_PLUS_uxn_c_l40_c3_decb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_decb_left,
BIN_OP_PLUS_uxn_c_l40_c3_decb_right,
BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_660c
BIN_OP_GT_uxn_c_l41_c17_660c : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_660c_left,
BIN_OP_GT_uxn_c_l41_c17_660c_right,
BIN_OP_GT_uxn_c_l41_c17_660c_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_ab93
BIN_OP_PLUS_uxn_c_l45_c2_ab93 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_ab93_left,
BIN_OP_PLUS_uxn_c_l45_c2_ab93_right,
BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output,
 rom_byte_MUX_uxn_c_l31_c2_0a57_return_output,
 is_finished_MUX_uxn_c_l31_c2_0a57_return_output,
 rom_address_MUX_uxn_c_l31_c2_0a57_return_output,
 ram_address_MUX_uxn_c_l31_c2_0a57_return_output,
 read_rom_byte_uxn_c_l32_c14_ebbe_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output,
 rom_byte_MUX_uxn_c_l36_c7_03f8_return_output,
 is_finished_MUX_uxn_c_l36_c7_03f8_return_output,
 rom_address_MUX_uxn_c_l36_c7_03f8_return_output,
 ram_address_MUX_uxn_c_l36_c7_03f8_return_output,
 read_rom_byte_uxn_c_l37_c14_3b97_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output,
 BIN_OP_GT_uxn_c_l41_c17_660c_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_03f8_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_0a57_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_0a57_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ebbe_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_ebbe_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_f0fe : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_70ae : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_15d9 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_03f8_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_3b97_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_3b97_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_660c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_660c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_660c_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_f553 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8779_return_output : boot_step_result_t;
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
     VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue := to_unsigned(0, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_660c_right := to_unsigned(511, 9);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_left := rom_address;
     VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_ebbe_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_3b97_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l39_c3_c32c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_c32c_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_left;
     BIN_OP_PLUS_uxn_c_l39_c3_c32c_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output := BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output;

     -- BIN_OP_EQ[uxn_c_l36_c11_20d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_20d4_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_left;
     BIN_OP_EQ_uxn_c_l36_c11_20d4_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output := BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_5db8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_5db8_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_left;
     BIN_OP_EQ_uxn_c_l31_c6_5db8_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output := BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;

     -- BIN_OP_PLUS[uxn_c_l45_c2_ab93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_ab93_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_left;
     BIN_OP_PLUS_uxn_c_l45_c2_ab93_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output := BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_decb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_decb_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_left;
     BIN_OP_PLUS_uxn_c_l40_c3_decb_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output := BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_0a57_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_0a57_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_0a57_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_5db8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_03f8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_03f8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_03f8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_20d4_return_output;
     VAR_rom_address_uxn_c_l39_c3_70ae := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_c32c_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_15d9 := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_decb_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_f553 := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_ab93_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_f553;
     VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iftrue := VAR_ram_address_uxn_c_l40_c3_15d9;
     VAR_BIN_OP_GT_uxn_c_l41_c17_660c_left := VAR_rom_address_uxn_c_l39_c3_70ae;
     VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iftrue := VAR_rom_address_uxn_c_l39_c3_70ae;
     -- rom_address_MUX[uxn_c_l36_c7_03f8] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_03f8_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_03f8_cond;
     rom_address_MUX_uxn_c_l36_c7_03f8_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iftrue;
     rom_address_MUX_uxn_c_l36_c7_03f8_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_03f8_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_03f8_return_output := rom_address_MUX_uxn_c_l36_c7_03f8_return_output;

     -- ram_address_MUX[uxn_c_l36_c7_03f8] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_03f8_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_03f8_cond;
     ram_address_MUX_uxn_c_l36_c7_03f8_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iftrue;
     ram_address_MUX_uxn_c_l36_c7_03f8_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_03f8_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_03f8_return_output := ram_address_MUX_uxn_c_l36_c7_03f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_8acb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output;

     -- BIN_OP_GT[uxn_c_l41_c17_660c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_660c_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_660c_left;
     BIN_OP_GT_uxn_c_l41_c17_660c_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_660c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_660c_return_output := BIN_OP_GT_uxn_c_l41_c17_660c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_03f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_660c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_03f8_return_output;
     VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_8acb_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_03f8_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_03f8_return_output;
     -- printf_uxn_c_l33_c3_f870[uxn_c_l33_c3_f870] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0 <= VAR_printf_uxn_c_l33_c3_f870_uxn_c_l33_c3_f870_arg0;
     -- Outputs

     -- is_finished_MUX[uxn_c_l36_c7_03f8] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_03f8_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_03f8_cond;
     is_finished_MUX_uxn_c_l36_c7_03f8_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iftrue;
     is_finished_MUX_uxn_c_l36_c7_03f8_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_03f8_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_03f8_return_output := is_finished_MUX_uxn_c_l36_c7_03f8_return_output;

     -- read_rom_byte[uxn_c_l32_c14_ebbe] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_ebbe_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_ebbe_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_ebbe_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_ebbe_return_output := read_rom_byte_uxn_c_l32_c14_ebbe_return_output;

     -- ram_address_MUX[uxn_c_l31_c2_0a57] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_0a57_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_0a57_cond;
     ram_address_MUX_uxn_c_l31_c2_0a57_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iftrue;
     ram_address_MUX_uxn_c_l31_c2_0a57_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_0a57_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_0a57_return_output := ram_address_MUX_uxn_c_l31_c2_0a57_return_output;

     -- rom_address_MUX[uxn_c_l31_c2_0a57] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_0a57_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_0a57_cond;
     rom_address_MUX_uxn_c_l31_c2_0a57_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iftrue;
     rom_address_MUX_uxn_c_l31_c2_0a57_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_0a57_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_0a57_return_output := rom_address_MUX_uxn_c_l31_c2_0a57_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_e6f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_e6f9_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_03f8_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_0a57_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_ebbe_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_0a57_return_output;
     -- is_finished_MUX[uxn_c_l31_c2_0a57] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_0a57_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_0a57_cond;
     is_finished_MUX_uxn_c_l31_c2_0a57_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iftrue;
     is_finished_MUX_uxn_c_l31_c2_0a57_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_0a57_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_0a57_return_output := is_finished_MUX_uxn_c_l31_c2_0a57_return_output;

     -- read_rom_byte[uxn_c_l37_c14_3b97] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_3b97_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_3b97_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_3b97_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_3b97_return_output := read_rom_byte_uxn_c_l37_c14_3b97_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_0a57_return_output;
     VAR_rom_byte_uxn_c_l37_c3_f0fe := VAR_read_rom_byte_uxn_c_l37_c14_3b97_return_output;
     VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_f0fe, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue := VAR_rom_byte_uxn_c_l37_c3_f0fe;
     -- printf_uxn_c_l38_c3_12f4[uxn_c_l38_c3_12f4] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0 <= VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg0;
     printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1 <= VAR_printf_uxn_c_l38_c3_12f4_uxn_c_l38_c3_12f4_arg1;
     -- Outputs

     -- rom_byte_MUX[uxn_c_l36_c7_03f8] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_03f8_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_cond;
     rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_return_output := rom_byte_MUX_uxn_c_l36_c7_03f8_return_output;

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_03f8_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_0a57] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_0a57_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_cond;
     rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_return_output := rom_byte_MUX_uxn_c_l31_c2_0a57_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_8779] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8779_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_0a57_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_0a57_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_0a57_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_8779_return_output;
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
