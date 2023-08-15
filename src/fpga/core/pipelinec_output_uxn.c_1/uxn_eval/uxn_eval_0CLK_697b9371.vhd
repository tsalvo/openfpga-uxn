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
-- Submodules: 40
entity uxn_eval_0CLK_697b9371 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_697b9371;
architecture arch of uxn_eval_0CLK_697b9371 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal palette_color_values : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal clock_cycle_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal seconds_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal current_pixel_palette_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal s : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pc_nonzero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal system_state_zero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal should_eval : unsigned(0 downto 0) := to_unsigned(0, 1);
signal error : unsigned(0 downto 0) := to_unsigned(0, 1);
signal k : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal system_state : unsigned(7 downto 0) := to_unsigned(0, 8);
signal pc : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_pixel_counter : unsigned(31 downto 0);
signal REG_COMB_clock_cycle_counter : unsigned(31 downto 0);
signal REG_COMB_seconds_counter : unsigned(31 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
signal REG_COMB_s : unsigned(0 downto 0);
signal REG_COMB_pc_nonzero : unsigned(0 downto 0);
signal REG_COMB_system_state_zero : unsigned(0 downto 0);
signal REG_COMB_should_eval : unsigned(0 downto 0);
signal REG_COMB_error : unsigned(0 downto 0);
signal REG_COMB_k : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_system_state : unsigned(7 downto 0);
signal REG_COMB_pc : unsigned(15 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_c_l29_c7_5e57]
signal pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_5e57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_3ed1]
signal BIN_OP_EQ_uxn_c_l30_c15_3ed1_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_3ed1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_1dbb]
signal MUX_uxn_c_l30_c15_1dbb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_1dbb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_1dbb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_1dbb_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_c_l31_c17_a440]
signal device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_c_l31_c17_a440_address : unsigned(7 downto 0);
signal device_ram_read_uxn_c_l31_c17_a440_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_7603]
signal BIN_OP_EQ_uxn_c_l32_c22_7603_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7603_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7603_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_af9b]
signal MUX_uxn_c_l32_c22_af9b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_af9b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_af9b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_af9b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_4c82]
signal BIN_OP_AND_uxn_c_l33_c16_4c82_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_4c82_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_4c82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_775a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_3ebe]
signal ins_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_3ebe]
signal s_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l35_c2_3ebe]
signal opc_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l35_c2_3ebe]
signal error_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(0 downto 0);

-- k_MUX[uxn_c_l35_c2_3ebe]
signal k_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_c_l36_c9_76f0]
signal peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l36_c9_76f0_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l36_c9_76f0_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_4de8]
signal BIN_OP_AND_uxn_c_l36_c9_4de8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_4de8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_4de8_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_1c38]
signal pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_1c38_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_8852]
signal BIN_OP_AND_uxn_c_l38_c7_8852_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_8852_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_8852_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_ff77]
signal MUX_uxn_c_l38_c7_ff77_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_ff77_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_ff77_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_ff77_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_422c]
signal BIN_OP_AND_uxn_c_l39_c7_422c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_422c_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_422c_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_d3da]
signal MUX_uxn_c_l39_c7_d3da_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_d3da_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_d3da_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_d3da_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_8815]
signal BIN_OP_AND_uxn_c_l40_c11_8815_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_8815_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_8815_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_d0c3]
signal UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_1065]
signal CONST_SR_5_uxn_c_l40_c31_1065_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_1065_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_0e21]
signal BIN_OP_MINUS_uxn_c_l40_c26_0e21_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_0e21_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_1d06]
signal BIN_OP_AND_uxn_c_l40_c26_1d06_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_1d06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_1d06_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_b49e]
signal BIN_OP_AND_uxn_c_l40_c51_b49e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_b49e_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_b49e_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_4a10]
signal MUX_uxn_c_l40_c11_4a10_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_4a10_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_4a10_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_4a10_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_a68d]
signal eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_a68d_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_a68d_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_a68d_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_a68d_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_a68d_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_dfef]
signal screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_dfef_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_dfef_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_dfef_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_dfef_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_512c]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_32c6]
signal BIN_OP_EQ_uxn_c_l53_c6_32c6_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_32c6_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_ba03]
signal pixel_counter_MUX_uxn_c_l53_c2_ba03_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_3d93]
signal BIN_OP_PLUS_uxn_c_l56_c3_3d93_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_3d93_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_afb3]
signal BIN_OP_EQ_uxn_c_l60_c6_afb3_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_afb3_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output : unsigned(0 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_5982]
signal seconds_counter_MUX_uxn_c_l60_c2_5982_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_5982_return_output : unsigned(31 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_5982]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_52e8]
signal BIN_OP_PLUS_uxn_c_l61_c3_52e8_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_52e8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_80ce]
signal BIN_OP_PLUS_uxn_c_l64_c3_80ce_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_80ce_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_c_l29_c7_5e57
pc_get_uxn_c_l29_c7_5e57 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_5e57_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_3ed1
BIN_OP_EQ_uxn_c_l30_c15_3ed1 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_3ed1_left,
BIN_OP_EQ_uxn_c_l30_c15_3ed1_right,
BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output);

