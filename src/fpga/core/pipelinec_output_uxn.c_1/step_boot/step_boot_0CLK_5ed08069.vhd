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
-- Submodules: 20
entity step_boot_0CLK_5ed08069 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out boot_step_result_t);
end step_boot_0CLK_5ed08069;
architecture arch of step_boot_0CLK_5ed08069 is
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
-- BIN_OP_EQ[uxn_c_l32_c6_95b4]
signal BIN_OP_EQ_uxn_c_l32_c6_95b4_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c6_95b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l32_c1_d4e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_07e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l32_c2_7246]
signal rom_byte_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l32_c2_7246_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l32_c2_7246]
signal is_finished_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l32_c2_7246_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l32_c2_7246]
signal ram_address_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l32_c2_7246_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l32_c2_7246]
signal rom_address_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l32_c2_7246_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l33_c14_3aed]
signal read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l33_c14_3aed_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l33_c14_3aed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_2feb]
signal BIN_OP_EQ_uxn_c_l36_c11_2feb_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_2feb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_7aec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_07e0]
signal rom_byte_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(7 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_07e0]
signal is_finished_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_07e0]
signal ram_address_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_07e0]
signal rom_address_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l37_c14_dd6d]
signal read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_dd6d_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_dd6d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l38_c3_13c1]
signal BIN_OP_PLUS_uxn_c_l38_c3_13c1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_13c1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_3f30]
signal BIN_OP_PLUS_uxn_c_l39_c3_3f30_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_3f30_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l40_c17_2a83]
signal BIN_OP_GT_uxn_c_l40_c17_2a83_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l40_c17_2a83_right : unsigned(9 downto 0);
signal BIN_OP_GT_uxn_c_l40_c17_2a83_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l44_c2_0f32]
signal BIN_OP_PLUS_uxn_c_l44_c2_0f32_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l44_c2_0f32_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l32_c6_95b4
BIN_OP_EQ_uxn_c_l32_c6_95b4 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c6_95b4_left,
BIN_OP_EQ_uxn_c_l32_c6_95b4_right,
BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8
TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output);

-- rom_byte_MUX_uxn_c_l32_c2_7246
rom_byte_MUX_uxn_c_l32_c2_7246 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l32_c2_7246_cond,
rom_byte_MUX_uxn_c_l32_c2_7246_iftrue,
rom_byte_MUX_uxn_c_l32_c2_7246_iffalse,
rom_byte_MUX_uxn_c_l32_c2_7246_return_output);

-- is_finished_MUX_uxn_c_l32_c2_7246
is_finished_MUX_uxn_c_l32_c2_7246 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l32_c2_7246_cond,
is_finished_MUX_uxn_c_l32_c2_7246_iftrue,
is_finished_MUX_uxn_c_l32_c2_7246_iffalse,
is_finished_MUX_uxn_c_l32_c2_7246_return_output);

-- ram_address_MUX_uxn_c_l32_c2_7246
ram_address_MUX_uxn_c_l32_c2_7246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l32_c2_7246_cond,
ram_address_MUX_uxn_c_l32_c2_7246_iftrue,
ram_address_MUX_uxn_c_l32_c2_7246_iffalse,
ram_address_MUX_uxn_c_l32_c2_7246_return_output);

-- rom_address_MUX_uxn_c_l32_c2_7246
rom_address_MUX_uxn_c_l32_c2_7246 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l32_c2_7246_cond,
rom_address_MUX_uxn_c_l32_c2_7246_iftrue,
rom_address_MUX_uxn_c_l32_c2_7246_iffalse,
rom_address_MUX_uxn_c_l32_c2_7246_return_output);

-- read_rom_byte_uxn_c_l33_c14_3aed
read_rom_byte_uxn_c_l33_c14_3aed : entity work.read_rom_byte_0CLK_23f04728 port map (
clk,
read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE,
read_rom_byte_uxn_c_l33_c14_3aed_read_address,
read_rom_byte_uxn_c_l33_c14_3aed_return_output);

