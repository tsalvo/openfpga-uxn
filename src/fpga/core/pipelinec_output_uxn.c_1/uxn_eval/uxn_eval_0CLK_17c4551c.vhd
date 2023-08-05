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
-- Submodules: 37
entity uxn_eval_0CLK_17c4551c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_17c4551c;
architecture arch of uxn_eval_0CLK_17c4551c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal palette_color_values : uint12_t_4 := (
0 => to_unsigned(0, 12),
1 => to_unsigned(1092, 12),
2 => to_unsigned(2184, 12),
3 => to_unsigned(3276, 12),
others => to_unsigned(0, 12))
;
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal current_pixel_palette_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(16 downto 0) := to_unsigned(0, 17);
signal counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal s : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pc_nonzero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal system_state_zero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal should_eval : unsigned(0 downto 0) := to_unsigned(0, 1);
signal error : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_pixel : unsigned(0 downto 0) := to_unsigned(0, 1);
signal k : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal system_state : unsigned(7 downto 0) := to_unsigned(0, 8);
signal pc : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(16 downto 0);
signal REG_COMB_counter : unsigned(31 downto 0);
signal REG_COMB_s : unsigned(0 downto 0);
signal REG_COMB_pc_nonzero : unsigned(0 downto 0);
signal REG_COMB_system_state_zero : unsigned(0 downto 0);
signal REG_COMB_should_eval : unsigned(0 downto 0);
signal REG_COMB_error : unsigned(0 downto 0);
signal REG_COMB_is_pixel : unsigned(0 downto 0);
signal REG_COMB_k : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_system_state : unsigned(7 downto 0);
signal REG_COMB_pc : unsigned(15 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_c_l31_c7_5ae8]
signal pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l31_c7_5ae8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c15_843e]
signal BIN_OP_EQ_uxn_c_l32_c15_843e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c15_843e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c15_843e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c15_bea8]
signal MUX_uxn_c_l32_c15_bea8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c15_bea8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c15_bea8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c15_bea8_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_c_l33_c17_9ea1]
signal device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_c_l33_c17_9ea1_address : unsigned(7 downto 0);
signal device_ram_read_uxn_c_l33_c17_9ea1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l34_c22_f575]
signal BIN_OP_EQ_uxn_c_l34_c22_f575_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l34_c22_f575_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l34_c22_f575_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l34_c22_2eee]
signal MUX_uxn_c_l34_c22_2eee_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l34_c22_2eee_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l34_c22_2eee_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l34_c22_2eee_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l35_c16_ee06]
signal BIN_OP_AND_uxn_c_l35_c16_ee06_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l35_c16_ee06_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l35_c16_ee06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l37_c1_9189]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l37_c2_c1a4]
signal ins_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);

-- opc_MUX[uxn_c_l37_c2_c1a4]
signal opc_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);

-- k_MUX[uxn_c_l37_c2_c1a4]
signal k_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l37_c2_c1a4]
signal error_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(0 downto 0);

-- s_MUX[uxn_c_l37_c2_c1a4]
signal s_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(0 downto 0);

-- main_ram_read[uxn_c_l38_c9_e9d7]
signal main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_c_l38_c9_e9d7_address : unsigned(15 downto 0);
signal main_ram_read_uxn_c_l38_c9_e9d7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l38_c9_c862]
signal BIN_OP_AND_uxn_c_l38_c9_c862_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c9_c862_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c9_c862_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l39_c3_bbc0]
signal pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l39_c3_bbc0_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l40_c7_55c2]
signal BIN_OP_AND_uxn_c_l40_c7_55c2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_55c2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_55c2_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c7_c1a7]
signal MUX_uxn_c_l40_c7_c1a7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_c1a7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c7_c1a7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c7_c1a7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l41_c7_152f]
signal BIN_OP_AND_uxn_c_l41_c7_152f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c7_152f_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l41_c7_152f_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l41_c7_6bda]
signal MUX_uxn_c_l41_c7_6bda_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l41_c7_6bda_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l41_c7_6bda_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l41_c7_6bda_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l42_c11_e18a]
signal BIN_OP_AND_uxn_c_l42_c11_e18a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l42_c11_e18a_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l42_c11_e18a_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l42_c11_3b6f]
signal UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l42_c31_f0e3]
signal CONST_SR_5_uxn_c_l42_c31_f0e3_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l42_c31_f0e3_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l42_c26_4b9e]
signal BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l42_c26_62e4]
signal BIN_OP_AND_uxn_c_l42_c26_62e4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l42_c26_62e4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l42_c26_62e4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l42_c51_a1e1]
signal BIN_OP_AND_uxn_c_l42_c51_a1e1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l42_c51_a1e1_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l42_c11_f7c2]
signal MUX_uxn_c_l42_c11_f7c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l42_c11_f7c2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l42_c11_f7c2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l42_c11_f7c2_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l43_c11_bb30]
signal eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l43_c11_bb30_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l43_c11_bb30_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l43_c11_bb30_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l43_c11_bb30_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l43_c11_bb30_return_output : unsigned(0 downto 0);

