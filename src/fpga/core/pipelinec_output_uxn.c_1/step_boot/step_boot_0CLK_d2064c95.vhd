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
-- BIN_OP_EQ[uxn_c_l31_c6_81a6]
signal BIN_OP_EQ_uxn_c_l31_c6_81a6_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_81a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_6f96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_adf3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_4eee]
signal rom_byte_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_4eee]
signal ram_address_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_4eee]
signal rom_address_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_4eee]
signal is_finished_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l32_c14_d910]
signal read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_d910_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_d910_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_cbdd[uxn_c_l33_c3_cbdd]
signal printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_7da3]
signal BIN_OP_EQ_uxn_c_l36_c11_7da3_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_7da3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_a070]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_adf3]
signal rom_byte_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_adf3]
signal ram_address_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_adf3]
signal rom_address_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_adf3]
signal is_finished_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(0 downto 0);

-- read_rom_byte[uxn_c_l37_c14_d510]
signal read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_d510_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_d510_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_eaec[uxn_c_l38_c3_eaec]
signal printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_bc4d]
signal BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_12de]
signal BIN_OP_PLUS_uxn_c_l40_c3_12de_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_12de_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_3347]
signal BIN_OP_GT_uxn_c_l41_c17_3347_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_3347_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_3347_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_487a]
signal BIN_OP_PLUS_uxn_c_l45_c2_487a_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_487a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_81a6
BIN_OP_EQ_uxn_c_l31_c6_81a6 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_81a6_left,
BIN_OP_EQ_uxn_c_l31_c6_81a6_right,
BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_4eee
rom_byte_MUX_uxn_c_l31_c2_4eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_4eee_cond,
rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue,
rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse,
rom_byte_MUX_uxn_c_l31_c2_4eee_return_output);

-- ram_address_MUX_uxn_c_l31_c2_4eee
ram_address_MUX_uxn_c_l31_c2_4eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_4eee_cond,
ram_address_MUX_uxn_c_l31_c2_4eee_iftrue,
ram_address_MUX_uxn_c_l31_c2_4eee_iffalse,
ram_address_MUX_uxn_c_l31_c2_4eee_return_output);

-- rom_address_MUX_uxn_c_l31_c2_4eee
rom_address_MUX_uxn_c_l31_c2_4eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_4eee_cond,
rom_address_MUX_uxn_c_l31_c2_4eee_iftrue,
rom_address_MUX_uxn_c_l31_c2_4eee_iffalse,
rom_address_MUX_uxn_c_l31_c2_4eee_return_output);

-- is_finished_MUX_uxn_c_l31_c2_4eee
is_finished_MUX_uxn_c_l31_c2_4eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_4eee_cond,
is_finished_MUX_uxn_c_l31_c2_4eee_iftrue,
is_finished_MUX_uxn_c_l31_c2_4eee_iffalse,
is_finished_MUX_uxn_c_l31_c2_4eee_return_output);

-- read_rom_byte_uxn_c_l32_c14_d910
read_rom_byte_uxn_c_l32_c14_d910 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_d910_read_address,
read_rom_byte_uxn_c_l32_c14_d910_return_output);

-- printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd
printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd : entity work.printf_uxn_c_l33_c3_cbdd_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE,
printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_7da3
BIN_OP_EQ_uxn_c_l36_c11_7da3 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_7da3_left,
BIN_OP_EQ_uxn_c_l36_c11_7da3_right,
BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_adf3
rom_byte_MUX_uxn_c_l36_c7_adf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_adf3_cond,
rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue,
rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse,
rom_byte_MUX_uxn_c_l36_c7_adf3_return_output);

-- ram_address_MUX_uxn_c_l36_c7_adf3
ram_address_MUX_uxn_c_l36_c7_adf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_adf3_cond,
ram_address_MUX_uxn_c_l36_c7_adf3_iftrue,
ram_address_MUX_uxn_c_l36_c7_adf3_iffalse,
ram_address_MUX_uxn_c_l36_c7_adf3_return_output);