-- MUX_uxn_c_l30_c15_1dbb
MUX_uxn_c_l30_c15_1dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_1dbb_cond,
MUX_uxn_c_l30_c15_1dbb_iftrue,
MUX_uxn_c_l30_c15_1dbb_iffalse,
MUX_uxn_c_l30_c15_1dbb_return_output);

-- device_ram_read_uxn_c_l31_c17_a440
device_ram_read_uxn_c_l31_c17_a440 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE,
device_ram_read_uxn_c_l31_c17_a440_address,
device_ram_read_uxn_c_l31_c17_a440_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_7603
BIN_OP_EQ_uxn_c_l32_c22_7603 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_7603_left,
BIN_OP_EQ_uxn_c_l32_c22_7603_right,
BIN_OP_EQ_uxn_c_l32_c22_7603_return_output);

-- MUX_uxn_c_l32_c22_af9b
MUX_uxn_c_l32_c22_af9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_af9b_cond,
MUX_uxn_c_l32_c22_af9b_iftrue,
MUX_uxn_c_l32_c22_af9b_iffalse,
MUX_uxn_c_l32_c22_af9b_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_4c82
BIN_OP_AND_uxn_c_l33_c16_4c82 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_4c82_left,
BIN_OP_AND_uxn_c_l33_c16_4c82_right,
BIN_OP_AND_uxn_c_l33_c16_4c82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output);

-- ins_MUX_uxn_c_l35_c2_3ebe
ins_MUX_uxn_c_l35_c2_3ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_3ebe_cond,
ins_MUX_uxn_c_l35_c2_3ebe_iftrue,
ins_MUX_uxn_c_l35_c2_3ebe_iffalse,
ins_MUX_uxn_c_l35_c2_3ebe_return_output);

-- s_MUX_uxn_c_l35_c2_3ebe
s_MUX_uxn_c_l35_c2_3ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_3ebe_cond,
s_MUX_uxn_c_l35_c2_3ebe_iftrue,
s_MUX_uxn_c_l35_c2_3ebe_iffalse,
s_MUX_uxn_c_l35_c2_3ebe_return_output);

-- opc_MUX_uxn_c_l35_c2_3ebe
opc_MUX_uxn_c_l35_c2_3ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_3ebe_cond,
opc_MUX_uxn_c_l35_c2_3ebe_iftrue,
opc_MUX_uxn_c_l35_c2_3ebe_iffalse,
opc_MUX_uxn_c_l35_c2_3ebe_return_output);

-- error_MUX_uxn_c_l35_c2_3ebe
error_MUX_uxn_c_l35_c2_3ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_3ebe_cond,
error_MUX_uxn_c_l35_c2_3ebe_iftrue,
error_MUX_uxn_c_l35_c2_3ebe_iffalse,
error_MUX_uxn_c_l35_c2_3ebe_return_output);

-- k_MUX_uxn_c_l35_c2_3ebe
k_MUX_uxn_c_l35_c2_3ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_3ebe_cond,
k_MUX_uxn_c_l35_c2_3ebe_iftrue,
k_MUX_uxn_c_l35_c2_3ebe_iffalse,
k_MUX_uxn_c_l35_c2_3ebe_return_output);