-- pixel_palette_color[uxn_c_l46_c32_474f]
signal pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE : unsigned(0 downto 0);
signal pixel_palette_color_uxn_c_l46_c32_474f_pixel_index : unsigned(16 downto 0);
signal pixel_palette_color_uxn_c_l46_c32_474f_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l47_c22_9405]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l50_c6_428f]
signal BIN_OP_EQ_uxn_c_l50_c6_428f_left : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l50_c6_428f_right : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l50_c6_428f_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l50_c2_4eb3]
signal pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue : unsigned(16 downto 0);
signal pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse : unsigned(16 downto 0);
signal pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l53_c3_2b40]
signal BIN_OP_PLUS_uxn_c_l53_c3_2b40_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_c_l53_c3_2b40_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_c_l57_c6_5bbf]
signal BIN_OP_EQ_uxn_c_l57_c6_5bbf_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_5bbf_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output : unsigned(0 downto 0);

-- counter_MUX[uxn_c_l57_c2_7235]
signal counter_MUX_uxn_c_l57_c2_7235_cond : unsigned(0 downto 0);
signal counter_MUX_uxn_c_l57_c2_7235_iftrue : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l57_c2_7235_iffalse : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l57_c2_7235_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l60_c3_90c7]
signal BIN_OP_PLUS_uxn_c_l60_c3_90c7_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l60_c3_90c7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output : unsigned(32 downto 0);

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_c_l31_c7_5ae8
pc_get_uxn_c_l31_c7_5ae8 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE,
pc_get_uxn_c_l31_c7_5ae8_return_output);

-- BIN_OP_EQ_uxn_c_l32_c15_843e
BIN_OP_EQ_uxn_c_l32_c15_843e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c15_843e_left,
BIN_OP_EQ_uxn_c_l32_c15_843e_right,
BIN_OP_EQ_uxn_c_l32_c15_843e_return_output);

-- MUX_uxn_c_l32_c15_bea8
MUX_uxn_c_l32_c15_bea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c15_bea8_cond,
MUX_uxn_c_l32_c15_bea8_iftrue,
MUX_uxn_c_l32_c15_bea8_iffalse,
MUX_uxn_c_l32_c15_bea8_return_output);

-- device_ram_read_uxn_c_l33_c17_9ea1
device_ram_read_uxn_c_l33_c17_9ea1 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE,
device_ram_read_uxn_c_l33_c17_9ea1_address,
device_ram_read_uxn_c_l33_c17_9ea1_return_output);

-- BIN_OP_EQ_uxn_c_l34_c22_f575
BIN_OP_EQ_uxn_c_l34_c22_f575 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l34_c22_f575_left,
BIN_OP_EQ_uxn_c_l34_c22_f575_right,
BIN_OP_EQ_uxn_c_l34_c22_f575_return_output);

-- MUX_uxn_c_l34_c22_2eee
MUX_uxn_c_l34_c22_2eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l34_c22_2eee_cond,
MUX_uxn_c_l34_c22_2eee_iftrue,
MUX_uxn_c_l34_c22_2eee_iffalse,
MUX_uxn_c_l34_c22_2eee_return_output);

-- BIN_OP_AND_uxn_c_l35_c16_ee06
BIN_OP_AND_uxn_c_l35_c16_ee06 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l35_c16_ee06_left,
BIN_OP_AND_uxn_c_l35_c16_ee06_right,
BIN_OP_AND_uxn_c_l35_c16_ee06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189
TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output);

-- ins_MUX_uxn_c_l37_c2_c1a4
ins_MUX_uxn_c_l37_c2_c1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l37_c2_c1a4_cond,
ins_MUX_uxn_c_l37_c2_c1a4_iftrue,
ins_MUX_uxn_c_l37_c2_c1a4_iffalse,
ins_MUX_uxn_c_l37_c2_c1a4_return_output);

-- opc_MUX_uxn_c_l37_c2_c1a4
opc_MUX_uxn_c_l37_c2_c1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l37_c2_c1a4_cond,
opc_MUX_uxn_c_l37_c2_c1a4_iftrue,
opc_MUX_uxn_c_l37_c2_c1a4_iffalse,
opc_MUX_uxn_c_l37_c2_c1a4_return_output);

-- k_MUX_uxn_c_l37_c2_c1a4
k_MUX_uxn_c_l37_c2_c1a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l37_c2_c1a4_cond,
k_MUX_uxn_c_l37_c2_c1a4_iftrue,
k_MUX_uxn_c_l37_c2_c1a4_iffalse,
k_MUX_uxn_c_l37_c2_c1a4_return_output);

-- error_MUX_uxn_c_l37_c2_c1a4
error_MUX_uxn_c_l37_c2_c1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l37_c2_c1a4_cond,
error_MUX_uxn_c_l37_c2_c1a4_iftrue,
error_MUX_uxn_c_l37_c2_c1a4_iffalse,
error_MUX_uxn_c_l37_c2_c1a4_return_output);

-- s_MUX_uxn_c_l37_c2_c1a4
s_MUX_uxn_c_l37_c2_c1a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l37_c2_c1a4_cond,
s_MUX_uxn_c_l37_c2_c1a4_iftrue,
s_MUX_uxn_c_l37_c2_c1a4_iffalse,
s_MUX_uxn_c_l37_c2_c1a4_return_output);

-- main_ram_read_uxn_c_l38_c9_e9d7
main_ram_read_uxn_c_l38_c9_e9d7 : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE,
main_ram_read_uxn_c_l38_c9_e9d7_address,
main_ram_read_uxn_c_l38_c9_e9d7_return_output);

-- BIN_OP_AND_uxn_c_l38_c9_c862
BIN_OP_AND_uxn_c_l38_c9_c862 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c9_c862_left,
BIN_OP_AND_uxn_c_l38_c9_c862_right,
BIN_OP_AND_uxn_c_l38_c9_c862_return_output);