-- rom_address_MUX_uxn_c_l36_c7_adf3
rom_address_MUX_uxn_c_l36_c7_adf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_adf3_cond,
rom_address_MUX_uxn_c_l36_c7_adf3_iftrue,
rom_address_MUX_uxn_c_l36_c7_adf3_iffalse,
rom_address_MUX_uxn_c_l36_c7_adf3_return_output);

-- is_finished_MUX_uxn_c_l36_c7_adf3
is_finished_MUX_uxn_c_l36_c7_adf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_adf3_cond,
is_finished_MUX_uxn_c_l36_c7_adf3_iftrue,
is_finished_MUX_uxn_c_l36_c7_adf3_iffalse,
is_finished_MUX_uxn_c_l36_c7_adf3_return_output);

-- read_rom_byte_uxn_c_l37_c14_d510
read_rom_byte_uxn_c_l37_c14_d510 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_d510_read_address,
read_rom_byte_uxn_c_l37_c14_d510_return_output);

-- printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec
printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec : entity work.printf_uxn_c_l38_c3_eaec_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE,
printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0,
printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_bc4d
BIN_OP_PLUS_uxn_c_l39_c3_bc4d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left,
BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right,
BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_12de
BIN_OP_PLUS_uxn_c_l40_c3_12de : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_12de_left,
BIN_OP_PLUS_uxn_c_l40_c3_12de_right,
BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_3347
BIN_OP_GT_uxn_c_l41_c17_3347 : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_3347_left,
BIN_OP_GT_uxn_c_l41_c17_3347_right,
BIN_OP_GT_uxn_c_l41_c17_3347_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_487a
BIN_OP_PLUS_uxn_c_l45_c2_487a : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_487a_left,
BIN_OP_PLUS_uxn_c_l45_c2_487a_right,
BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output,
 rom_byte_MUX_uxn_c_l31_c2_4eee_return_output,
 ram_address_MUX_uxn_c_l31_c2_4eee_return_output,
 rom_address_MUX_uxn_c_l31_c2_4eee_return_output,
 is_finished_MUX_uxn_c_l31_c2_4eee_return_output,
 read_rom_byte_uxn_c_l32_c14_d910_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output,
 rom_byte_MUX_uxn_c_l36_c7_adf3_return_output,
 ram_address_MUX_uxn_c_l36_c7_adf3_return_output,
 rom_address_MUX_uxn_c_l36_c7_adf3_return_output,
 is_finished_MUX_uxn_c_l36_c7_adf3_return_output,
 read_rom_byte_uxn_c_l37_c14_d510_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output,
 BIN_OP_GT_uxn_c_l41_c17_3347_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_adf3_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4eee_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_4eee_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_d910_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_d910_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_6b10 : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_a6c0 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_fc5d : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_adf3_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_d510_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_d510_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_3347_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_3347_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_3347_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_dbf5 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_afdd_return_output : boot_step_result_t;
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
     VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_3347_right := to_unsigned(511, 9);
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left := rom_address;
     VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_d910_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_d510_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l39_c3_bc4d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_left;
     BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output := BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_81a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_81a6_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_left;
     BIN_OP_EQ_uxn_c_l31_c6_81a6_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output := BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;

     -- BIN_OP_EQ[uxn_c_l36_c11_7da3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_7da3_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_left;
     BIN_OP_EQ_uxn_c_l36_c11_7da3_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output := BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_12de] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_12de_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_left;
     BIN_OP_PLUS_uxn_c_l40_c3_12de_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output := BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output;

     -- BIN_OP_PLUS[uxn_c_l45_c2_487a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_487a_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_left;
     BIN_OP_PLUS_uxn_c_l45_c2_487a_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output := BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_4eee_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_4eee_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_4eee_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_81a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_7da3_return_output;
     VAR_rom_address_uxn_c_l39_c3_fc5d := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_bc4d_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_a6c0 := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_12de_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_dbf5 := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_487a_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_dbf5;
     VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iftrue := VAR_ram_address_uxn_c_l40_c3_a6c0;
     VAR_BIN_OP_GT_uxn_c_l41_c17_3347_left := VAR_rom_address_uxn_c_l39_c3_fc5d;
     VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iftrue := VAR_rom_address_uxn_c_l39_c3_fc5d;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_6f96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_adf3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output;

     -- BIN_OP_GT[uxn_c_l41_c17_3347] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_3347_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_3347_left;
     BIN_OP_GT_uxn_c_l41_c17_3347_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_3347_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_3347_return_output := BIN_OP_GT_uxn_c_l41_c17_3347_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_adf3] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_adf3_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_adf3_cond;
     rom_address_MUX_uxn_c_l36_c7_adf3_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iftrue;
     rom_address_MUX_uxn_c_l36_c7_adf3_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_adf3_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_adf3_return_output := rom_address_MUX_uxn_c_l36_c7_adf3_return_output;

     -- ram_address_MUX[uxn_c_l36_c7_adf3] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_adf3_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_adf3_cond;
     ram_address_MUX_uxn_c_l36_c7_adf3_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iftrue;
     ram_address_MUX_uxn_c_l36_c7_adf3_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_adf3_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_adf3_return_output := ram_address_MUX_uxn_c_l36_c7_adf3_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_3347_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_adf3_return_output;
     VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_6f96_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_adf3_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_adf3_return_output;
     -- rom_address_MUX[uxn_c_l31_c2_4eee] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_4eee_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_4eee_cond;
     rom_address_MUX_uxn_c_l31_c2_4eee_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iftrue;
     rom_address_MUX_uxn_c_l31_c2_4eee_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_4eee_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_4eee_return_output := rom_address_MUX_uxn_c_l31_c2_4eee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_a070] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output;

     -- ram_address_MUX[uxn_c_l31_c2_4eee] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_4eee_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_4eee_cond;
     ram_address_MUX_uxn_c_l31_c2_4eee_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iftrue;
     ram_address_MUX_uxn_c_l31_c2_4eee_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_4eee_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_4eee_return_output := ram_address_MUX_uxn_c_l31_c2_4eee_return_output;

     -- read_rom_byte[uxn_c_l32_c14_d910] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_d910_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_d910_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_d910_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_d910_return_output := read_rom_byte_uxn_c_l32_c14_d910_return_output;

     -- printf_uxn_c_l33_c3_cbdd[uxn_c_l33_c3_cbdd] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0 <= VAR_printf_uxn_c_l33_c3_cbdd_uxn_c_l33_c3_cbdd_arg0;
     -- Outputs

     -- is_finished_MUX[uxn_c_l36_c7_adf3] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_adf3_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_adf3_cond;
     is_finished_MUX_uxn_c_l36_c7_adf3_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iftrue;
     is_finished_MUX_uxn_c_l36_c7_adf3_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_adf3_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_adf3_return_output := is_finished_MUX_uxn_c_l36_c7_adf3_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_a070_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_adf3_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_4eee_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_d910_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_4eee_return_output;
     -- is_finished_MUX[uxn_c_l31_c2_4eee] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_4eee_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_4eee_cond;
     is_finished_MUX_uxn_c_l31_c2_4eee_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iftrue;
     is_finished_MUX_uxn_c_l31_c2_4eee_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_4eee_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_4eee_return_output := is_finished_MUX_uxn_c_l31_c2_4eee_return_output;

     -- read_rom_byte[uxn_c_l37_c14_d510] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_d510_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_d510_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_d510_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_d510_return_output := read_rom_byte_uxn_c_l37_c14_d510_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_4eee_return_output;
     VAR_rom_byte_uxn_c_l37_c3_6b10 := VAR_read_rom_byte_uxn_c_l37_c14_d510_return_output;
     VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_6b10, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue := VAR_rom_byte_uxn_c_l37_c3_6b10;
     -- rom_byte_MUX[uxn_c_l36_c7_adf3] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_adf3_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_cond;
     rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_return_output := rom_byte_MUX_uxn_c_l36_c7_adf3_return_output;

     -- printf_uxn_c_l38_c3_eaec[uxn_c_l38_c3_eaec] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0 <= VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg0;
     printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1 <= VAR_printf_uxn_c_l38_c3_eaec_uxn_c_l38_c3_eaec_arg1;
     -- Outputs

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_adf3_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_4eee] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_4eee_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_cond;
     rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_return_output := rom_byte_MUX_uxn_c_l31_c2_4eee_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_afdd] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_afdd_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_4eee_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_4eee_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_4eee_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_afdd_return_output;
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