-- peek_ram_uxn_c_l36_c9_76f0
peek_ram_uxn_c_l36_c9_76f0 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE,
peek_ram_uxn_c_l36_c9_76f0_address,
peek_ram_uxn_c_l36_c9_76f0_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_4de8
BIN_OP_AND_uxn_c_l36_c9_4de8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_4de8_left,
BIN_OP_AND_uxn_c_l36_c9_4de8_right,
BIN_OP_AND_uxn_c_l36_c9_4de8_return_output);

-- pc_add_uxn_c_l37_c3_1c38
pc_add_uxn_c_l37_c3_1c38 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_1c38_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_8852
BIN_OP_AND_uxn_c_l38_c7_8852 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_8852_left,
BIN_OP_AND_uxn_c_l38_c7_8852_right,
BIN_OP_AND_uxn_c_l38_c7_8852_return_output);

-- MUX_uxn_c_l38_c7_ff77
MUX_uxn_c_l38_c7_ff77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_ff77_cond,
MUX_uxn_c_l38_c7_ff77_iftrue,
MUX_uxn_c_l38_c7_ff77_iffalse,
MUX_uxn_c_l38_c7_ff77_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_422c
BIN_OP_AND_uxn_c_l39_c7_422c : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_422c_left,
BIN_OP_AND_uxn_c_l39_c7_422c_right,
BIN_OP_AND_uxn_c_l39_c7_422c_return_output);

-- MUX_uxn_c_l39_c7_d3da
MUX_uxn_c_l39_c7_d3da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_d3da_cond,
MUX_uxn_c_l39_c7_d3da_iftrue,
MUX_uxn_c_l39_c7_d3da_iffalse,
MUX_uxn_c_l39_c7_d3da_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_8815
BIN_OP_AND_uxn_c_l40_c11_8815 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_8815_left,
BIN_OP_AND_uxn_c_l40_c11_8815_right,
BIN_OP_AND_uxn_c_l40_c11_8815_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_d0c3
UNARY_OP_NOT_uxn_c_l40_c11_d0c3 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr,
UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output);

-- CONST_SR_5_uxn_c_l40_c31_1065
CONST_SR_5_uxn_c_l40_c31_1065 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_1065_x,
CONST_SR_5_uxn_c_l40_c31_1065_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_0e21
BIN_OP_MINUS_uxn_c_l40_c26_0e21 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_0e21_left,
BIN_OP_MINUS_uxn_c_l40_c26_0e21_right,
BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_1d06
BIN_OP_AND_uxn_c_l40_c26_1d06 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_1d06_left,
BIN_OP_AND_uxn_c_l40_c26_1d06_right,
BIN_OP_AND_uxn_c_l40_c26_1d06_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_b49e
BIN_OP_AND_uxn_c_l40_c51_b49e : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_b49e_left,
BIN_OP_AND_uxn_c_l40_c51_b49e_right,
BIN_OP_AND_uxn_c_l40_c51_b49e_return_output);

-- MUX_uxn_c_l40_c11_4a10
MUX_uxn_c_l40_c11_4a10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_4a10_cond,
MUX_uxn_c_l40_c11_4a10_iftrue,
MUX_uxn_c_l40_c11_4a10_iffalse,
MUX_uxn_c_l40_c11_4a10_return_output);

-- eval_opcode_uxn_c_l41_c11_a68d
eval_opcode_uxn_c_l41_c11_a68d : entity work.eval_opcode_0CLK_758df5c5 port map (
clk,
eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_a68d_stack_index,
eval_opcode_uxn_c_l41_c11_a68d_opcode,
eval_opcode_uxn_c_l41_c11_a68d_ins,
eval_opcode_uxn_c_l41_c11_a68d_k,
eval_opcode_uxn_c_l41_c11_a68d_return_output);