-- pc_add_uxn_c_l39_c3_bbc0
pc_add_uxn_c_l39_c3_bbc0 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE,
pc_add_uxn_c_l39_c3_bbc0_adjustment);

-- BIN_OP_AND_uxn_c_l40_c7_55c2
BIN_OP_AND_uxn_c_l40_c7_55c2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c7_55c2_left,
BIN_OP_AND_uxn_c_l40_c7_55c2_right,
BIN_OP_AND_uxn_c_l40_c7_55c2_return_output);

-- MUX_uxn_c_l40_c7_c1a7
MUX_uxn_c_l40_c7_c1a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c7_c1a7_cond,
MUX_uxn_c_l40_c7_c1a7_iftrue,
MUX_uxn_c_l40_c7_c1a7_iffalse,
MUX_uxn_c_l40_c7_c1a7_return_output);

-- BIN_OP_AND_uxn_c_l41_c7_152f
BIN_OP_AND_uxn_c_l41_c7_152f : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c7_152f_left,
BIN_OP_AND_uxn_c_l41_c7_152f_right,
BIN_OP_AND_uxn_c_l41_c7_152f_return_output);

-- MUX_uxn_c_l41_c7_6bda
MUX_uxn_c_l41_c7_6bda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l41_c7_6bda_cond,
MUX_uxn_c_l41_c7_6bda_iftrue,
MUX_uxn_c_l41_c7_6bda_iffalse,
MUX_uxn_c_l41_c7_6bda_return_output);

-- BIN_OP_AND_uxn_c_l42_c11_e18a
BIN_OP_AND_uxn_c_l42_c11_e18a : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l42_c11_e18a_left,
BIN_OP_AND_uxn_c_l42_c11_e18a_right,
BIN_OP_AND_uxn_c_l42_c11_e18a_return_output);

-- UNARY_OP_NOT_uxn_c_l42_c11_3b6f
UNARY_OP_NOT_uxn_c_l42_c11_3b6f : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr,
UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output);

-- CONST_SR_5_uxn_c_l42_c31_f0e3
CONST_SR_5_uxn_c_l42_c31_f0e3 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l42_c31_f0e3_x,
CONST_SR_5_uxn_c_l42_c31_f0e3_return_output);

-- BIN_OP_MINUS_uxn_c_l42_c26_4b9e
BIN_OP_MINUS_uxn_c_l42_c26_4b9e : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left,
BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right,
BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output);

-- BIN_OP_AND_uxn_c_l42_c26_62e4
BIN_OP_AND_uxn_c_l42_c26_62e4 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l42_c26_62e4_left,
BIN_OP_AND_uxn_c_l42_c26_62e4_right,
BIN_OP_AND_uxn_c_l42_c26_62e4_return_output);

-- BIN_OP_AND_uxn_c_l42_c51_a1e1
BIN_OP_AND_uxn_c_l42_c51_a1e1 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l42_c51_a1e1_left,
BIN_OP_AND_uxn_c_l42_c51_a1e1_right,
BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output);

-- MUX_uxn_c_l42_c11_f7c2
MUX_uxn_c_l42_c11_f7c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l42_c11_f7c2_cond,
MUX_uxn_c_l42_c11_f7c2_iftrue,
MUX_uxn_c_l42_c11_f7c2_iffalse,
MUX_uxn_c_l42_c11_f7c2_return_output);

-- eval_opcode_uxn_c_l43_c11_bb30
eval_opcode_uxn_c_l43_c11_bb30 : entity work.eval_opcode_0CLK_44dad49a port map (
clk,
eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE,
eval_opcode_uxn_c_l43_c11_bb30_stack_index,
eval_opcode_uxn_c_l43_c11_bb30_opcode,
eval_opcode_uxn_c_l43_c11_bb30_ins,
eval_opcode_uxn_c_l43_c11_bb30_k,
eval_opcode_uxn_c_l43_c11_bb30_return_output);

-- pixel_palette_color_uxn_c_l46_c32_474f
pixel_palette_color_uxn_c_l46_c32_474f : entity work.pixel_palette_color_0CLK_4f6a1b8d port map (
clk,
pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE,
pixel_palette_color_uxn_c_l46_c32_474f_pixel_index,
pixel_palette_color_uxn_c_l46_c32_474f_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output);

-- BIN_OP_EQ_uxn_c_l50_c6_428f
BIN_OP_EQ_uxn_c_l50_c6_428f : entity work.BIN_OP_EQ_uint17_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l50_c6_428f_left,
BIN_OP_EQ_uxn_c_l50_c6_428f_right,
BIN_OP_EQ_uxn_c_l50_c6_428f_return_output);

-- pixel_counter_MUX_uxn_c_l50_c2_4eb3
pixel_counter_MUX_uxn_c_l50_c2_4eb3 : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond,
pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue,
pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse,
pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output);

-- BIN_OP_PLUS_uxn_c_l53_c3_2b40
BIN_OP_PLUS_uxn_c_l53_c3_2b40 : entity work.BIN_OP_PLUS_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l53_c3_2b40_left,
BIN_OP_PLUS_uxn_c_l53_c3_2b40_right,
BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output);

-- BIN_OP_EQ_uxn_c_l57_c6_5bbf
BIN_OP_EQ_uxn_c_l57_c6_5bbf : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l57_c6_5bbf_left,
BIN_OP_EQ_uxn_c_l57_c6_5bbf_right,
BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output);