-- BIN_OP_EQ_uxn_c_l36_c11_2feb
BIN_OP_EQ_uxn_c_l36_c11_2feb : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_2feb_left,
BIN_OP_EQ_uxn_c_l36_c11_2feb_right,
BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_07e0
rom_byte_MUX_uxn_c_l36_c7_07e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_07e0_cond,
rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue,
rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse,
rom_byte_MUX_uxn_c_l36_c7_07e0_return_output);

-- is_finished_MUX_uxn_c_l36_c7_07e0
is_finished_MUX_uxn_c_l36_c7_07e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_07e0_cond,
is_finished_MUX_uxn_c_l36_c7_07e0_iftrue,
is_finished_MUX_uxn_c_l36_c7_07e0_iffalse,
is_finished_MUX_uxn_c_l36_c7_07e0_return_output);

-- ram_address_MUX_uxn_c_l36_c7_07e0
ram_address_MUX_uxn_c_l36_c7_07e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_07e0_cond,
ram_address_MUX_uxn_c_l36_c7_07e0_iftrue,
ram_address_MUX_uxn_c_l36_c7_07e0_iffalse,
ram_address_MUX_uxn_c_l36_c7_07e0_return_output);

-- rom_address_MUX_uxn_c_l36_c7_07e0
rom_address_MUX_uxn_c_l36_c7_07e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_07e0_cond,
rom_address_MUX_uxn_c_l36_c7_07e0_iftrue,
rom_address_MUX_uxn_c_l36_c7_07e0_iffalse,
rom_address_MUX_uxn_c_l36_c7_07e0_return_output);

-- read_rom_byte_uxn_c_l37_c14_dd6d
read_rom_byte_uxn_c_l37_c14_dd6d : entity work.read_rom_byte_0CLK_23f04728 port map (
clk,
read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_dd6d_read_address,
read_rom_byte_uxn_c_l37_c14_dd6d_return_output);

-- BIN_OP_PLUS_uxn_c_l38_c3_13c1
BIN_OP_PLUS_uxn_c_l38_c3_13c1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l38_c3_13c1_left,
BIN_OP_PLUS_uxn_c_l38_c3_13c1_right,
BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output);

-- BIN_OP_PLUS_uxn_c_l39_c3_3f30
BIN_OP_PLUS_uxn_c_l39_c3_3f30 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_3f30_left,
BIN_OP_PLUS_uxn_c_l39_c3_3f30_right,
BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output);

-- BIN_OP_GT_uxn_c_l40_c17_2a83
BIN_OP_GT_uxn_c_l40_c17_2a83 : entity work.BIN_OP_GT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l40_c17_2a83_left,
BIN_OP_GT_uxn_c_l40_c17_2a83_right,
BIN_OP_GT_uxn_c_l40_c17_2a83_return_output);

