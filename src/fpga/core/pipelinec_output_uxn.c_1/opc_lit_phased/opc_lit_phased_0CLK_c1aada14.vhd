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
-- Submodules: 25
entity opc_lit_phased_0CLK_c1aada14 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit_phased_0CLK_c1aada14;
architecture arch of opc_lit_phased_0CLK_c1aada14 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8b : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8a : unsigned(7 downto 0);
signal REG_COMB_tmp8b : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l100_c6_f125]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l103_c7_5f32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(0 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l100_c2_535c]
signal tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_opcodes_phased_h_l100_c2_535c]
signal tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l100_c2_535c]
signal result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_phased_h_l101_c12_6b30]
signal BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l103_c11_445d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l103_c1_5c43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l109_c7_f89e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(0 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l103_c7_5f32]
signal tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_opcodes_phased_h_l103_c7_5f32]
signal tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l103_c7_5f32]
signal result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l104_c11_550e]
signal peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l105_c11_a5ed]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l106_c10_989c]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output : unsigned(16 downto 0);

-- pc_set[uxn_opcodes_phased_h_l106_c3_48f6]
signal pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value : unsigned(15 downto 0);

-- stack_pointer_set[uxn_opcodes_phased_h_l107_c3_aa24]
signal stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l109_c11_672e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l109_c1_d597]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output : unsigned(0 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l109_c7_f89e]
signal tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l109_c7_f89e]
signal result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_opcodes_phased_h_l110_c11_194a]
signal peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address : unsigned(15 downto 0);
signal peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l111_c3_4ebc]
signal stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l113_c11_8f04]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l113_c7_d888]
signal result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125
BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c
tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output);

-- tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c
tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond,
tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue,
tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse,
tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l100_c2_535c
result_MUX_uxn_opcodes_phased_h_l100_c2_535c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond,
result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue,
result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse,
result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output);

-- BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30
BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left,
BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right,
BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d
BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32
tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output);

-- tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32
tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond,
tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue,
tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse,
tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output);

-- result_MUX_uxn_opcodes_phased_h_l103_c7_5f32
result_MUX_uxn_opcodes_phased_h_l103_c7_5f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond,
result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue,
result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse,
result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output);

-- peek_ram_uxn_opcodes_phased_h_l104_c11_550e
peek_ram_uxn_opcodes_phased_h_l104_c11_550e : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address,
peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed
BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c
BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output);

-- pc_set_uxn_opcodes_phased_h_l106_c3_48f6
pc_set_uxn_opcodes_phased_h_l106_c3_48f6 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value);

-- stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24
stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24 : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE,
stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index,
stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e
BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e
tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l109_c7_f89e
result_MUX_uxn_opcodes_phased_h_l109_c7_f89e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond,
result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue,
result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse,
result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output);

-- peek_ram_uxn_opcodes_phased_h_l110_c11_194a
peek_ram_uxn_opcodes_phased_h_l110_c11_194a : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE,
peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address,
peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc
stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index,
stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address,
stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04
BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output);

-- result_MUX_uxn_opcodes_phased_h_l113_c7_d888
result_MUX_uxn_opcodes_phased_h_l113_c7_d888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond,
result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue,
result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse,
result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 -- Registers
 tmp8a,
 tmp8b,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output,
 tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output,
 result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output,
 BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output,
 tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output,
 result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output,
 peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output,
 result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output,
 peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output,
 result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_uxn_opcodes_phased_h_l105_c3_9612 : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output : unsigned(8 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address : unsigned(15 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8a : unsigned(7 downto 0);
variable REG_VAR_tmp8b : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8a := tmp8a;
  REG_VAR_tmp8b := tmp8b;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right := to_unsigned(254, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left := VAR_pc;
     VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address := VAR_pc;
     VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse := result;
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index := VAR_stack_index;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue := tmp8a;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse := tmp8a;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse := tmp8b;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l100_c6_f125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output;

     -- BIN_OP_GT[uxn_opcodes_phased_h_l101_c12_6b30] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_left;
     BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output := BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l109_c11_672e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l113_c11_8f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l103_c11_445d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l106_c10_989c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l105_c11_a5ed] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l100_c6_f125_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l103_c11_445d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l109_c11_672e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l113_c11_8f04_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue := VAR_BIN_OP_GT_uxn_opcodes_phased_h_l101_c12_6b30_return_output;
     VAR_tmp8b_uxn_opcodes_phased_h_l105_c3_9612 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l105_c11_a5ed_return_output, 8);
     VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l106_c10_989c_return_output, 16);
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value := VAR_tmp8b_uxn_opcodes_phased_h_l105_c3_9612;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue := VAR_tmp8b_uxn_opcodes_phased_h_l105_c3_9612;
     -- result_MUX[uxn_opcodes_phased_h_l113_c7_d888] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_cond;
     result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iftrue;
     result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output := result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l103_c7_5f32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;

     -- tmp8b_MUX[uxn_opcodes_phased_h_l103_c7_5f32] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond;
     tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue;
     tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output := tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l113_c7_d888_return_output;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse := VAR_tmp8b_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l103_c1_5c43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l109_c7_f89e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l109_c7_f89e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond;
     result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output := result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;

     -- tmp8b_MUX[uxn_opcodes_phased_h_l100_c2_535c] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond;
     tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue;
     tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output := tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;
     VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output;
     VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l103_c1_5c43_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l103_c7_5f32] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond;
     result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue;
     result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output := result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l109_c1_d597] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output;

     -- pc_set[uxn_opcodes_phased_h_l106_c3_48f6] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value <= VAR_pc_set_uxn_opcodes_phased_h_l106_c3_48f6_value;
     -- Outputs

     -- peek_ram[uxn_opcodes_phased_h_l104_c11_550e] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address <= VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output := peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output;

     -- stack_pointer_set[uxn_opcodes_phased_h_l107_c3_aa24] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_stack_index;
     stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l107_c3_aa24_value;
     -- Outputs

     -- Submodule level 4
     VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l109_c1_d597_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l104_c11_550e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;
     -- peek_ram[uxn_opcodes_phased_h_l110_c11_194a] LATENCY=0
     -- Clock enable
     peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE <= VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address <= VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_address;
     -- Outputs
     VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output := peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l100_c2_535c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond;
     result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output := result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value := VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue := VAR_peek_ram_uxn_opcodes_phased_h_l110_c11_194a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;
     -- tmp8a_MUX[uxn_opcodes_phased_h_l109_c7_f89e] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l111_c3_4ebc] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_address;
     stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l111_c3_4ebc_value;
     -- Outputs

     -- Submodule level 6
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l109_c7_f89e_return_output;
     -- tmp8a_MUX[uxn_opcodes_phased_h_l103_c7_5f32] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;

     -- Submodule level 7
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l103_c7_5f32_return_output;
     -- tmp8a_MUX[uxn_opcodes_phased_h_l100_c2_535c] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;

     -- Submodule level 8
     REG_VAR_tmp8a := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l100_c2_535c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8a <= REG_VAR_tmp8a;
REG_COMB_tmp8b <= REG_VAR_tmp8b;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8a <= REG_COMB_tmp8a;
     tmp8b <= REG_COMB_tmp8b;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