-- counter_MUX_uxn_c_l57_c2_7235
counter_MUX_uxn_c_l57_c2_7235 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
counter_MUX_uxn_c_l57_c2_7235_cond,
counter_MUX_uxn_c_l57_c2_7235_iftrue,
counter_MUX_uxn_c_l57_c2_7235_iffalse,
counter_MUX_uxn_c_l57_c2_7235_return_output);

-- BIN_OP_PLUS_uxn_c_l60_c3_90c7
BIN_OP_PLUS_uxn_c_l60_c3_90c7 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l60_c3_90c7_left,
BIN_OP_PLUS_uxn_c_l60_c3_90c7_right,
BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 palette_color_values,
 result,
 current_pixel_palette_color,
 pixel_counter,
 counter,
 s,
 pc_nonzero,
 system_state_zero,
 should_eval,
 error,
 is_pixel,
 k,
 opc,
 ins,
 system_state,
 pc,
 -- All submodule outputs
 pc_get_uxn_c_l31_c7_5ae8_return_output,
 BIN_OP_EQ_uxn_c_l32_c15_843e_return_output,
 MUX_uxn_c_l32_c15_bea8_return_output,
 device_ram_read_uxn_c_l33_c17_9ea1_return_output,
 BIN_OP_EQ_uxn_c_l34_c22_f575_return_output,
 MUX_uxn_c_l34_c22_2eee_return_output,
 BIN_OP_AND_uxn_c_l35_c16_ee06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output,
 ins_MUX_uxn_c_l37_c2_c1a4_return_output,
 opc_MUX_uxn_c_l37_c2_c1a4_return_output,
 k_MUX_uxn_c_l37_c2_c1a4_return_output,
 error_MUX_uxn_c_l37_c2_c1a4_return_output,
 s_MUX_uxn_c_l37_c2_c1a4_return_output,
 main_ram_read_uxn_c_l38_c9_e9d7_return_output,
 BIN_OP_AND_uxn_c_l38_c9_c862_return_output,
 BIN_OP_AND_uxn_c_l40_c7_55c2_return_output,
 MUX_uxn_c_l40_c7_c1a7_return_output,
 BIN_OP_AND_uxn_c_l41_c7_152f_return_output,
 MUX_uxn_c_l41_c7_6bda_return_output,
 BIN_OP_AND_uxn_c_l42_c11_e18a_return_output,
 UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output,
 CONST_SR_5_uxn_c_l42_c31_f0e3_return_output,
 BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output,
 BIN_OP_AND_uxn_c_l42_c26_62e4_return_output,
 BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output,
 MUX_uxn_c_l42_c11_f7c2_return_output,
 eval_opcode_uxn_c_l43_c11_bb30_return_output,
 pixel_palette_color_uxn_c_l46_c32_474f_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output,
 BIN_OP_EQ_uxn_c_l50_c6_428f_return_output,
 pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output,
 BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output,
 BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output,
 counter_MUX_uxn_c_l57_c2_7235_return_output,
 BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l31_c7_5ae8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l32_c15_bea8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c15_bea8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c15_bea8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c15_bea8_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l33_c17_9ea1_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l33_c17_9ea1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l34_c22_2eee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l34_c22_2eee_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l34_c22_2eee_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l34_c22_2eee_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l37_c2_c1a4_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l37_c2_c1a4_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l37_c2_c1a4_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l37_c2_c1a4_cond : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l38_c9_e9d7_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c9_c862_left : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l38_c9_e9d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c9_c862_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l39_c3_bbc0_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_c1a7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_c1a7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_c1a7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_c1a7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c7_6bda_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c7_6bda_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c7_6bda_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c7_152f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c7_152f_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c7_152f_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c7_6bda_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l42_c11_f7c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l42_c11_f7c2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l42_c11_f7c2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l42_c11_f7c2_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l43_c11_bb30_return_output : unsigned(0 downto 0);
 variable VAR_pixel_palette_color_uxn_c_l46_c32_474f_pixel_index : unsigned(16 downto 0);
 variable VAR_pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pixel_palette_color_uxn_c_l46_c32_474f_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l47_c11_5ee1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue : unsigned(16 downto 0);
 variable VAR_pixel_counter_uxn_c_l51_c3_1850 : unsigned(16 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse : unsigned(16 downto 0);
 variable VAR_pixel_counter_uxn_c_l53_c3_f380 : unsigned(16 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output : unsigned(16 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_uxn_c_l57_c2_7235_iftrue : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l58_c3_bf23 : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l57_c2_7235_iffalse : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l60_c3_a7eb : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l57_c2_7235_return_output : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l57_c2_7235_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(16 downto 0);
variable REG_VAR_counter : unsigned(31 downto 0);
variable REG_VAR_s : unsigned(0 downto 0);
variable REG_VAR_pc_nonzero : unsigned(0 downto 0);
variable REG_VAR_system_state_zero : unsigned(0 downto 0);
variable REG_VAR_should_eval : unsigned(0 downto 0);
variable REG_VAR_error : unsigned(0 downto 0);
variable REG_VAR_is_pixel : unsigned(0 downto 0);
variable REG_VAR_k : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_system_state : unsigned(7 downto 0);
variable REG_VAR_pc : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_result := result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_counter := counter;
  REG_VAR_s := s;
  REG_VAR_pc_nonzero := pc_nonzero;
  REG_VAR_system_state_zero := system_state_zero;
  REG_VAR_should_eval := should_eval;
  REG_VAR_error := error;
  REG_VAR_is_pixel := is_pixel;
  REG_VAR_k := k;
  REG_VAR_opc := opc;
  REG_VAR_ins := ins;
  REG_VAR_system_state := system_state;
  REG_VAR_pc := pc;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_right := to_unsigned(76799, 17);
     VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l41_c7_6bda_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l32_c15_bea8_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_right := to_unsigned(63, 6);
     VAR_MUX_uxn_c_l40_c7_c1a7_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_right := to_unsigned(31, 5);
     VAR_pixel_counter_uxn_c_l51_c3_1850 := resize(to_unsigned(0, 1), 17);
     VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue := VAR_pixel_counter_uxn_c_l51_c3_1850;
     VAR_MUX_uxn_c_l41_c7_6bda_iftrue := to_unsigned(1, 1);
     VAR_device_ram_read_uxn_c_l33_c17_9ea1_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l38_c9_c862_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l34_c22_2eee_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l34_c22_2eee_iftrue := to_unsigned(1, 1);
     VAR_counter_uxn_c_l58_c3_bf23 := resize(to_unsigned(0, 1), 32);
     VAR_counter_MUX_uxn_c_l57_c2_7235_iftrue := VAR_counter_uxn_c_l58_c3_bf23;
     VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_right := to_unsigned(128, 8);
     VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_right := to_unsigned(1, 1);
     VAR_error_MUX_uxn_c_l37_c2_c1a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l41_c7_152f_right := to_unsigned(64, 7);
     VAR_pc_add_uxn_c_l39_c3_bbc0_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l32_c15_bea8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l40_c7_c1a7_iffalse := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_left := counter;
     VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_left := counter;
     VAR_ins_MUX_uxn_c_l37_c2_c1a4_iffalse := ins;
     REG_VAR_is_pixel := is_pixel;
     VAR_k_MUX_uxn_c_l37_c2_c1a4_iffalse := k;
     VAR_opc_MUX_uxn_c_l37_c2_c1a4_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_left := pixel_counter;
     VAR_pixel_palette_color_uxn_c_l46_c32_474f_pixel_index := pixel_counter;
     VAR_s_MUX_uxn_c_l37_c2_c1a4_iffalse := s;
     -- BIN_OP_PLUS[uxn_c_l53_c3_2b40] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l53_c3_2b40_left <= VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_left;
     BIN_OP_PLUS_uxn_c_l53_c3_2b40_right <= VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output := BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output;

     -- pc_get[uxn_c_l31_c7_5ae8] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l31_c7_5ae8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l31_c7_5ae8_return_output := pc_get_uxn_c_l31_c7_5ae8_return_output;

     -- BIN_OP_EQ[uxn_c_l50_c6_428f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l50_c6_428f_left <= VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_left;
     BIN_OP_EQ_uxn_c_l50_c6_428f_right <= VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_return_output := BIN_OP_EQ_uxn_c_l50_c6_428f_return_output;

     -- BIN_OP_PLUS[uxn_c_l60_c3_90c7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l60_c3_90c7_left <= VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_left;
     BIN_OP_PLUS_uxn_c_l60_c3_90c7_right <= VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output := BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output;

     -- BIN_OP_EQ[uxn_c_l57_c6_5bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l57_c6_5bbf_left <= VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_left;
     BIN_OP_EQ_uxn_c_l57_c6_5bbf_right <= VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output := BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output;

     -- device_ram_read[uxn_c_l33_c17_9ea1] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE <= VAR_device_ram_read_uxn_c_l33_c17_9ea1_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_c_l33_c17_9ea1_address <= VAR_device_ram_read_uxn_c_l33_c17_9ea1_address;
     -- Outputs
     VAR_device_ram_read_uxn_c_l33_c17_9ea1_return_output := device_ram_read_uxn_c_l33_c17_9ea1_return_output;

     -- pixel_palette_color[uxn_c_l46_c32_474f] LATENCY=0
     -- Clock enable
     pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE <= VAR_pixel_palette_color_uxn_c_l46_c32_474f_CLOCK_ENABLE;
     -- Inputs
     pixel_palette_color_uxn_c_l46_c32_474f_pixel_index <= VAR_pixel_palette_color_uxn_c_l46_c32_474f_pixel_index;
     -- Outputs
     VAR_pixel_palette_color_uxn_c_l46_c32_474f_return_output := pixel_palette_color_uxn_c_l46_c32_474f_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_c_l50_c6_428f_return_output;
     VAR_counter_MUX_uxn_c_l57_c2_7235_cond := VAR_BIN_OP_EQ_uxn_c_l57_c6_5bbf_return_output;
     VAR_pixel_counter_uxn_c_l53_c3_f380 := resize(VAR_BIN_OP_PLUS_uxn_c_l53_c3_2b40_return_output, 17);
     VAR_counter_uxn_c_l60_c3_a7eb := resize(VAR_BIN_OP_PLUS_uxn_c_l60_c3_90c7_return_output, 32);
     VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_left := VAR_device_ram_read_uxn_c_l33_c17_9ea1_return_output;
     REG_VAR_system_state := VAR_device_ram_read_uxn_c_l33_c17_9ea1_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_left := VAR_pc_get_uxn_c_l31_c7_5ae8_return_output;
     VAR_main_ram_read_uxn_c_l38_c9_e9d7_address := VAR_pc_get_uxn_c_l31_c7_5ae8_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l31_c7_5ae8_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0 := VAR_pixel_palette_color_uxn_c_l46_c32_474f_return_output;
     REG_VAR_current_pixel_palette_color := VAR_pixel_palette_color_uxn_c_l46_c32_474f_return_output;
     VAR_counter_MUX_uxn_c_l57_c2_7235_iffalse := VAR_counter_uxn_c_l60_c3_a7eb;
     VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse := VAR_pixel_counter_uxn_c_l53_c3_f380;
     -- counter_MUX[uxn_c_l57_c2_7235] LATENCY=0
     -- Inputs
     counter_MUX_uxn_c_l57_c2_7235_cond <= VAR_counter_MUX_uxn_c_l57_c2_7235_cond;
     counter_MUX_uxn_c_l57_c2_7235_iftrue <= VAR_counter_MUX_uxn_c_l57_c2_7235_iftrue;
     counter_MUX_uxn_c_l57_c2_7235_iffalse <= VAR_counter_MUX_uxn_c_l57_c2_7235_iffalse;
     -- Outputs
     VAR_counter_MUX_uxn_c_l57_c2_7235_return_output := counter_MUX_uxn_c_l57_c2_7235_return_output;

     -- BIN_OP_EQ[uxn_c_l34_c22_f575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l34_c22_f575_left <= VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_left;
     BIN_OP_EQ_uxn_c_l34_c22_f575_right <= VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_return_output := BIN_OP_EQ_uxn_c_l34_c22_f575_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c15_843e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c15_843e_left <= VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_left;
     BIN_OP_EQ_uxn_c_l32_c15_843e_right <= VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_return_output := BIN_OP_EQ_uxn_c_l32_c15_843e_return_output;

     -- pixel_counter_MUX[uxn_c_l50_c2_4eb3] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond <= VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_cond;
     pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue <= VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iftrue;
     pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse <= VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output := pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l47_c22_9405] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l32_c15_bea8_cond := VAR_BIN_OP_EQ_uxn_c_l32_c15_843e_return_output;
     VAR_MUX_uxn_c_l34_c22_2eee_cond := VAR_BIN_OP_EQ_uxn_c_l34_c22_f575_return_output;
     REG_VAR_counter := VAR_counter_MUX_uxn_c_l57_c2_7235_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l50_c2_4eb3_return_output;
     -- CAST_TO_uint16_t[uxn_c_l47_c11_5ee1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l47_c11_5ee1_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l47_c22_9405_return_output);

     -- MUX[uxn_c_l32_c15_bea8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c15_bea8_cond <= VAR_MUX_uxn_c_l32_c15_bea8_cond;
     MUX_uxn_c_l32_c15_bea8_iftrue <= VAR_MUX_uxn_c_l32_c15_bea8_iftrue;
     MUX_uxn_c_l32_c15_bea8_iffalse <= VAR_MUX_uxn_c_l32_c15_bea8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c15_bea8_return_output := MUX_uxn_c_l32_c15_bea8_return_output;

     -- MUX[uxn_c_l34_c22_2eee] LATENCY=0
     -- Inputs
     MUX_uxn_c_l34_c22_2eee_cond <= VAR_MUX_uxn_c_l34_c22_2eee_cond;
     MUX_uxn_c_l34_c22_2eee_iftrue <= VAR_MUX_uxn_c_l34_c22_2eee_iftrue;
     MUX_uxn_c_l34_c22_2eee_iffalse <= VAR_MUX_uxn_c_l34_c22_2eee_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l34_c22_2eee_return_output := MUX_uxn_c_l34_c22_2eee_return_output;

     -- Submodule level 3
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l47_c11_5ee1_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l47_c11_5ee1_return_output;
     VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_left := VAR_MUX_uxn_c_l32_c15_bea8_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l32_c15_bea8_return_output;
     VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_right := VAR_MUX_uxn_c_l34_c22_2eee_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l34_c22_2eee_return_output;
     -- BIN_OP_AND[uxn_c_l35_c16_ee06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l35_c16_ee06_left <= VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_left;
     BIN_OP_AND_uxn_c_l35_c16_ee06_right <= VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output := BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     VAR_error_MUX_uxn_c_l37_c2_c1a4_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     VAR_ins_MUX_uxn_c_l37_c2_c1a4_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     VAR_k_MUX_uxn_c_l37_c2_c1a4_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     VAR_opc_MUX_uxn_c_l37_c2_c1a4_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     VAR_s_MUX_uxn_c_l37_c2_c1a4_cond := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l35_c16_ee06_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l37_c1_9189] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output;
     VAR_main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output;
     VAR_pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l37_c1_9189_return_output;
     -- main_ram_read[uxn_c_l38_c9_e9d7] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE <= VAR_main_ram_read_uxn_c_l38_c9_e9d7_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_c_l38_c9_e9d7_address <= VAR_main_ram_read_uxn_c_l38_c9_e9d7_address;
     -- Outputs
     VAR_main_ram_read_uxn_c_l38_c9_e9d7_return_output := main_ram_read_uxn_c_l38_c9_e9d7_return_output;

     -- pc_add[uxn_c_l39_c3_bbc0] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l39_c3_bbc0_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l39_c3_bbc0_adjustment <= VAR_pc_add_uxn_c_l39_c3_bbc0_adjustment;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l38_c9_c862_left := VAR_main_ram_read_uxn_c_l38_c9_e9d7_return_output;
     -- BIN_OP_AND[uxn_c_l38_c9_c862] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c9_c862_left <= VAR_BIN_OP_AND_uxn_c_l38_c9_c862_left;
     BIN_OP_AND_uxn_c_l38_c9_c862_right <= VAR_BIN_OP_AND_uxn_c_l38_c9_c862_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output := BIN_OP_AND_uxn_c_l38_c9_c862_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_left := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_BIN_OP_AND_uxn_c_l41_c7_152f_left := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_left := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_left := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_x := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_eval_opcode_uxn_c_l43_c11_bb30_ins := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     VAR_ins_MUX_uxn_c_l37_c2_c1a4_iftrue := VAR_BIN_OP_AND_uxn_c_l38_c9_c862_return_output;
     -- BIN_OP_AND[uxn_c_l40_c7_55c2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c7_55c2_left <= VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_left;
     BIN_OP_AND_uxn_c_l40_c7_55c2_right <= VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_return_output := BIN_OP_AND_uxn_c_l40_c7_55c2_return_output;

     -- ins_MUX[uxn_c_l37_c2_c1a4] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l37_c2_c1a4_cond <= VAR_ins_MUX_uxn_c_l37_c2_c1a4_cond;
     ins_MUX_uxn_c_l37_c2_c1a4_iftrue <= VAR_ins_MUX_uxn_c_l37_c2_c1a4_iftrue;
     ins_MUX_uxn_c_l37_c2_c1a4_iffalse <= VAR_ins_MUX_uxn_c_l37_c2_c1a4_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l37_c2_c1a4_return_output := ins_MUX_uxn_c_l37_c2_c1a4_return_output;

     -- BIN_OP_AND[uxn_c_l42_c51_a1e1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l42_c51_a1e1_left <= VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_left;
     BIN_OP_AND_uxn_c_l42_c51_a1e1_right <= VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output := BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output;

     -- BIN_OP_AND[uxn_c_l41_c7_152f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c7_152f_left <= VAR_BIN_OP_AND_uxn_c_l41_c7_152f_left;
     BIN_OP_AND_uxn_c_l41_c7_152f_right <= VAR_BIN_OP_AND_uxn_c_l41_c7_152f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c7_152f_return_output := BIN_OP_AND_uxn_c_l41_c7_152f_return_output;

     -- BIN_OP_AND[uxn_c_l42_c11_e18a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l42_c11_e18a_left <= VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_left;
     BIN_OP_AND_uxn_c_l42_c11_e18a_right <= VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_return_output := BIN_OP_AND_uxn_c_l42_c11_e18a_return_output;

     -- CONST_SR_5[uxn_c_l42_c31_f0e3] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l42_c31_f0e3_x <= VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_return_output := CONST_SR_5_uxn_c_l42_c31_f0e3_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l40_c7_c1a7_cond := resize(VAR_BIN_OP_AND_uxn_c_l40_c7_55c2_return_output, 1);
     VAR_MUX_uxn_c_l41_c7_6bda_cond := resize(VAR_BIN_OP_AND_uxn_c_l41_c7_152f_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr := VAR_BIN_OP_AND_uxn_c_l42_c11_e18a_return_output;
     VAR_MUX_uxn_c_l42_c11_f7c2_iffalse := VAR_BIN_OP_AND_uxn_c_l42_c51_a1e1_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right := VAR_CONST_SR_5_uxn_c_l42_c31_f0e3_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l37_c2_c1a4_return_output;
     -- UNARY_OP_NOT[uxn_c_l42_c11_3b6f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr <= VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output := UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output;

     -- MUX[uxn_c_l41_c7_6bda] LATENCY=0
     -- Inputs
     MUX_uxn_c_l41_c7_6bda_cond <= VAR_MUX_uxn_c_l41_c7_6bda_cond;
     MUX_uxn_c_l41_c7_6bda_iftrue <= VAR_MUX_uxn_c_l41_c7_6bda_iftrue;
     MUX_uxn_c_l41_c7_6bda_iffalse <= VAR_MUX_uxn_c_l41_c7_6bda_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l41_c7_6bda_return_output := MUX_uxn_c_l41_c7_6bda_return_output;

     -- BIN_OP_MINUS[uxn_c_l42_c26_4b9e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left <= VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_left;
     BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right <= VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output := BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output;

     -- MUX[uxn_c_l40_c7_c1a7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c7_c1a7_cond <= VAR_MUX_uxn_c_l40_c7_c1a7_cond;
     MUX_uxn_c_l40_c7_c1a7_iftrue <= VAR_MUX_uxn_c_l40_c7_c1a7_iftrue;
     MUX_uxn_c_l40_c7_c1a7_iffalse <= VAR_MUX_uxn_c_l40_c7_c1a7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c7_c1a7_return_output := MUX_uxn_c_l40_c7_c1a7_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_left := VAR_BIN_OP_MINUS_uxn_c_l42_c26_4b9e_return_output;
     VAR_eval_opcode_uxn_c_l43_c11_bb30_k := VAR_MUX_uxn_c_l40_c7_c1a7_return_output;
     VAR_k_MUX_uxn_c_l37_c2_c1a4_iftrue := VAR_MUX_uxn_c_l40_c7_c1a7_return_output;
     VAR_eval_opcode_uxn_c_l43_c11_bb30_stack_index := VAR_MUX_uxn_c_l41_c7_6bda_return_output;
     VAR_s_MUX_uxn_c_l37_c2_c1a4_iftrue := VAR_MUX_uxn_c_l41_c7_6bda_return_output;
     VAR_MUX_uxn_c_l42_c11_f7c2_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l42_c11_3b6f_return_output, 1);
     -- BIN_OP_AND[uxn_c_l42_c26_62e4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l42_c26_62e4_left <= VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_left;
     BIN_OP_AND_uxn_c_l42_c26_62e4_right <= VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_return_output := BIN_OP_AND_uxn_c_l42_c26_62e4_return_output;

     -- s_MUX[uxn_c_l37_c2_c1a4] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l37_c2_c1a4_cond <= VAR_s_MUX_uxn_c_l37_c2_c1a4_cond;
     s_MUX_uxn_c_l37_c2_c1a4_iftrue <= VAR_s_MUX_uxn_c_l37_c2_c1a4_iftrue;
     s_MUX_uxn_c_l37_c2_c1a4_iffalse <= VAR_s_MUX_uxn_c_l37_c2_c1a4_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l37_c2_c1a4_return_output := s_MUX_uxn_c_l37_c2_c1a4_return_output;

     -- k_MUX[uxn_c_l37_c2_c1a4] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l37_c2_c1a4_cond <= VAR_k_MUX_uxn_c_l37_c2_c1a4_cond;
     k_MUX_uxn_c_l37_c2_c1a4_iftrue <= VAR_k_MUX_uxn_c_l37_c2_c1a4_iftrue;
     k_MUX_uxn_c_l37_c2_c1a4_iffalse <= VAR_k_MUX_uxn_c_l37_c2_c1a4_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l37_c2_c1a4_return_output := k_MUX_uxn_c_l37_c2_c1a4_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l42_c11_f7c2_iftrue := VAR_BIN_OP_AND_uxn_c_l42_c26_62e4_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l37_c2_c1a4_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l37_c2_c1a4_return_output;
     -- MUX[uxn_c_l42_c11_f7c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l42_c11_f7c2_cond <= VAR_MUX_uxn_c_l42_c11_f7c2_cond;
     MUX_uxn_c_l42_c11_f7c2_iftrue <= VAR_MUX_uxn_c_l42_c11_f7c2_iftrue;
     MUX_uxn_c_l42_c11_f7c2_iffalse <= VAR_MUX_uxn_c_l42_c11_f7c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l42_c11_f7c2_return_output := MUX_uxn_c_l42_c11_f7c2_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l43_c11_bb30_opcode := VAR_MUX_uxn_c_l42_c11_f7c2_return_output;
     VAR_opc_MUX_uxn_c_l37_c2_c1a4_iftrue := VAR_MUX_uxn_c_l42_c11_f7c2_return_output;
     -- opc_MUX[uxn_c_l37_c2_c1a4] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l37_c2_c1a4_cond <= VAR_opc_MUX_uxn_c_l37_c2_c1a4_cond;
     opc_MUX_uxn_c_l37_c2_c1a4_iftrue <= VAR_opc_MUX_uxn_c_l37_c2_c1a4_iftrue;
     opc_MUX_uxn_c_l37_c2_c1a4_iffalse <= VAR_opc_MUX_uxn_c_l37_c2_c1a4_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l37_c2_c1a4_return_output := opc_MUX_uxn_c_l37_c2_c1a4_return_output;

     -- eval_opcode[uxn_c_l43_c11_bb30] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l43_c11_bb30_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l43_c11_bb30_stack_index <= VAR_eval_opcode_uxn_c_l43_c11_bb30_stack_index;
     eval_opcode_uxn_c_l43_c11_bb30_opcode <= VAR_eval_opcode_uxn_c_l43_c11_bb30_opcode;
     eval_opcode_uxn_c_l43_c11_bb30_ins <= VAR_eval_opcode_uxn_c_l43_c11_bb30_ins;
     eval_opcode_uxn_c_l43_c11_bb30_k <= VAR_eval_opcode_uxn_c_l43_c11_bb30_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l43_c11_bb30_return_output := eval_opcode_uxn_c_l43_c11_bb30_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l37_c2_c1a4_iftrue := VAR_eval_opcode_uxn_c_l43_c11_bb30_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l37_c2_c1a4_return_output;
     -- error_MUX[uxn_c_l37_c2_c1a4] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l37_c2_c1a4_cond <= VAR_error_MUX_uxn_c_l37_c2_c1a4_cond;
     error_MUX_uxn_c_l37_c2_c1a4_iftrue <= VAR_error_MUX_uxn_c_l37_c2_c1a4_iftrue;
     error_MUX_uxn_c_l37_c2_c1a4_iffalse <= VAR_error_MUX_uxn_c_l37_c2_c1a4_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l37_c2_c1a4_return_output := error_MUX_uxn_c_l37_c2_c1a4_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l37_c2_c1a4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_result <= REG_VAR_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_counter <= REG_VAR_counter;
REG_COMB_s <= REG_VAR_s;
REG_COMB_pc_nonzero <= REG_VAR_pc_nonzero;
REG_COMB_system_state_zero <= REG_VAR_system_state_zero;
REG_COMB_should_eval <= REG_VAR_should_eval;
REG_COMB_error <= REG_VAR_error;
REG_COMB_is_pixel <= REG_VAR_is_pixel;
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
     result <= REG_COMB_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
     pixel_counter <= REG_COMB_pixel_counter;
     counter <= REG_COMB_counter;
     s <= REG_COMB_s;
     pc_nonzero <= REG_COMB_pc_nonzero;
     system_state_zero <= REG_COMB_system_state_zero;
     should_eval <= REG_COMB_should_eval;
     error <= REG_COMB_error;
     is_pixel <= REG_COMB_is_pixel;
     k <= REG_COMB_k;
     opc <= REG_COMB_opc;
     ins <= REG_COMB_ins;
     system_state <= REG_COMB_system_state;
     pc <= REG_COMB_pc;
 end if;
 end if;
end process;

end arch;
