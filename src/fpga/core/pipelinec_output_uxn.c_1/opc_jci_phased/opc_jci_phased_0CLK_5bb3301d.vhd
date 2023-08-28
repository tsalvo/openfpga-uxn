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
-- Submodules: 30
entity opc_jci_phased_0CLK_5bb3301d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jci_phased_0CLK_5bb3301d;
architecture arch of opc_jci_phased_0CLK_5bb3301d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8b : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16a : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16b : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8a : unsigned(7 downto 0);
signal REG_COMB_tmp8b : unsigned(7 downto 0);
signal REG_COMB_tmp16a : unsigned(15 downto 0);
signal REG_COMB_tmp16b : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l32_c6_023c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l32_c1_dd89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l39_c9_7efe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l32_c2_376a]
signal tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(15 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l32_c2_376a]
signal tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_opcodes_phased_h_l32_c2_376a]
signal tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l32_c2_376a]
signal result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l32_c2_376a]
signal tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l34_c11_89ad]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l35_c12_7048]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output : unsigned(16 downto 0);

-- stack_pointer_set[uxn_opcodes_phased_h_l36_c3_c618]
signal stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value : unsigned(7 downto 0);

-- stack_data_get[uxn_opcodes_phased_h_l37_c11_83c5]
signal stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index : unsigned(0 downto 0);
signal stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address : unsigned(7 downto 0);
signal stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output : unsigned(7 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l38_c12_6565]
signal peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l39_c13_6355]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l39_c1_fda0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l41_c9_20f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l39_c9_7efe]
signal tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l39_c9_7efe]
signal result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l39_c9_7efe]
signal tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l40_c12_3a3d]
signal peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l41_c13_0049]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l41_c1_1ae2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l41_c9_20f1]
signal tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l41_c9_20f1]
signal result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l42_c12_3ab3]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_phased_h_l42_c12_7e95]
signal MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l43_c10_3043]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output : unsigned(16 downto 0);

-- pc_set[uxn_opcodes_phased_h_l43_c3_eab7]
signal pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l44_c13_7092]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l44_c9_c27b]
signal result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c
BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a
tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a
tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output);

-- tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a
tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond,
tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue,
tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse,
tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l32_c2_376a
result_MUX_uxn_opcodes_phased_h_l32_c2_376a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond,
result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue,
result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse,
result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a
tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad
BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048
BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output);

-- stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618
stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618 : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE,
stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index,
stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value);

-- stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5
stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5 : entity work.stack_data_get_0CLK_9b5e2ef9 port map (
clk,
stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE,
stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index,
stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address,
stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l38_c12_6565
peek2_ram_uxn_opcodes_phased_h_l38_c12_6565 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address,
peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355
BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe
tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output);

-- result_MUX_uxn_opcodes_phased_h_l39_c9_7efe
result_MUX_uxn_opcodes_phased_h_l39_c9_7efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond,
result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue,
result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse,
result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe
tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d
peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address,
peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049
BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1
tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l41_c9_20f1
result_MUX_uxn_opcodes_phased_h_l41_c9_20f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond,
result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue,
result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse,
result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3
BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output);

-- MUX_uxn_opcodes_phased_h_l42_c12_7e95
MUX_uxn_opcodes_phased_h_l42_c12_7e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond,
MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue,
MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse,
MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043
BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output);

-- pc_set_uxn_opcodes_phased_h_l43_c3_eab7
pc_set_uxn_opcodes_phased_h_l43_c3_eab7 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092
BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output);