-- screen_ram_update_uxn_c_l44_c32_dfef
screen_ram_update_uxn_c_l44_c32_dfef : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_dfef_write_address,
screen_ram_update_uxn_c_l44_c32_dfef_write_value,
screen_ram_update_uxn_c_l44_c32_dfef_read_address,
screen_ram_update_uxn_c_l44_c32_dfef_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_32c6
BIN_OP_EQ_uxn_c_l53_c6_32c6 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_32c6_left,
BIN_OP_EQ_uxn_c_l53_c6_32c6_right,
BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_ba03
pixel_counter_MUX_uxn_c_l53_c2_ba03 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_ba03_cond,
pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_3d93
BIN_OP_PLUS_uxn_c_l56_c3_3d93 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_3d93_left,
BIN_OP_PLUS_uxn_c_l56_c3_3d93_right,
BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_afb3
BIN_OP_EQ_uxn_c_l60_c6_afb3 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_afb3_left,
BIN_OP_EQ_uxn_c_l60_c6_afb3_right,
BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_5982
seconds_counter_MUX_uxn_c_l60_c2_5982 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_5982_cond,
seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_5982_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_5982
clock_cycle_counter_MUX_uxn_c_l60_c2_5982 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_52e8
BIN_OP_PLUS_uxn_c_l61_c3_52e8 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_52e8_left,
BIN_OP_PLUS_uxn_c_l61_c3_52e8_right,
BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_80ce
BIN_OP_PLUS_uxn_c_l64_c3_80ce : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_80ce_left,
BIN_OP_PLUS_uxn_c_l64_c3_80ce_right,
BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 palette_color_values,
 pixel_counter,
 clock_cycle_counter,
 seconds_counter,
 result,
 current_pixel_palette_color,
 s,
 pc_nonzero,
 system_state_zero,
 should_eval,
 error,
 k,
 opc,
 ins,
 system_state,
 pc,
 -- All submodule outputs
 pc_get_uxn_c_l29_c7_5e57_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output,
 MUX_uxn_c_l30_c15_1dbb_return_output,
 device_ram_read_uxn_c_l31_c17_a440_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_7603_return_output,
 MUX_uxn_c_l32_c22_af9b_return_output,
 BIN_OP_AND_uxn_c_l33_c16_4c82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output,
 ins_MUX_uxn_c_l35_c2_3ebe_return_output,
 s_MUX_uxn_c_l35_c2_3ebe_return_output,
 opc_MUX_uxn_c_l35_c2_3ebe_return_output,
 error_MUX_uxn_c_l35_c2_3ebe_return_output,
 k_MUX_uxn_c_l35_c2_3ebe_return_output,
 peek_ram_uxn_c_l36_c9_76f0_return_output,
 BIN_OP_AND_uxn_c_l36_c9_4de8_return_output,
 BIN_OP_AND_uxn_c_l38_c7_8852_return_output,
 MUX_uxn_c_l38_c7_ff77_return_output,
 BIN_OP_AND_uxn_c_l39_c7_422c_return_output,
 MUX_uxn_c_l39_c7_d3da_return_output,
 BIN_OP_AND_uxn_c_l40_c11_8815_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output,
 CONST_SR_5_uxn_c_l40_c31_1065_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output,
 BIN_OP_AND_uxn_c_l40_c26_1d06_return_output,
 BIN_OP_AND_uxn_c_l40_c51_b49e_return_output,
 MUX_uxn_c_l40_c11_4a10_return_output,
 eval_opcode_uxn_c_l41_c11_a68d_return_output,
 screen_ram_update_uxn_c_l44_c32_dfef_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_5982_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_5e57_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_1dbb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_1dbb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_1dbb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_1dbb_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_a440_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_a440_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_af9b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_af9b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_af9b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_af9b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3ebe_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3ebe_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3ebe_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3ebe_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_76f0_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_76f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_1c38_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ff77_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ff77_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ff77_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_8852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_8852_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_8852_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ff77_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_d3da_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_d3da_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_d3da_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_422c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_422c_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_422c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_d3da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_4a10_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_4a10_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_4a10_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8815_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8815_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8815_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_1065_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_1065_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_4a10_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_a68d_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_dfef_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_3139_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_dfef_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_5bea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_8cdf : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_f2b3 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_f5ad : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_cond : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_3444 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_2025 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