-- BIN_OP_PLUS_uxn_c_l44_c2_0f32
BIN_OP_PLUS_uxn_c_l44_c2_0f32 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l44_c2_0f32_left,
BIN_OP_PLUS_uxn_c_l44_c2_0f32_right,
BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output);



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
 BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output,
 rom_byte_MUX_uxn_c_l32_c2_7246_return_output,
 is_finished_MUX_uxn_c_l32_c2_7246_return_output,
 ram_address_MUX_uxn_c_l32_c2_7246_return_output,
 rom_address_MUX_uxn_c_l32_c2_7246_return_output,
 read_rom_byte_uxn_c_l33_c14_3aed_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output,
 rom_byte_MUX_uxn_c_l36_c7_07e0_return_output,
 is_finished_MUX_uxn_c_l36_c7_07e0_return_output,
 ram_address_MUX_uxn_c_l36_c7_07e0_return_output,
 rom_address_MUX_uxn_c_l36_c7_07e0_return_output,
 read_rom_byte_uxn_c_l37_c14_dd6d_return_output,
 BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output,
 BIN_OP_GT_uxn_c_l40_c17_2a83_return_output,
 BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l32_c2_7246_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l32_c2_7246_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l32_c2_7246_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l32_c2_7246_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l32_c2_7246_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_07e0_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l32_c2_7246_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l32_c2_7246_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l33_c14_3aed_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l33_c14_3aed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l39_c3_a8a8 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l38_c3_f3f6 : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_07e0_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dd6d_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dd6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l44_c2_3cfd : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l46_c9_a875_return_output : boot_step_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_right := resize(to_unsigned(511, 9), 10);
     VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_right := to_unsigned(0, 1);
     VAR_is_finished_MUX_uxn_c_l32_c2_7246_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l32_c2_7246_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_left := rom_address;
     VAR_read_rom_byte_uxn_c_l33_c14_3aed_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_dd6d_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l32_c2_7246_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l44_c2_0f32] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l44_c2_0f32_left <= VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_left;
     BIN_OP_PLUS_uxn_c_l44_c2_0f32_right <= VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output := BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c6_95b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c6_95b4_left <= VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_left;
     BIN_OP_EQ_uxn_c_l32_c6_95b4_right <= VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output := BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;

     -- BIN_OP_PLUS[uxn_c_l39_c3_3f30] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_3f30_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_left;
     BIN_OP_PLUS_uxn_c_l39_c3_3f30_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output := BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output;

     -- BIN_OP_EQ[uxn_c_l36_c11_2feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_2feb_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_left;
     BIN_OP_EQ_uxn_c_l36_c11_2feb_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output := BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;

     -- BIN_OP_PLUS[uxn_c_l38_c3_13c1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l38_c3_13c1_left <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_left;
     BIN_OP_PLUS_uxn_c_l38_c3_13c1_right <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output := BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_is_finished_MUX_uxn_c_l32_c2_7246_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_ram_address_MUX_uxn_c_l32_c2_7246_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_rom_address_MUX_uxn_c_l32_c2_7246_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_rom_byte_MUX_uxn_c_l32_c2_7246_cond := VAR_BIN_OP_EQ_uxn_c_l32_c6_95b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_07e0_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_07e0_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_07e0_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_2feb_return_output;
     VAR_rom_address_uxn_c_l38_c3_f3f6 := resize(VAR_BIN_OP_PLUS_uxn_c_l38_c3_13c1_return_output, 16);
     VAR_ram_address_uxn_c_l39_c3_a8a8 := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_3f30_return_output, 16);
     VAR_boot_phase_uxn_c_l44_c2_3cfd := resize(VAR_BIN_OP_PLUS_uxn_c_l44_c2_0f32_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l44_c2_3cfd;
     VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iftrue := VAR_ram_address_uxn_c_l39_c3_a8a8;
     VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_left := VAR_rom_address_uxn_c_l38_c3_f3f6;
     VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iftrue := VAR_rom_address_uxn_c_l38_c3_f3f6;
     -- ram_address_MUX[uxn_c_l36_c7_07e0] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_07e0_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_07e0_cond;
     ram_address_MUX_uxn_c_l36_c7_07e0_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iftrue;
     ram_address_MUX_uxn_c_l36_c7_07e0_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_07e0_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_07e0_return_output := ram_address_MUX_uxn_c_l36_c7_07e0_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_07e0] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_07e0_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_07e0_cond;
     rom_address_MUX_uxn_c_l36_c7_07e0_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iftrue;
     rom_address_MUX_uxn_c_l36_c7_07e0_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_07e0_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_07e0_return_output := rom_address_MUX_uxn_c_l36_c7_07e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l32_c1_d4e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_07e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output;

     -- BIN_OP_GT[uxn_c_l40_c17_2a83] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l40_c17_2a83_left <= VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_left;
     BIN_OP_GT_uxn_c_l40_c17_2a83_right <= VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_return_output := BIN_OP_GT_uxn_c_l40_c17_2a83_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iftrue := VAR_BIN_OP_GT_uxn_c_l40_c17_2a83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_07e0_return_output;
     VAR_read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l32_c1_d4e8_return_output;
     VAR_ram_address_MUX_uxn_c_l32_c2_7246_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_07e0_return_output;
     VAR_rom_address_MUX_uxn_c_l32_c2_7246_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_07e0_return_output;
     -- read_rom_byte[uxn_c_l33_c14_3aed] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l33_c14_3aed_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l33_c14_3aed_read_address <= VAR_read_rom_byte_uxn_c_l33_c14_3aed_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l33_c14_3aed_return_output := read_rom_byte_uxn_c_l33_c14_3aed_return_output;

     -- is_finished_MUX[uxn_c_l36_c7_07e0] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_07e0_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_07e0_cond;
     is_finished_MUX_uxn_c_l36_c7_07e0_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iftrue;
     is_finished_MUX_uxn_c_l36_c7_07e0_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_07e0_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_07e0_return_output := is_finished_MUX_uxn_c_l36_c7_07e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_7aec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output;

     -- rom_address_MUX[uxn_c_l32_c2_7246] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l32_c2_7246_cond <= VAR_rom_address_MUX_uxn_c_l32_c2_7246_cond;
     rom_address_MUX_uxn_c_l32_c2_7246_iftrue <= VAR_rom_address_MUX_uxn_c_l32_c2_7246_iftrue;
     rom_address_MUX_uxn_c_l32_c2_7246_iffalse <= VAR_rom_address_MUX_uxn_c_l32_c2_7246_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l32_c2_7246_return_output := rom_address_MUX_uxn_c_l32_c2_7246_return_output;

     -- ram_address_MUX[uxn_c_l32_c2_7246] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l32_c2_7246_cond <= VAR_ram_address_MUX_uxn_c_l32_c2_7246_cond;
     ram_address_MUX_uxn_c_l32_c2_7246_iftrue <= VAR_ram_address_MUX_uxn_c_l32_c2_7246_iftrue;
     ram_address_MUX_uxn_c_l32_c2_7246_iffalse <= VAR_ram_address_MUX_uxn_c_l32_c2_7246_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l32_c2_7246_return_output := ram_address_MUX_uxn_c_l32_c2_7246_return_output;

     -- Submodule level 3
     VAR_read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_7aec_return_output;
     VAR_is_finished_MUX_uxn_c_l32_c2_7246_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_07e0_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l32_c2_7246_return_output;
     VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iftrue := VAR_read_rom_byte_uxn_c_l33_c14_3aed_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l32_c2_7246_return_output;
     -- is_finished_MUX[uxn_c_l32_c2_7246] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l32_c2_7246_cond <= VAR_is_finished_MUX_uxn_c_l32_c2_7246_cond;
     is_finished_MUX_uxn_c_l32_c2_7246_iftrue <= VAR_is_finished_MUX_uxn_c_l32_c2_7246_iftrue;
     is_finished_MUX_uxn_c_l32_c2_7246_iffalse <= VAR_is_finished_MUX_uxn_c_l32_c2_7246_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l32_c2_7246_return_output := is_finished_MUX_uxn_c_l32_c2_7246_return_output;

     -- read_rom_byte[uxn_c_l37_c14_dd6d] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_dd6d_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_dd6d_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_dd6d_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_dd6d_return_output := read_rom_byte_uxn_c_l37_c14_dd6d_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l32_c2_7246_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue := VAR_read_rom_byte_uxn_c_l37_c14_dd6d_return_output;
     -- rom_byte_MUX[uxn_c_l36_c7_07e0] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_07e0_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_cond;
     rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_return_output := rom_byte_MUX_uxn_c_l36_c7_07e0_return_output;

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_07e0_return_output;
     -- rom_byte_MUX[uxn_c_l32_c2_7246] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l32_c2_7246_cond <= VAR_rom_byte_MUX_uxn_c_l32_c2_7246_cond;
     rom_byte_MUX_uxn_c_l32_c2_7246_iftrue <= VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iftrue;
     rom_byte_MUX_uxn_c_l32_c2_7246_iffalse <= VAR_rom_byte_MUX_uxn_c_l32_c2_7246_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l32_c2_7246_return_output := rom_byte_MUX_uxn_c_l32_c2_7246_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l32_c2_7246_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l46_c9_a875] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l46_c9_a875_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l32_c2_7246_return_output,
     VAR_rom_byte_MUX_uxn_c_l32_c2_7246_return_output,
     VAR_ram_address_MUX_uxn_c_l32_c2_7246_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l46_c9_a875_return_output;
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