-- result_MUX_uxn_opcodes_phased_h_l44_c9_c27b
result_MUX_uxn_opcodes_phased_h_l44_c9_c27b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond,
result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue,
result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse,
result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 -- Registers
 tmp8a,
 tmp8b,
 tmp16a,
 tmp16b,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output,
 tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output,
 result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output,
 stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output,
 peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output,
 result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output,
 peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output,
 result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output,
 MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output,
 result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_uxn_opcodes_phased_h_l35_c3_1b2e : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_uxn_opcodes_phased_h_l34_c3_1230 : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output : unsigned(16 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address : unsigned(7 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8a : unsigned(7 downto 0);
variable REG_VAR_tmp8b : unsigned(7 downto 0);
variable REG_VAR_tmp16a : unsigned(15 downto 0);
variable REG_VAR_tmp16b : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8a := tmp8a;
  REG_VAR_tmp8b := tmp8b;
  REG_VAR_tmp16a := tmp16a;
  REG_VAR_tmp16b := tmp16b;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right := to_unsigned(3, 2);
     VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right := to_unsigned(2, 2);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse := result;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left := VAR_sp;
     VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index := VAR_stack_index;
     VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address := tmp16a;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue := tmp16a;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse := tmp16a;
     VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse := tmp16b;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse := tmp16b;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse := tmp8a;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left := tmp8b;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse := tmp8b;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l34_c11_89ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l39_c13_6355] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l35_c12_7048] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l44_c13_7092] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l42_c12_3ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l41_c13_0049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l32_c6_023c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l32_c6_023c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l39_c13_6355_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l41_c13_0049_return_output;
     VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l42_c12_3ab3_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l44_c13_7092_return_output;
     VAR_tmp8a_uxn_opcodes_phased_h_l34_c3_1230 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l34_c11_89ad_return_output, 8);
     VAR_tmp16a_uxn_opcodes_phased_h_l35_c3_1b2e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l35_c12_7048_return_output, 16);
     VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address := VAR_tmp16a_uxn_opcodes_phased_h_l35_c3_1b2e;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue := VAR_tmp16a_uxn_opcodes_phased_h_l35_c3_1b2e;
     VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address := VAR_tmp8a_uxn_opcodes_phased_h_l34_c3_1230;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value := VAR_tmp8a_uxn_opcodes_phased_h_l34_c3_1230;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue := VAR_tmp8a_uxn_opcodes_phased_h_l34_c3_1230;
     -- result_MUX[uxn_opcodes_phased_h_l44_c9_c27b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_cond;
     result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output := result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output;

     -- MUX[uxn_opcodes_phased_h_l42_c12_7e95] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond <= VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_cond;
     MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue <= VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iftrue;
     MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse <= VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output := MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output;

     -- tmp8a_MUX[uxn_opcodes_phased_h_l32_c2_376a] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l39_c9_7efe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l32_c1_dd89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right := VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue := VAR_MUX_uxn_opcodes_phased_h_l42_c12_7e95_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output;
     VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l32_c1_dd89_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l44_c9_c27b_return_output;
     REG_VAR_tmp8a := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l43_c10_3043] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output;

     -- tmp16a_MUX[uxn_opcodes_phased_h_l41_c9_20f1] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l39_c1_fda0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output;

     -- peek2_ram[uxn_opcodes_phased_h_l38_c12_6565] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output := peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l41_c9_20f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l41_c9_20f1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_cond;
     result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output := result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;

     -- stack_pointer_set[uxn_opcodes_phased_h_l36_c3_c618] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_stack_index;
     stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l36_c3_c618_value;
     -- Outputs

     -- stack_data_get[uxn_opcodes_phased_h_l37_c11_83c5] LATENCY=0
     -- Clock enable
     stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE <= VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_CLOCK_ENABLE;
     -- Inputs
     stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index <= VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_stack_index;
     stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address <= VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_address;
     -- Outputs
     VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output := stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output;

     -- Submodule level 3
     VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l43_c10_3043_return_output, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l39_c1_fda0_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l38_c12_6565_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue := VAR_stack_data_get_uxn_opcodes_phased_h_l37_c11_83c5_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l41_c9_20f1_return_output;
     -- peek2_ram[uxn_opcodes_phased_h_l40_c12_3a3d] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output := peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output;

     -- tmp8b_MUX[uxn_opcodes_phased_h_l32_c2_376a] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond;
     tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue;
     tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse <= VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output := tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l39_c9_7efe] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond;
     result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue;
     result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output := result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;

     -- tmp16a_MUX[uxn_opcodes_phased_h_l39_c9_7efe] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l41_c1_1ae2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output;

     -- Submodule level 4
     VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l41_c1_1ae2_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l40_c12_3a3d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     -- tmp16b_MUX[uxn_opcodes_phased_h_l39_c9_7efe] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;

     -- tmp16a_MUX[uxn_opcodes_phased_h_l32_c2_376a] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;

     -- pc_set[uxn_opcodes_phased_h_l43_c3_eab7] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value <= VAR_pc_set_uxn_opcodes_phased_h_l43_c3_eab7_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l32_c2_376a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond;
     result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output := result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     REG_VAR_tmp16a := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l39_c9_7efe_return_output;
     -- tmp16b_MUX[uxn_opcodes_phased_h_l32_c2_376a] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;

     -- Submodule level 6
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l32_c2_376a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8a <= REG_VAR_tmp8a;
REG_COMB_tmp8b <= REG_VAR_tmp8b;
REG_COMB_tmp16a <= REG_VAR_tmp16a;
REG_COMB_tmp16b <= REG_VAR_tmp16b;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8a <= REG_COMB_tmp8a;
     tmp8b <= REG_COMB_tmp8b;
     tmp16a <= REG_COMB_tmp16a;
     tmp16b <= REG_COMB_tmp16b;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