variable REG_VAR_clock_cycle_counter : unsigned(31 downto 0);
variable REG_VAR_seconds_counter : unsigned(31 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_s : unsigned(0 downto 0);
variable REG_VAR_pc_nonzero : unsigned(0 downto 0);
variable REG_VAR_system_state_zero : unsigned(0 downto 0);
variable REG_VAR_should_eval : unsigned(0 downto 0);
variable REG_VAR_error : unsigned(0 downto 0);
variable REG_VAR_k : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_system_state : unsigned(7 downto 0);
variable REG_VAR_pc : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_clock_cycle_counter := clock_cycle_counter;
  REG_VAR_seconds_counter := seconds_counter;
  REG_VAR_result := result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
  REG_VAR_s := s;
  REG_VAR_pc_nonzero := pc_nonzero;
  REG_VAR_system_state_zero := system_state_zero;
  REG_VAR_should_eval := should_eval;
  REG_VAR_error := error;
  REG_VAR_k := k;
  REG_VAR_opc := opc;
  REG_VAR_ins := ins;
  REG_VAR_system_state := system_state;
  REG_VAR_pc := pc;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l30_c15_1dbb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c11_8815_right := to_unsigned(31, 5);
     VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l32_c22_af9b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l32_c22_af9b_iftrue := to_unsigned(1, 1);
     VAR_pixel_counter_uxn_c_l54_c3_8cdf := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue := VAR_pixel_counter_uxn_c_l54_c3_8cdf;
     VAR_BIN_OP_AND_uxn_c_l38_c7_8852_right := to_unsigned(128, 8);
     VAR_pc_add_uxn_c_l37_c3_1c38_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_left := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l39_c7_422c_right := to_unsigned(64, 7);
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l39_c7_d3da_iffalse := to_unsigned(0, 1);
     VAR_clock_cycle_counter_uxn_c_l62_c3_3444 := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_3444;
     VAR_device_ram_read_uxn_c_l31_c17_a440_address := resize(to_unsigned(15, 4), 8);
     VAR_MUX_uxn_c_l38_c7_ff77_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l39_c7_d3da_iftrue := to_unsigned(1, 1);
     VAR_error_MUX_uxn_c_l35_c2_3ebe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_right := to_unsigned(204799, 18);
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l30_c15_1dbb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l38_c7_ff77_iftrue := to_unsigned(255, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_3ebe_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_3ebe_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_3ebe_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_dfef_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_3ebe_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse := seconds_counter;
     -- pc_get[uxn_c_l29_c7_5e57] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_5e57_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_5e57_return_output := pc_get_uxn_c_l29_c7_5e57_return_output;

     -- BIN_OP_EQ[uxn_c_l53_c6_32c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_32c6_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_left;
     BIN_OP_EQ_uxn_c_l53_c6_32c6_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output := BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_3139] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_3139_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- BIN_OP_PLUS[uxn_c_l64_c3_80ce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_80ce_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_left;
     BIN_OP_PLUS_uxn_c_l64_c3_80ce_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output := BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output;

     -- BIN_OP_EQ[uxn_c_l60_c6_afb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_afb3_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_left;
     BIN_OP_EQ_uxn_c_l60_c6_afb3_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output := BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output;

     -- BIN_OP_PLUS[uxn_c_l61_c3_52e8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_52e8_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_left;
     BIN_OP_PLUS_uxn_c_l61_c3_52e8_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output := BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output;

     -- device_ram_read[uxn_c_l31_c17_a440] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE <= VAR_device_ram_read_uxn_c_l31_c17_a440_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_c_l31_c17_a440_address <= VAR_device_ram_read_uxn_c_l31_c17_a440_address;
     -- Outputs
     VAR_device_ram_read_uxn_c_l31_c17_a440_return_output := device_ram_read_uxn_c_l31_c17_a440_return_output;

     -- BIN_OP_PLUS[uxn_c_l56_c3_3d93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_3d93_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_left;
     BIN_OP_PLUS_uxn_c_l56_c3_3d93_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output := BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_32c6_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_afb3_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_f2b3 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_3d93_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_f5ad := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_52e8_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_2025 := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_80ce_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_3139_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_left := VAR_device_ram_read_uxn_c_l31_c17_a440_return_output;
     REG_VAR_system_state := VAR_device_ram_read_uxn_c_l31_c17_a440_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_left := VAR_pc_get_uxn_c_l29_c7_5e57_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_5e57_return_output;
     VAR_peek_ram_uxn_c_l36_c9_76f0_address := VAR_pc_get_uxn_c_l29_c7_5e57_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_2025;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse := VAR_pixel_counter_uxn_c_l56_c3_f2b3;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue := VAR_seconds_counter_uxn_c_l61_c3_f5ad;
     -- BIN_OP_EQ[uxn_c_l30_c15_3ed1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_3ed1_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_left;
     BIN_OP_EQ_uxn_c_l30_c15_3ed1_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output := BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output;

     -- screen_ram_update[uxn_c_l44_c32_dfef] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_dfef_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_dfef_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_address;
     screen_ram_update_uxn_c_l44_c32_dfef_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_dfef_write_value;
     screen_ram_update_uxn_c_l44_c32_dfef_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_dfef_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_dfef_return_output := screen_ram_update_uxn_c_l44_c32_dfef_return_output;

     -- pixel_counter_MUX[uxn_c_l53_c2_ba03] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_ba03_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_cond;
     pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output := pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output;

     -- clock_cycle_counter_MUX[uxn_c_l60_c2_5982] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_7603] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_7603_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_left;
     BIN_OP_EQ_uxn_c_l32_c22_7603_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_return_output := BIN_OP_EQ_uxn_c_l32_c22_7603_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_5982] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_5982_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_cond;
     seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_return_output := seconds_counter_MUX_uxn_c_l60_c2_5982_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_1dbb_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_3ed1_return_output;
     VAR_MUX_uxn_c_l32_c22_af9b_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_7603_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_5982_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_ba03_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_dfef_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_dfef_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_5982_return_output;
     -- MUX[uxn_c_l32_c22_af9b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_af9b_cond <= VAR_MUX_uxn_c_l32_c22_af9b_cond;
     MUX_uxn_c_l32_c22_af9b_iftrue <= VAR_MUX_uxn_c_l32_c22_af9b_iftrue;
     MUX_uxn_c_l32_c22_af9b_iffalse <= VAR_MUX_uxn_c_l32_c22_af9b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_af9b_return_output := MUX_uxn_c_l32_c22_af9b_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_512c] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output;

     -- MUX[uxn_c_l30_c15_1dbb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_1dbb_cond <= VAR_MUX_uxn_c_l30_c15_1dbb_cond;
     MUX_uxn_c_l30_c15_1dbb_iftrue <= VAR_MUX_uxn_c_l30_c15_1dbb_iftrue;
     MUX_uxn_c_l30_c15_1dbb_iffalse <= VAR_MUX_uxn_c_l30_c15_1dbb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_1dbb_return_output := MUX_uxn_c_l30_c15_1dbb_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_left := VAR_MUX_uxn_c_l30_c15_1dbb_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_1dbb_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_right := VAR_MUX_uxn_c_l32_c22_af9b_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_af9b_return_output;
     -- CAST_TO_uint16_t[uxn_c_l50_c11_5bea] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_5bea_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_512c_return_output);

     -- BIN_OP_AND[uxn_c_l33_c16_4c82] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_4c82_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_left;
     BIN_OP_AND_uxn_c_l33_c16_4c82_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output := BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     VAR_error_MUX_uxn_c_l35_c2_3ebe_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_3ebe_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     VAR_k_MUX_uxn_c_l35_c2_3ebe_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_3ebe_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     VAR_s_MUX_uxn_c_l35_c2_3ebe_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_4c82_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_5bea_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_5bea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_775a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output;
     VAR_pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output;
     VAR_peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_775a_return_output;
     -- peek_ram[uxn_c_l36_c9_76f0] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l36_c9_76f0_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l36_c9_76f0_address <= VAR_peek_ram_uxn_c_l36_c9_76f0_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l36_c9_76f0_return_output := peek_ram_uxn_c_l36_c9_76f0_return_output;

     -- pc_add[uxn_c_l37_c3_1c38] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_1c38_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_1c38_adjustment <= VAR_pc_add_uxn_c_l37_c3_1c38_adjustment;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_left := VAR_peek_ram_uxn_c_l36_c9_76f0_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_4de8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_4de8_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_left;
     BIN_OP_AND_uxn_c_l36_c9_4de8_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output := BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_8852_left := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_422c_left := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_8815_left := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_left := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_1065_x := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_a68d_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_3ebe_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_4de8_return_output;
     -- ins_MUX[uxn_c_l35_c2_3ebe] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_3ebe_cond <= VAR_ins_MUX_uxn_c_l35_c2_3ebe_cond;
     ins_MUX_uxn_c_l35_c2_3ebe_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_3ebe_iftrue;
     ins_MUX_uxn_c_l35_c2_3ebe_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_3ebe_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_3ebe_return_output := ins_MUX_uxn_c_l35_c2_3ebe_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_b49e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_b49e_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_left;
     BIN_OP_AND_uxn_c_l40_c51_b49e_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_return_output := BIN_OP_AND_uxn_c_l40_c51_b49e_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_1065] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_1065_x <= VAR_CONST_SR_5_uxn_c_l40_c31_1065_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_1065_return_output := CONST_SR_5_uxn_c_l40_c31_1065_return_output;

     -- BIN_OP_AND[uxn_c_l38_c7_8852] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_8852_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_8852_left;
     BIN_OP_AND_uxn_c_l38_c7_8852_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_8852_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_8852_return_output := BIN_OP_AND_uxn_c_l38_c7_8852_return_output;

     -- BIN_OP_AND[uxn_c_l40_c11_8815] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_8815_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_8815_left;
     BIN_OP_AND_uxn_c_l40_c11_8815_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_8815_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_8815_return_output := BIN_OP_AND_uxn_c_l40_c11_8815_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_422c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_422c_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_422c_left;
     BIN_OP_AND_uxn_c_l39_c7_422c_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_422c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_422c_return_output := BIN_OP_AND_uxn_c_l39_c7_422c_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_ff77_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_8852_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_d3da_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_422c_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_8815_return_output;
     VAR_MUX_uxn_c_l40_c11_4a10_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_b49e_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_right := VAR_CONST_SR_5_uxn_c_l40_c31_1065_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_3ebe_return_output;
     -- BIN_OP_MINUS[uxn_c_l40_c26_0e21] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_0e21_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_left;
     BIN_OP_MINUS_uxn_c_l40_c26_0e21_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output := BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output;

     -- MUX[uxn_c_l38_c7_ff77] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_ff77_cond <= VAR_MUX_uxn_c_l38_c7_ff77_cond;
     MUX_uxn_c_l38_c7_ff77_iftrue <= VAR_MUX_uxn_c_l38_c7_ff77_iftrue;
     MUX_uxn_c_l38_c7_ff77_iffalse <= VAR_MUX_uxn_c_l38_c7_ff77_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_ff77_return_output := MUX_uxn_c_l38_c7_ff77_return_output;

     -- UNARY_OP_NOT[uxn_c_l40_c11_d0c3] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output := UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output;

     -- MUX[uxn_c_l39_c7_d3da] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_d3da_cond <= VAR_MUX_uxn_c_l39_c7_d3da_cond;
     MUX_uxn_c_l39_c7_d3da_iftrue <= VAR_MUX_uxn_c_l39_c7_d3da_iftrue;
     MUX_uxn_c_l39_c7_d3da_iffalse <= VAR_MUX_uxn_c_l39_c7_d3da_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_d3da_return_output := MUX_uxn_c_l39_c7_d3da_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_0e21_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_a68d_k := VAR_MUX_uxn_c_l38_c7_ff77_return_output;
     VAR_k_MUX_uxn_c_l35_c2_3ebe_iftrue := VAR_MUX_uxn_c_l38_c7_ff77_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_a68d_stack_index := VAR_MUX_uxn_c_l39_c7_d3da_return_output;
     VAR_s_MUX_uxn_c_l35_c2_3ebe_iftrue := VAR_MUX_uxn_c_l39_c7_d3da_return_output;
     VAR_MUX_uxn_c_l40_c11_4a10_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_d0c3_return_output, 1);
     -- s_MUX[uxn_c_l35_c2_3ebe] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_3ebe_cond <= VAR_s_MUX_uxn_c_l35_c2_3ebe_cond;
     s_MUX_uxn_c_l35_c2_3ebe_iftrue <= VAR_s_MUX_uxn_c_l35_c2_3ebe_iftrue;
     s_MUX_uxn_c_l35_c2_3ebe_iffalse <= VAR_s_MUX_uxn_c_l35_c2_3ebe_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_3ebe_return_output := s_MUX_uxn_c_l35_c2_3ebe_return_output;

     -- k_MUX[uxn_c_l35_c2_3ebe] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_3ebe_cond <= VAR_k_MUX_uxn_c_l35_c2_3ebe_cond;
     k_MUX_uxn_c_l35_c2_3ebe_iftrue <= VAR_k_MUX_uxn_c_l35_c2_3ebe_iftrue;
     k_MUX_uxn_c_l35_c2_3ebe_iffalse <= VAR_k_MUX_uxn_c_l35_c2_3ebe_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_3ebe_return_output := k_MUX_uxn_c_l35_c2_3ebe_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_1d06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_1d06_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_left;
     BIN_OP_AND_uxn_c_l40_c26_1d06_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_return_output := BIN_OP_AND_uxn_c_l40_c26_1d06_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_4a10_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_1d06_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_3ebe_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_3ebe_return_output;
     -- MUX[uxn_c_l40_c11_4a10] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_4a10_cond <= VAR_MUX_uxn_c_l40_c11_4a10_cond;
     MUX_uxn_c_l40_c11_4a10_iftrue <= VAR_MUX_uxn_c_l40_c11_4a10_iftrue;
     MUX_uxn_c_l40_c11_4a10_iffalse <= VAR_MUX_uxn_c_l40_c11_4a10_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_4a10_return_output := MUX_uxn_c_l40_c11_4a10_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_a68d_opcode := VAR_MUX_uxn_c_l40_c11_4a10_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_3ebe_iftrue := VAR_MUX_uxn_c_l40_c11_4a10_return_output;
     -- eval_opcode[uxn_c_l41_c11_a68d] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_a68d_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_a68d_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_a68d_stack_index;
     eval_opcode_uxn_c_l41_c11_a68d_opcode <= VAR_eval_opcode_uxn_c_l41_c11_a68d_opcode;
     eval_opcode_uxn_c_l41_c11_a68d_ins <= VAR_eval_opcode_uxn_c_l41_c11_a68d_ins;
     eval_opcode_uxn_c_l41_c11_a68d_k <= VAR_eval_opcode_uxn_c_l41_c11_a68d_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_a68d_return_output := eval_opcode_uxn_c_l41_c11_a68d_return_output;

     -- opc_MUX[uxn_c_l35_c2_3ebe] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_3ebe_cond <= VAR_opc_MUX_uxn_c_l35_c2_3ebe_cond;
     opc_MUX_uxn_c_l35_c2_3ebe_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_3ebe_iftrue;
     opc_MUX_uxn_c_l35_c2_3ebe_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_3ebe_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_3ebe_return_output := opc_MUX_uxn_c_l35_c2_3ebe_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_3ebe_iftrue := VAR_eval_opcode_uxn_c_l41_c11_a68d_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_3ebe_return_output;
     -- error_MUX[uxn_c_l35_c2_3ebe] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_3ebe_cond <= VAR_error_MUX_uxn_c_l35_c2_3ebe_cond;
     error_MUX_uxn_c_l35_c2_3ebe_iftrue <= VAR_error_MUX_uxn_c_l35_c2_3ebe_iftrue;
     error_MUX_uxn_c_l35_c2_3ebe_iffalse <= VAR_error_MUX_uxn_c_l35_c2_3ebe_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_3ebe_return_output := error_MUX_uxn_c_l35_c2_3ebe_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_3ebe_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_clock_cycle_counter <= REG_VAR_clock_cycle_counter;
REG_COMB_seconds_counter <= REG_VAR_seconds_counter;
REG_COMB_result <= REG_VAR_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
REG_COMB_s <= REG_VAR_s;
REG_COMB_pc_nonzero <= REG_VAR_pc_nonzero;
REG_COMB_system_state_zero <= REG_VAR_system_state_zero;
REG_COMB_should_eval <= REG_VAR_should_eval;
REG_COMB_error <= REG_VAR_error;
REG_COMB_k <= REG_VAR_k;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_system_state <= REG_VAR_system_state;
REG_COMB_pc <= REG_VAR_pc;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     palette_color_values <= REG_COMB_palette_color_values;
     pixel_counter <= REG_COMB_pixel_counter;
     clock_cycle_counter <= REG_COMB_clock_cycle_counter;
     seconds_counter <= REG_COMB_seconds_counter;
     result <= REG_COMB_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
     s <= REG_COMB_s;
     pc_nonzero <= REG_COMB_pc_nonzero;
     system_state_zero <= REG_COMB_system_state_zero;
     should_eval <= REG_COMB_should_eval;
     error <= REG_COMB_error;
     k <= REG_COMB_k;
     opc <= REG_COMB_opc;
     ins <= REG_COMB_ins;
     system_state <= REG_COMB_system_state;
     pc <= REG_COMB_pc;
 end if;
 end if;
end process;

end arch;
