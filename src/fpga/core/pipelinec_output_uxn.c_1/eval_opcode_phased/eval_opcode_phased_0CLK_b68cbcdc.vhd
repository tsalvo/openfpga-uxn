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
-- Submodules: 371
entity eval_opcode_phased_0CLK_b68cbcdc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_b68cbcdc;
architecture arch of eval_opcode_phased_0CLK_b68cbcdc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins_a_3f : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_imm : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(8 downto 0) := to_unsigned(0, 9);
signal previous_stack_read : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal opc_eval_result : eval_opcode_result_t := (
is_waiting => to_unsigned(0, 1),
is_pc_updated => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_ins_a_3f : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_is_imm : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(8 downto 0);
signal REG_COMB_previous_stack_read : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2868_c14_0427]
signal BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2869_c14_a5a2]
signal BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2869_c14_b071]
signal BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2869_c14_ef30]
signal UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2869_c14_591e]
signal BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2869_c14_1b59]
signal MUX_uxn_opcodes_h_l2869_c14_1b59_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2869_c14_1b59_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2870_c8_29f6]
signal MUX_uxn_opcodes_h_l2870_c8_29f6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2870_c8_29f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c6_a431]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_13f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c2_3f7b]
signal opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2876_c2_3f7b]
signal is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2876_c48_bea0]
signal brk_uxn_opcodes_h_l2876_c48_bea0_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2876_c48_bea0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_0d4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_7c25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_b570]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_13f1]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2877_c40_efb9]
signal jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2877_c40_efb9_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2877_c40_efb9_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2877_c40_efb9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_3d9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2878]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_2f50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_b570]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2878_c40_4c75]
signal jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2878_c40_4c75_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2878_c40_4c75_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2878_c40_4c75_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_77b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_f254]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_b387]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_2f50]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2879_c40_14c6]
signal jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2879_c40_14c6_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2879_c40_14c6_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2879_c40_14c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_ea6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_d184]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_df55]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_b387]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2880_c40_c733]
signal lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2880_c40_c733_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2880_c40_c733_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2880_c40_c733_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_ddf7]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_fcc7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_82af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_df55]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2881_c40_5bcd]
signal lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2881_c40_5bcd_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2881_c40_5bcd_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_b452]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_5f74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_0edd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_82af]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2882_c40_dc08]
signal lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2882_c40_dc08_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2882_c40_dc08_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2882_c40_dc08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_8581]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_1462]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_faaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_0edd]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2883_c40_37c9]
signal lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2883_c40_37c9_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2883_c40_37c9_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2883_c40_37c9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_0000]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_6965]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_3771]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_faaa]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2884_c40_b2db]
signal inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2884_c40_b2db_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2884_c40_b2db_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2884_c40_b2db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_7942]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_63db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_17a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_3771]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2885_c40_40b7]
signal inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2885_c40_40b7_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2885_c40_40b7_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2885_c40_40b7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_7862]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_8d7a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_41ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_17a9]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2886_c40_b641]
signal pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2886_c40_b641_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2886_c40_b641_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2886_c40_b641_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_5d24]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_5fea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_e3a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_41ad]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2887_c40_c8a9]
signal pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2887_c40_c8a9_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2887_c40_c8a9_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_d0ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_f0dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_7df0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_e3a9]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2888_c40_294b]
signal nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2888_c40_294b_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2888_c40_294b_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2888_c40_294b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5ce2]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_a6be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_e52e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_7df0]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2889_c40_b45a]
signal nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2889_c40_b45a_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2889_c40_b45a_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2889_c40_b45a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_f185]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_7ff2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_bb6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_e52e]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2890_c40_bf14]
signal swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2890_c40_bf14_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2890_c40_bf14_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2890_c40_bf14_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4e16]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_871c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_3839]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_bb6c]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2891_c40_744a]
signal swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2891_c40_744a_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2891_c40_744a_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2891_c40_744a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_108a]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_6763]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_0adc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_3839]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2892_c40_2905]
signal rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2892_c40_2905_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2892_c40_2905_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2892_c40_2905_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_59e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_37f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_88f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_0adc]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2893_c40_2b69]
signal rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2893_c40_2b69_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2893_c40_2b69_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2893_c40_2b69_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f7b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_5a30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_4b4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_88f2]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2894_c40_b463]
signal dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2894_c40_b463_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2894_c40_b463_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2894_c40_b463_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_5d46]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_3dd1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_da36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_4b4d]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2895_c40_56bb]
signal dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2895_c40_56bb_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2895_c40_56bb_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2895_c40_56bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_6a22]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_bd25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_28c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_da36]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2896_c40_e535]
signal ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2896_c40_e535_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2896_c40_e535_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2896_c40_e535_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_5635]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_6cd0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_3fa4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_28c9]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2897_c40_465f]
signal ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2897_c40_465f_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2897_c40_465f_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2897_c40_465f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8efb]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_5dcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_f5b8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_3fa4]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2898_c40_5d63]
signal equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2898_c40_5d63_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2898_c40_5d63_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2898_c40_5d63_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_2005]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_38b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_e97d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_f5b8]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2899_c40_9c12]
signal equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2899_c40_9c12_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2899_c40_9c12_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2899_c40_9c12_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_f33f]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_0789]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_ebe2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_e97d]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2900_c40_7a50]
signal neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2900_c40_7a50_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2900_c40_7a50_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2900_c40_7a50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_50d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_4ef7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_a660]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_ebe2]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2901_c40_5da1]
signal neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2901_c40_5da1_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2901_c40_5da1_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2901_c40_5da1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ecf]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_faaf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_fc70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_a660]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2902_c40_2141]
signal gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2902_c40_2141_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2902_c40_2141_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2902_c40_2141_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_0d88]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ac79]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_a6a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_fc70]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2903_c40_3dc0]
signal gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2903_c40_3dc0_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2903_c40_3dc0_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_6758]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1e64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_fc21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_a6a5]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2904_c40_dd83]
signal lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2904_c40_dd83_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2904_c40_dd83_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2904_c40_dd83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_a8d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_4337]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_0752]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_fc21]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2905_c40_8898]
signal lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2905_c40_8898_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2905_c40_8898_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2905_c40_8898_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_1a69]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_fb1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_2ee4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_0752]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2906_c40_5304]
signal jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2906_c40_5304_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2906_c40_5304_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2906_c40_5304_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2906_c40_5304_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_3621]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_cb41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_214f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_2ee4]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2907_c40_cad5]
signal jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2907_c40_cad5_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2907_c40_cad5_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_38d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_33bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_3875]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_214f]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2908_c40_5117]
signal jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2908_c40_5117_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2908_c40_5117_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2908_c40_5117_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2908_c40_5117_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_560b]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_ef9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_ce40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_3875]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2909_c40_a66f]
signal jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2909_c40_a66f_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2909_c40_a66f_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_3cde]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_7fbd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_e926]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_ce40]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2910_c40_7591]
signal jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2910_c40_7591_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2910_c40_7591_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2910_c40_7591_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2910_c40_7591_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_aaf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_c2d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_524a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_e926]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2911_c40_49d0]
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_d2d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_9a4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_5088]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_524a]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2912_c40_d8a9]
signal sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2912_c40_d8a9_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2912_c40_d8a9_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2912_c40_d8a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_191d]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_45a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_8233]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_5088]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2913_c40_44f7]
signal sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2913_c40_44f7_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2913_c40_44f7_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2913_c40_44f7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2859]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_55a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_6a07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_8233]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2914_c40_c5ed]
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_90fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_acad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_4786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_6a07]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2915_c40_acb0]
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_421d]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_b675]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8ef8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_4786]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2916_c40_6249]
signal stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2916_c40_6249_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2916_c40_6249_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2916_c40_6249_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_69b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7def]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_11ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_8ef8]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2917_c40_1728]
signal stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2917_c40_1728_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2917_c40_1728_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2917_c40_1728_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_7f85]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_67a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_67ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_11ce]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2918_c40_aa52]
signal ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2918_c40_aa52_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2ec6]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_085d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_3a29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_67ef]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2919_c40_842a]
signal ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2919_c40_842a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_5fcf]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_5730]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_7afd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_3a29]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2920_c40_c3d7]
signal str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2920_c40_c3d7_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2920_c40_c3d7_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2920_c40_c3d7_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2920_c40_c3d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_4431]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_59af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_b431]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_7afd]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2921_c40_9f97]
signal str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2921_c40_9f97_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2921_c40_9f97_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2921_c40_9f97_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2921_c40_9f97_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_11d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_af3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_581d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_b431]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2922_c40_bd07]
signal lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2922_c40_bd07_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2922_c40_bd07_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2922_c40_bd07_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_73e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_11ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_5393]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_581d]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2923_c40_6d1b]
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_29a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_e3e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_59d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_5393]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2924_c40_b667]
signal sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2924_c40_b667_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2924_c40_b667_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2924_c40_b667_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_6d7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_95b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_f943]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_59d8]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2925_c40_418d]
signal sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2925_c40_418d_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2925_c40_418d_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2925_c40_418d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_a58a]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_c49d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_28f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_f943]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2926_c40_551f]
signal dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2926_c40_551f_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2926_c40_551f_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2926_c40_551f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_ab28]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_047e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_b058]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_28f5]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2927_c40_5a6f]
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_521c]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_b773]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_fcb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_b058]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2928_c40_6751]
signal deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2928_c40_6751_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_2738]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_c621]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_9e76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_fcb9]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2929_c40_34ea]
signal deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2929_c40_34ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_d0d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_557e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_e319]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_9e76]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2930_c40_d059]
signal add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2930_c40_d059_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2930_c40_d059_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2930_c40_d059_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_957d]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_35c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_0c81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_e319]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2931_c40_6c17]
signal add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2931_c40_6c17_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2931_c40_6c17_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2931_c40_6c17_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_f822]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_9bf9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_7a7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_0c81]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2932_c40_6a6d]
signal sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2932_c40_6a6d_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2932_c40_6a6d_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2932_c40_6a6d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f329]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_26b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a10a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_7a7d]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2933_c40_8c47]
signal sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2933_c40_8c47_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2933_c40_8c47_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2933_c40_8c47_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ea83]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_ca7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_2c09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_a10a]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2934_c40_473b]
signal mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2934_c40_473b_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2934_c40_473b_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2934_c40_473b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_d548]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_aae2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_ce3c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_2c09]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2935_c40_12e5]
signal mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2935_c40_12e5_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2935_c40_12e5_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2935_c40_12e5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_5f61]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e8a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_b306]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_ce3c]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2936_c40_88bc]
signal div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2936_c40_88bc_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2936_c40_88bc_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2936_c40_88bc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1cf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_93b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_6f70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_b306]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2937_c40_7e3f]
signal div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2937_c40_7e3f_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2937_c40_7e3f_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2937_c40_7e3f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_f0b6]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_1519]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_c2c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_6f70]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2938_c40_2637]
signal and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2938_c40_2637_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2938_c40_2637_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2938_c40_2637_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_dcf1]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_62d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_fb0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_c2c6]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2939_c40_50e1]
signal and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2939_c40_50e1_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2939_c40_50e1_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2939_c40_50e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_369c]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_7aca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_09fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_fb0b]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2940_c40_b128]
signal ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2940_c40_b128_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2940_c40_b128_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2940_c40_b128_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_9b28]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_6290]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_3e22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_09fc]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2941_c40_1f35]
signal ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2941_c40_1f35_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2941_c40_1f35_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2941_c40_1f35_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_1c9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_e7c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_1e9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_3e22]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2942_c40_2405]
signal eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2942_c40_2405_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2942_c40_2405_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2942_c40_2405_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_dfb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_c5ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_27eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_1e9b]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2943_c40_7a78]
signal eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2943_c40_7a78_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2943_c40_7a78_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2943_c40_7a78_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_9564]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_7376]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_7073]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_27eb]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2944_c40_0377]
signal sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2944_c40_0377_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2944_c40_0377_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2944_c40_0377_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_d472]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_0677]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_7073]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2945_c40_fb3a]
signal sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2945_c40_fb3a_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2945_c40_fb3a_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2947_c16_f65b]
signal CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2948_c2_b58b]
signal BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2950_c2_0fde]
signal sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2950_c2_0fde]
signal sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2951_c3_4c29]
signal BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2953_c3_d3fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2956_c29_5178]
signal MUX_uxn_opcodes_h_l2956_c29_5178_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2956_c29_5178_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2956_c29_5178_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2956_c29_5178_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2956_c19_47dc]
signal BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2957_c20_da4c]
signal MUX_uxn_opcodes_h_l2957_c20_da4c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2957_c20_da4c_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2957_c2_56a7]
signal BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2959_c24_adcd]
signal stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output : unsigned(7 downto 0);

function CAST_TO_uint9_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_uint9_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,9)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_waiting := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427
BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left,
BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right,
BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2
BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left,
BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right,
BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071
BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left,
BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right,
BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30
UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e
BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left,
BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right,
BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output);

-- MUX_uxn_opcodes_h_l2869_c14_1b59
MUX_uxn_opcodes_h_l2869_c14_1b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2869_c14_1b59_cond,
MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue,
MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse,
MUX_uxn_opcodes_h_l2869_c14_1b59_return_output);

-- MUX_uxn_opcodes_h_l2870_c8_29f6
MUX_uxn_opcodes_h_l2870_c8_29f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2870_c8_29f6_cond,
MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue,
MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse,
MUX_uxn_opcodes_h_l2870_c8_29f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431
BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b
opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b
is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond,
is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue,
is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse,
is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output);

-- brk_uxn_opcodes_h_l2876_c48_bea0
brk_uxn_opcodes_h_l2876_c48_bea0 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2876_c48_bea0_phase,
brk_uxn_opcodes_h_l2876_c48_bea0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1
opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output);

-- jci_uxn_opcodes_h_l2877_c40_efb9
jci_uxn_opcodes_h_l2877_c40_efb9 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2877_c40_efb9_phase,
jci_uxn_opcodes_h_l2877_c40_efb9_pc,
jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read,
jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read,
jci_uxn_opcodes_h_l2877_c40_efb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_b570
opc_result_MUX_uxn_opcodes_h_l2878_c7_b570 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output);

-- jmi_uxn_opcodes_h_l2878_c40_4c75
jmi_uxn_opcodes_h_l2878_c40_4c75 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2878_c40_4c75_phase,
jmi_uxn_opcodes_h_l2878_c40_4c75_pc,
jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read,
jmi_uxn_opcodes_h_l2878_c40_4c75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50
opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output);

-- jsi_uxn_opcodes_h_l2879_c40_14c6
jsi_uxn_opcodes_h_l2879_c40_14c6 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2879_c40_14c6_phase,
jsi_uxn_opcodes_h_l2879_c40_14c6_pc,
jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read,
jsi_uxn_opcodes_h_l2879_c40_14c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_b387
opc_result_MUX_uxn_opcodes_h_l2880_c7_b387 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output);

-- lit_uxn_opcodes_h_l2880_c40_c733
lit_uxn_opcodes_h_l2880_c40_c733 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2880_c40_c733_phase,
lit_uxn_opcodes_h_l2880_c40_c733_pc,
lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read,
lit_uxn_opcodes_h_l2880_c40_c733_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_df55
opc_result_MUX_uxn_opcodes_h_l2881_c7_df55 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output);

-- lit2_uxn_opcodes_h_l2881_c40_5bcd
lit2_uxn_opcodes_h_l2881_c40_5bcd : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2881_c40_5bcd_phase,
lit2_uxn_opcodes_h_l2881_c40_5bcd_pc,
lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read,
lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_82af
opc_result_MUX_uxn_opcodes_h_l2882_c7_82af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output);

-- lit_uxn_opcodes_h_l2882_c40_dc08
lit_uxn_opcodes_h_l2882_c40_dc08 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2882_c40_dc08_phase,
lit_uxn_opcodes_h_l2882_c40_dc08_pc,
lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read,
lit_uxn_opcodes_h_l2882_c40_dc08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd
opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output);

-- lit2_uxn_opcodes_h_l2883_c40_37c9
lit2_uxn_opcodes_h_l2883_c40_37c9 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2883_c40_37c9_phase,
lit2_uxn_opcodes_h_l2883_c40_37c9_pc,
lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read,
lit2_uxn_opcodes_h_l2883_c40_37c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa
opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output);

-- inc_uxn_opcodes_h_l2884_c40_b2db
inc_uxn_opcodes_h_l2884_c40_b2db : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2884_c40_b2db_phase,
inc_uxn_opcodes_h_l2884_c40_b2db_ins,
inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read,
inc_uxn_opcodes_h_l2884_c40_b2db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_3771
opc_result_MUX_uxn_opcodes_h_l2885_c7_3771 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output);

-- inc2_uxn_opcodes_h_l2885_c40_40b7
inc2_uxn_opcodes_h_l2885_c40_40b7 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2885_c40_40b7_phase,
inc2_uxn_opcodes_h_l2885_c40_40b7_ins,
inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read,
inc2_uxn_opcodes_h_l2885_c40_40b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9
opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output);

-- pop_uxn_opcodes_h_l2886_c40_b641
pop_uxn_opcodes_h_l2886_c40_b641 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2886_c40_b641_phase,
pop_uxn_opcodes_h_l2886_c40_b641_ins,
pop_uxn_opcodes_h_l2886_c40_b641_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad
opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output);

-- pop2_uxn_opcodes_h_l2887_c40_c8a9
pop2_uxn_opcodes_h_l2887_c40_c8a9 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2887_c40_c8a9_phase,
pop2_uxn_opcodes_h_l2887_c40_c8a9_ins,
pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9
opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output);

-- nip_uxn_opcodes_h_l2888_c40_294b
nip_uxn_opcodes_h_l2888_c40_294b : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2888_c40_294b_phase,
nip_uxn_opcodes_h_l2888_c40_294b_ins,
nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read,
nip_uxn_opcodes_h_l2888_c40_294b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0
opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output);

-- nip2_uxn_opcodes_h_l2889_c40_b45a
nip2_uxn_opcodes_h_l2889_c40_b45a : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2889_c40_b45a_phase,
nip2_uxn_opcodes_h_l2889_c40_b45a_ins,
nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read,
nip2_uxn_opcodes_h_l2889_c40_b45a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e
opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output);

-- swp_uxn_opcodes_h_l2890_c40_bf14
swp_uxn_opcodes_h_l2890_c40_bf14 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2890_c40_bf14_phase,
swp_uxn_opcodes_h_l2890_c40_bf14_ins,
swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read,
swp_uxn_opcodes_h_l2890_c40_bf14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c
opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output);

-- swp2_uxn_opcodes_h_l2891_c40_744a
swp2_uxn_opcodes_h_l2891_c40_744a : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2891_c40_744a_phase,
swp2_uxn_opcodes_h_l2891_c40_744a_ins,
swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read,
swp2_uxn_opcodes_h_l2891_c40_744a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_3839
opc_result_MUX_uxn_opcodes_h_l2892_c7_3839 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output);

-- rot_uxn_opcodes_h_l2892_c40_2905
rot_uxn_opcodes_h_l2892_c40_2905 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2892_c40_2905_phase,
rot_uxn_opcodes_h_l2892_c40_2905_ins,
rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read,
rot_uxn_opcodes_h_l2892_c40_2905_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc
opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output);

-- rot2_uxn_opcodes_h_l2893_c40_2b69
rot2_uxn_opcodes_h_l2893_c40_2b69 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2893_c40_2b69_phase,
rot2_uxn_opcodes_h_l2893_c40_2b69_ins,
rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read,
rot2_uxn_opcodes_h_l2893_c40_2b69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2
opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output);

-- dup_uxn_opcodes_h_l2894_c40_b463
dup_uxn_opcodes_h_l2894_c40_b463 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2894_c40_b463_phase,
dup_uxn_opcodes_h_l2894_c40_b463_ins,
dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read,
dup_uxn_opcodes_h_l2894_c40_b463_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d
opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output);

-- dup2_uxn_opcodes_h_l2895_c40_56bb
dup2_uxn_opcodes_h_l2895_c40_56bb : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2895_c40_56bb_phase,
dup2_uxn_opcodes_h_l2895_c40_56bb_ins,
dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read,
dup2_uxn_opcodes_h_l2895_c40_56bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_da36
opc_result_MUX_uxn_opcodes_h_l2896_c7_da36 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output);

-- ovr_uxn_opcodes_h_l2896_c40_e535
ovr_uxn_opcodes_h_l2896_c40_e535 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2896_c40_e535_phase,
ovr_uxn_opcodes_h_l2896_c40_e535_ins,
ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read,
ovr_uxn_opcodes_h_l2896_c40_e535_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9
opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output);

-- ovr2_uxn_opcodes_h_l2897_c40_465f
ovr2_uxn_opcodes_h_l2897_c40_465f : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2897_c40_465f_phase,
ovr2_uxn_opcodes_h_l2897_c40_465f_ins,
ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read,
ovr2_uxn_opcodes_h_l2897_c40_465f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4
opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output);

-- equ_uxn_opcodes_h_l2898_c40_5d63
equ_uxn_opcodes_h_l2898_c40_5d63 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2898_c40_5d63_phase,
equ_uxn_opcodes_h_l2898_c40_5d63_ins,
equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read,
equ_uxn_opcodes_h_l2898_c40_5d63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8
opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output);

-- equ2_uxn_opcodes_h_l2899_c40_9c12
equ2_uxn_opcodes_h_l2899_c40_9c12 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2899_c40_9c12_phase,
equ2_uxn_opcodes_h_l2899_c40_9c12_ins,
equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read,
equ2_uxn_opcodes_h_l2899_c40_9c12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d
opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output);

-- neq_uxn_opcodes_h_l2900_c40_7a50
neq_uxn_opcodes_h_l2900_c40_7a50 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2900_c40_7a50_phase,
neq_uxn_opcodes_h_l2900_c40_7a50_ins,
neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read,
neq_uxn_opcodes_h_l2900_c40_7a50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2
opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output);

-- neq2_uxn_opcodes_h_l2901_c40_5da1
neq2_uxn_opcodes_h_l2901_c40_5da1 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2901_c40_5da1_phase,
neq2_uxn_opcodes_h_l2901_c40_5da1_ins,
neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read,
neq2_uxn_opcodes_h_l2901_c40_5da1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_a660
opc_result_MUX_uxn_opcodes_h_l2902_c7_a660 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output);

-- gth_uxn_opcodes_h_l2902_c40_2141
gth_uxn_opcodes_h_l2902_c40_2141 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2902_c40_2141_phase,
gth_uxn_opcodes_h_l2902_c40_2141_ins,
gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read,
gth_uxn_opcodes_h_l2902_c40_2141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output);

-- gth2_uxn_opcodes_h_l2903_c40_3dc0
gth2_uxn_opcodes_h_l2903_c40_3dc0 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2903_c40_3dc0_phase,
gth2_uxn_opcodes_h_l2903_c40_3dc0_ins,
gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read,
gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5
opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output);

-- lth_uxn_opcodes_h_l2904_c40_dd83
lth_uxn_opcodes_h_l2904_c40_dd83 : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2904_c40_dd83_phase,
lth_uxn_opcodes_h_l2904_c40_dd83_ins,
lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read,
lth_uxn_opcodes_h_l2904_c40_dd83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21
opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output);

-- lth2_uxn_opcodes_h_l2905_c40_8898
lth2_uxn_opcodes_h_l2905_c40_8898 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2905_c40_8898_phase,
lth2_uxn_opcodes_h_l2905_c40_8898_ins,
lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read,
lth2_uxn_opcodes_h_l2905_c40_8898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_0752
opc_result_MUX_uxn_opcodes_h_l2906_c7_0752 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output);

-- jmp_uxn_opcodes_h_l2906_c40_5304
jmp_uxn_opcodes_h_l2906_c40_5304 : entity work.jmp_0CLK_6239a3a6 port map (
clk,
jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2906_c40_5304_phase,
jmp_uxn_opcodes_h_l2906_c40_5304_ins,
jmp_uxn_opcodes_h_l2906_c40_5304_pc,
jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read,
jmp_uxn_opcodes_h_l2906_c40_5304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4
opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output);

-- jmp2_uxn_opcodes_h_l2907_c40_cad5
jmp2_uxn_opcodes_h_l2907_c40_cad5 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2907_c40_cad5_phase,
jmp2_uxn_opcodes_h_l2907_c40_cad5_ins,
jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read,
jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_214f
opc_result_MUX_uxn_opcodes_h_l2908_c7_214f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output);

-- jcn_uxn_opcodes_h_l2908_c40_5117
jcn_uxn_opcodes_h_l2908_c40_5117 : entity work.jcn_0CLK_7e557991 port map (
clk,
jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2908_c40_5117_phase,
jcn_uxn_opcodes_h_l2908_c40_5117_ins,
jcn_uxn_opcodes_h_l2908_c40_5117_pc,
jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read,
jcn_uxn_opcodes_h_l2908_c40_5117_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_3875
opc_result_MUX_uxn_opcodes_h_l2909_c7_3875 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output);

-- jcn2_uxn_opcodes_h_l2909_c40_a66f
jcn2_uxn_opcodes_h_l2909_c40_a66f : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2909_c40_a66f_phase,
jcn2_uxn_opcodes_h_l2909_c40_a66f_ins,
jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read,
jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40
opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output);

-- jsr_uxn_opcodes_h_l2910_c40_7591
jsr_uxn_opcodes_h_l2910_c40_7591 : entity work.jsr_0CLK_0cbff8de port map (
clk,
jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2910_c40_7591_phase,
jsr_uxn_opcodes_h_l2910_c40_7591_ins,
jsr_uxn_opcodes_h_l2910_c40_7591_pc,
jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read,
jsr_uxn_opcodes_h_l2910_c40_7591_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_e926
opc_result_MUX_uxn_opcodes_h_l2911_c7_e926 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output);

-- jsr2_uxn_opcodes_h_l2911_c40_49d0
jsr2_uxn_opcodes_h_l2911_c40_49d0 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2911_c40_49d0_phase,
jsr2_uxn_opcodes_h_l2911_c40_49d0_ins,
jsr2_uxn_opcodes_h_l2911_c40_49d0_pc,
jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read,
jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_524a
opc_result_MUX_uxn_opcodes_h_l2912_c7_524a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output);

-- sth_uxn_opcodes_h_l2912_c40_d8a9
sth_uxn_opcodes_h_l2912_c40_d8a9 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2912_c40_d8a9_phase,
sth_uxn_opcodes_h_l2912_c40_d8a9_ins,
sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read,
sth_uxn_opcodes_h_l2912_c40_d8a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_5088
opc_result_MUX_uxn_opcodes_h_l2913_c7_5088 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output);

-- sth2_uxn_opcodes_h_l2913_c40_44f7
sth2_uxn_opcodes_h_l2913_c40_44f7 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2913_c40_44f7_phase,
sth2_uxn_opcodes_h_l2913_c40_44f7_ins,
sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read,
sth2_uxn_opcodes_h_l2913_c40_44f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_8233
opc_result_MUX_uxn_opcodes_h_l2914_c7_8233 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output);

-- ldz_uxn_opcodes_h_l2914_c40_c5ed
ldz_uxn_opcodes_h_l2914_c40_c5ed : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2914_c40_c5ed_phase,
ldz_uxn_opcodes_h_l2914_c40_c5ed_ins,
ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read,
ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read,
ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07
opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output);

-- ldz2_uxn_opcodes_h_l2915_c40_acb0
ldz2_uxn_opcodes_h_l2915_c40_acb0 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2915_c40_acb0_phase,
ldz2_uxn_opcodes_h_l2915_c40_acb0_ins,
ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read,
ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read,
ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_4786
opc_result_MUX_uxn_opcodes_h_l2916_c7_4786 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output);

-- stz_uxn_opcodes_h_l2916_c40_6249
stz_uxn_opcodes_h_l2916_c40_6249 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2916_c40_6249_phase,
stz_uxn_opcodes_h_l2916_c40_6249_ins,
stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read,
stz_uxn_opcodes_h_l2916_c40_6249_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8
opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output);

-- stz2_uxn_opcodes_h_l2917_c40_1728
stz2_uxn_opcodes_h_l2917_c40_1728 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2917_c40_1728_phase,
stz2_uxn_opcodes_h_l2917_c40_1728_ins,
stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read,
stz2_uxn_opcodes_h_l2917_c40_1728_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce
opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output);

-- ldr_uxn_opcodes_h_l2918_c40_aa52
ldr_uxn_opcodes_h_l2918_c40_aa52 : entity work.ldr_0CLK_5cd52163 port map (
clk,
ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2918_c40_aa52_phase,
ldr_uxn_opcodes_h_l2918_c40_aa52_ins,
ldr_uxn_opcodes_h_l2918_c40_aa52_pc,
ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read,
ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read,
ldr_uxn_opcodes_h_l2918_c40_aa52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef
opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output);

-- ldr2_uxn_opcodes_h_l2919_c40_842a
ldr2_uxn_opcodes_h_l2919_c40_842a : entity work.ldr2_0CLK_388b52ed port map (
clk,
ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2919_c40_842a_phase,
ldr2_uxn_opcodes_h_l2919_c40_842a_ins,
ldr2_uxn_opcodes_h_l2919_c40_842a_pc,
ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read,
ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read,
ldr2_uxn_opcodes_h_l2919_c40_842a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29
opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output);

-- str1_uxn_opcodes_h_l2920_c40_c3d7
str1_uxn_opcodes_h_l2920_c40_c3d7 : entity work.str1_0CLK_1e72bf9c port map (
clk,
str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2920_c40_c3d7_phase,
str1_uxn_opcodes_h_l2920_c40_c3d7_ins,
str1_uxn_opcodes_h_l2920_c40_c3d7_pc,
str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read,
str1_uxn_opcodes_h_l2920_c40_c3d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd
opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output);

-- str2_uxn_opcodes_h_l2921_c40_9f97
str2_uxn_opcodes_h_l2921_c40_9f97 : entity work.str2_0CLK_de602816 port map (
clk,
str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2921_c40_9f97_phase,
str2_uxn_opcodes_h_l2921_c40_9f97_ins,
str2_uxn_opcodes_h_l2921_c40_9f97_pc,
str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read,
str2_uxn_opcodes_h_l2921_c40_9f97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_b431
opc_result_MUX_uxn_opcodes_h_l2922_c7_b431 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output);

-- lda_uxn_opcodes_h_l2922_c40_bd07
lda_uxn_opcodes_h_l2922_c40_bd07 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2922_c40_bd07_phase,
lda_uxn_opcodes_h_l2922_c40_bd07_ins,
lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read,
lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read,
lda_uxn_opcodes_h_l2922_c40_bd07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_581d
opc_result_MUX_uxn_opcodes_h_l2923_c7_581d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output);

-- lda2_uxn_opcodes_h_l2923_c40_6d1b
lda2_uxn_opcodes_h_l2923_c40_6d1b : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2923_c40_6d1b_phase,
lda2_uxn_opcodes_h_l2923_c40_6d1b_ins,
lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read,
lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read,
lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_5393
opc_result_MUX_uxn_opcodes_h_l2924_c7_5393 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output);

-- sta_uxn_opcodes_h_l2924_c40_b667
sta_uxn_opcodes_h_l2924_c40_b667 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2924_c40_b667_phase,
sta_uxn_opcodes_h_l2924_c40_b667_ins,
sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read,
sta_uxn_opcodes_h_l2924_c40_b667_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8
opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output);

-- sta2_uxn_opcodes_h_l2925_c40_418d
sta2_uxn_opcodes_h_l2925_c40_418d : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2925_c40_418d_phase,
sta2_uxn_opcodes_h_l2925_c40_418d_ins,
sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read,
sta2_uxn_opcodes_h_l2925_c40_418d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_f943
opc_result_MUX_uxn_opcodes_h_l2926_c7_f943 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output);

-- dei_uxn_opcodes_h_l2926_c40_551f
dei_uxn_opcodes_h_l2926_c40_551f : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2926_c40_551f_phase,
dei_uxn_opcodes_h_l2926_c40_551f_ins,
dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read,
dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read,
dei_uxn_opcodes_h_l2926_c40_551f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5
opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output);

-- dei2_uxn_opcodes_h_l2927_c40_5a6f
dei2_uxn_opcodes_h_l2927_c40_5a6f : entity work.dei2_0CLK_919eceda port map (
clk,
dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2927_c40_5a6f_phase,
dei2_uxn_opcodes_h_l2927_c40_5a6f_ins,
dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read,
dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read,
dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_b058
opc_result_MUX_uxn_opcodes_h_l2928_c7_b058 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output);

-- deo_uxn_opcodes_h_l2928_c40_6751
deo_uxn_opcodes_h_l2928_c40_6751 : entity work.deo_0CLK_71870e21 port map (
clk,
deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2928_c40_6751_phase,
deo_uxn_opcodes_h_l2928_c40_6751_ins,
deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read,
deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read,
deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read,
deo_uxn_opcodes_h_l2928_c40_6751_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9
opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output);

-- deo2_uxn_opcodes_h_l2929_c40_34ea
deo2_uxn_opcodes_h_l2929_c40_34ea : entity work.deo2_0CLK_ba9fabfb port map (
clk,
deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2929_c40_34ea_phase,
deo2_uxn_opcodes_h_l2929_c40_34ea_ins,
deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read,
deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read,
deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read,
deo2_uxn_opcodes_h_l2929_c40_34ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76
opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output);

-- add_uxn_opcodes_h_l2930_c40_d059
add_uxn_opcodes_h_l2930_c40_d059 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE,
add_uxn_opcodes_h_l2930_c40_d059_phase,
add_uxn_opcodes_h_l2930_c40_d059_ins,
add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read,
add_uxn_opcodes_h_l2930_c40_d059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_e319
opc_result_MUX_uxn_opcodes_h_l2931_c7_e319 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output);

-- add2_uxn_opcodes_h_l2931_c40_6c17
add2_uxn_opcodes_h_l2931_c40_6c17 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2931_c40_6c17_phase,
add2_uxn_opcodes_h_l2931_c40_6c17_ins,
add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read,
add2_uxn_opcodes_h_l2931_c40_6c17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81
opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output);

-- sub_uxn_opcodes_h_l2932_c40_6a6d
sub_uxn_opcodes_h_l2932_c40_6a6d : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2932_c40_6a6d_phase,
sub_uxn_opcodes_h_l2932_c40_6a6d_ins,
sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read,
sub_uxn_opcodes_h_l2932_c40_6a6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d
opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output);

-- sub2_uxn_opcodes_h_l2933_c40_8c47
sub2_uxn_opcodes_h_l2933_c40_8c47 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2933_c40_8c47_phase,
sub2_uxn_opcodes_h_l2933_c40_8c47_ins,
sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read,
sub2_uxn_opcodes_h_l2933_c40_8c47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a
opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output);

-- mul_uxn_opcodes_h_l2934_c40_473b
mul_uxn_opcodes_h_l2934_c40_473b : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2934_c40_473b_phase,
mul_uxn_opcodes_h_l2934_c40_473b_ins,
mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read,
mul_uxn_opcodes_h_l2934_c40_473b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09
opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output);

-- mul2_uxn_opcodes_h_l2935_c40_12e5
mul2_uxn_opcodes_h_l2935_c40_12e5 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2935_c40_12e5_phase,
mul2_uxn_opcodes_h_l2935_c40_12e5_ins,
mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read,
mul2_uxn_opcodes_h_l2935_c40_12e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c
opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output);

-- div_uxn_opcodes_h_l2936_c40_88bc
div_uxn_opcodes_h_l2936_c40_88bc : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE,
div_uxn_opcodes_h_l2936_c40_88bc_phase,
div_uxn_opcodes_h_l2936_c40_88bc_ins,
div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read,
div_uxn_opcodes_h_l2936_c40_88bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_b306
opc_result_MUX_uxn_opcodes_h_l2937_c7_b306 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output);

-- div2_uxn_opcodes_h_l2937_c40_7e3f
div2_uxn_opcodes_h_l2937_c40_7e3f : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2937_c40_7e3f_phase,
div2_uxn_opcodes_h_l2937_c40_7e3f_ins,
div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read,
div2_uxn_opcodes_h_l2937_c40_7e3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70
opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output);

-- and_uxn_opcodes_h_l2938_c40_2637
and_uxn_opcodes_h_l2938_c40_2637 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE,
and_uxn_opcodes_h_l2938_c40_2637_phase,
and_uxn_opcodes_h_l2938_c40_2637_ins,
and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read,
and_uxn_opcodes_h_l2938_c40_2637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6
opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output);

-- and2_uxn_opcodes_h_l2939_c40_50e1
and2_uxn_opcodes_h_l2939_c40_50e1 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2939_c40_50e1_phase,
and2_uxn_opcodes_h_l2939_c40_50e1_ins,
and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read,
and2_uxn_opcodes_h_l2939_c40_50e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b
opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output);

-- ora_uxn_opcodes_h_l2940_c40_b128
ora_uxn_opcodes_h_l2940_c40_b128 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2940_c40_b128_phase,
ora_uxn_opcodes_h_l2940_c40_b128_ins,
ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read,
ora_uxn_opcodes_h_l2940_c40_b128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc
opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output);

-- ora2_uxn_opcodes_h_l2941_c40_1f35
ora2_uxn_opcodes_h_l2941_c40_1f35 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2941_c40_1f35_phase,
ora2_uxn_opcodes_h_l2941_c40_1f35_ins,
ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read,
ora2_uxn_opcodes_h_l2941_c40_1f35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22
opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output);

-- eor_uxn_opcodes_h_l2942_c40_2405
eor_uxn_opcodes_h_l2942_c40_2405 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2942_c40_2405_phase,
eor_uxn_opcodes_h_l2942_c40_2405_ins,
eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read,
eor_uxn_opcodes_h_l2942_c40_2405_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b
opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output);

-- eor2_uxn_opcodes_h_l2943_c40_7a78
eor2_uxn_opcodes_h_l2943_c40_7a78 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2943_c40_7a78_phase,
eor2_uxn_opcodes_h_l2943_c40_7a78_ins,
eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read,
eor2_uxn_opcodes_h_l2943_c40_7a78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb
opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output);

-- sft_uxn_opcodes_h_l2944_c40_0377
sft_uxn_opcodes_h_l2944_c40_0377 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2944_c40_0377_phase,
sft_uxn_opcodes_h_l2944_c40_0377_ins,
sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read,
sft_uxn_opcodes_h_l2944_c40_0377_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_7073
opc_result_MUX_uxn_opcodes_h_l2945_c7_7073 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output);

-- sft2_uxn_opcodes_h_l2945_c40_fb3a
sft2_uxn_opcodes_h_l2945_c40_fb3a : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2945_c40_fb3a_phase,
sft2_uxn_opcodes_h_l2945_c40_fb3a_ins,
sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read,
sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b
CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x,
CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b
BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left,
BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right,
BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output);

-- sp1_MUX_uxn_opcodes_h_l2950_c2_0fde
sp1_MUX_uxn_opcodes_h_l2950_c2_0fde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond,
sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue,
sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse,
sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output);

-- sp0_MUX_uxn_opcodes_h_l2950_c2_0fde
sp0_MUX_uxn_opcodes_h_l2950_c2_0fde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond,
sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue,
sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse,
sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29
BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left,
BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right,
BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa
BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output);

-- MUX_uxn_opcodes_h_l2956_c29_5178
MUX_uxn_opcodes_h_l2956_c29_5178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2956_c29_5178_cond,
MUX_uxn_opcodes_h_l2956_c29_5178_iftrue,
MUX_uxn_opcodes_h_l2956_c29_5178_iffalse,
MUX_uxn_opcodes_h_l2956_c29_5178_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc
BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left,
BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right,
BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output);

-- MUX_uxn_opcodes_h_l2957_c20_da4c
MUX_uxn_opcodes_h_l2957_c20_da4c : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2957_c20_da4c_cond,
MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue,
MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse,
MUX_uxn_opcodes_h_l2957_c20_da4c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7
BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7 : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left,
BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right,
BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output);

-- stack_ram_update_uxn_opcodes_h_l2959_c24_adcd
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address,
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value,
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable,
stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_ram_read,
 previous_device_ram_read,
 -- Registers
 sp0,
 sp1,
 ins_a_3f,
 opc,
 stack_index,
 is_wait,
 is_imm,
 stack_address,
 previous_stack_read,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output,
 MUX_uxn_opcodes_h_l2869_c14_1b59_return_output,
 MUX_uxn_opcodes_h_l2870_c8_29f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output,
 is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output,
 brk_uxn_opcodes_h_l2876_c48_bea0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output,
 jci_uxn_opcodes_h_l2877_c40_efb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output,
 jmi_uxn_opcodes_h_l2878_c40_4c75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output,
 jsi_uxn_opcodes_h_l2879_c40_14c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output,
 lit_uxn_opcodes_h_l2880_c40_c733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output,
 lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output,
 lit_uxn_opcodes_h_l2882_c40_dc08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output,
 lit2_uxn_opcodes_h_l2883_c40_37c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output,
 inc_uxn_opcodes_h_l2884_c40_b2db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output,
 inc2_uxn_opcodes_h_l2885_c40_40b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output,
 pop_uxn_opcodes_h_l2886_c40_b641_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output,
 pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output,
 nip_uxn_opcodes_h_l2888_c40_294b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output,
 nip2_uxn_opcodes_h_l2889_c40_b45a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output,
 swp_uxn_opcodes_h_l2890_c40_bf14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output,
 swp2_uxn_opcodes_h_l2891_c40_744a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output,
 rot_uxn_opcodes_h_l2892_c40_2905_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output,
 rot2_uxn_opcodes_h_l2893_c40_2b69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output,
 dup_uxn_opcodes_h_l2894_c40_b463_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output,
 dup2_uxn_opcodes_h_l2895_c40_56bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output,
 ovr_uxn_opcodes_h_l2896_c40_e535_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output,
 ovr2_uxn_opcodes_h_l2897_c40_465f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output,
 equ_uxn_opcodes_h_l2898_c40_5d63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output,
 equ2_uxn_opcodes_h_l2899_c40_9c12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output,
 neq_uxn_opcodes_h_l2900_c40_7a50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output,
 neq2_uxn_opcodes_h_l2901_c40_5da1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output,
 gth_uxn_opcodes_h_l2902_c40_2141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output,
 gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output,
 lth_uxn_opcodes_h_l2904_c40_dd83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output,
 lth2_uxn_opcodes_h_l2905_c40_8898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output,
 jmp_uxn_opcodes_h_l2906_c40_5304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output,
 jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output,
 jcn_uxn_opcodes_h_l2908_c40_5117_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output,
 jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output,
 jsr_uxn_opcodes_h_l2910_c40_7591_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output,
 jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output,
 sth_uxn_opcodes_h_l2912_c40_d8a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output,
 sth2_uxn_opcodes_h_l2913_c40_44f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output,
 ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output,
 ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output,
 stz_uxn_opcodes_h_l2916_c40_6249_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output,
 stz2_uxn_opcodes_h_l2917_c40_1728_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output,
 ldr_uxn_opcodes_h_l2918_c40_aa52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output,
 ldr2_uxn_opcodes_h_l2919_c40_842a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output,
 str1_uxn_opcodes_h_l2920_c40_c3d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output,
 str2_uxn_opcodes_h_l2921_c40_9f97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output,
 lda_uxn_opcodes_h_l2922_c40_bd07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output,
 lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output,
 sta_uxn_opcodes_h_l2924_c40_b667_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output,
 sta2_uxn_opcodes_h_l2925_c40_418d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output,
 dei_uxn_opcodes_h_l2926_c40_551f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output,
 dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output,
 deo_uxn_opcodes_h_l2928_c40_6751_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output,
 deo2_uxn_opcodes_h_l2929_c40_34ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output,
 add_uxn_opcodes_h_l2930_c40_d059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output,
 add2_uxn_opcodes_h_l2931_c40_6c17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output,
 sub_uxn_opcodes_h_l2932_c40_6a6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output,
 sub2_uxn_opcodes_h_l2933_c40_8c47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output,
 mul_uxn_opcodes_h_l2934_c40_473b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output,
 mul2_uxn_opcodes_h_l2935_c40_12e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output,
 div_uxn_opcodes_h_l2936_c40_88bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output,
 div2_uxn_opcodes_h_l2937_c40_7e3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output,
 and_uxn_opcodes_h_l2938_c40_2637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output,
 and2_uxn_opcodes_h_l2939_c40_50e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output,
 ora_uxn_opcodes_h_l2940_c40_b128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output,
 ora2_uxn_opcodes_h_l2941_c40_1f35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output,
 eor_uxn_opcodes_h_l2942_c40_2405_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output,
 eor2_uxn_opcodes_h_l2943_c40_7a78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output,
 sft_uxn_opcodes_h_l2944_c40_0377_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output,
 sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output,
 CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output,
 sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output,
 sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output,
 MUX_uxn_opcodes_h_l2956_c29_5178_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output,
 MUX_uxn_opcodes_h_l2957_c20_da4c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output,
 stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2876_c48_bea0_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2876_c48_bea0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2877_c40_efb9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2880_c40_c733_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2880_c40_c733_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2880_c40_c733_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2882_c40_dc08_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2882_c40_dc08_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2882_c40_dc08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2884_c40_b2db_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2884_c40_b2db_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2884_c40_b2db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2886_c40_b641_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2886_c40_b641_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2886_c40_b641_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2888_c40_294b_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2888_c40_294b_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2888_c40_294b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2890_c40_bf14_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2890_c40_bf14_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2890_c40_bf14_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2891_c40_744a_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2891_c40_744a_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2891_c40_744a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2892_c40_2905_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2892_c40_2905_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2892_c40_2905_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2894_c40_b463_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2894_c40_b463_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2894_c40_b463_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2896_c40_e535_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2896_c40_e535_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2896_c40_e535_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2898_c40_5d63_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2898_c40_5d63_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2898_c40_5d63_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2900_c40_7a50_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2900_c40_7a50_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2900_c40_7a50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2902_c40_2141_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2902_c40_2141_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2902_c40_2141_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2904_c40_dd83_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2904_c40_dd83_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2904_c40_dd83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2905_c40_8898_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2905_c40_8898_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2905_c40_8898_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2906_c40_5304_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2908_c40_5117_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2910_c40_7591_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2916_c40_6249_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2916_c40_6249_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2916_c40_6249_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2917_c40_1728_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2917_c40_1728_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2917_c40_1728_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2921_c40_9f97_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2922_c40_bd07_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2924_c40_b667_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2924_c40_b667_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2924_c40_b667_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2925_c40_418d_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2925_c40_418d_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2925_c40_418d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2926_c40_551f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2928_c40_6751_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2930_c40_d059_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2930_c40_d059_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2930_c40_d059_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2931_c40_6c17_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2931_c40_6c17_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2931_c40_6c17_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2934_c40_473b_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2934_c40_473b_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2934_c40_473b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2936_c40_88bc_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2936_c40_88bc_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2936_c40_88bc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2938_c40_2637_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2938_c40_2637_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2938_c40_2637_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2939_c40_50e1_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2939_c40_50e1_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2939_c40_50e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2940_c40_b128_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2940_c40_b128_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2940_c40_b128_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2942_c40_2405_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2942_c40_2405_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2942_c40_2405_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2944_c40_0377_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2944_c40_0377_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2944_c40_0377_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2947_c2_c9be : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2948_c17_ea74_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2951_c3_3a08 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2953_c3_4794 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2956_c29_5178_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2956_c29_5178_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c19_58e4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2956_c68_fb12_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c58_4232_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_c3_6c83_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2966_c39_1beb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2967_c40_69fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2968_c34_857f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2969_c30_8bfe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2970_c33_a566_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2971_c34_d2b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2972_c37_4ca1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2974_c32_3120_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2951_l2953_DUPLICATE_e2da_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2953_l2951_DUPLICATE_8620_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2961_l2973_DUPLICATE_db54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2853_l2976_DUPLICATE_de91_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_ins_a_3f : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_is_imm : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(8 downto 0);
variable REG_VAR_previous_stack_read : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_ins_a_3f := ins_a_3f;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_is_imm := is_imm;
  REG_VAR_stack_address := stack_address;
  REG_VAR_previous_stack_read := previous_stack_read;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right := to_unsigned(12, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right := to_unsigned(29, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right := to_unsigned(6, 8);
     VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right := to_unsigned(46, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right := to_unsigned(37, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right := to_unsigned(36, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right := to_unsigned(15, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right := to_unsigned(21, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right := to_unsigned(39, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right := to_unsigned(41, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right := to_unsigned(23, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right := to_unsigned(22, 8);
     VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right := to_unsigned(59, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right := to_unsigned(47, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right := to_unsigned(223, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right := to_unsigned(11, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right := to_unsigned(54, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right := to_unsigned(48, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right := to_unsigned(9, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right := to_unsigned(17, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right := to_unsigned(28, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right := to_unsigned(160, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right := to_unsigned(27, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2931_c40_6c17_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2930_c40_d059_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2939_c40_50e1_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2938_c40_2637_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2936_c40_88bc_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2894_c40_b463_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2942_c40_2405_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2898_c40_5d63_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2902_c40_2141_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2884_c40_b2db_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2905_c40_8898_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2904_c40_dd83_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2934_c40_473b_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2900_c40_7a50_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2888_c40_294b_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2940_c40_b128_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2896_c40_e535_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2886_c40_b641_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2892_c40_2905_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2944_c40_0377_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2925_c40_418d_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2924_c40_b667_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2917_c40_1728_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2916_c40_6249_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2891_c40_744a_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2890_c40_bf14_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2880_c40_c733_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2882_c40_dc08_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2931_c40_6c17_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2930_c40_d059_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2939_c40_50e1_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2938_c40_2637_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2876_c48_bea0_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2936_c40_88bc_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2894_c40_b463_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2942_c40_2405_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2898_c40_5d63_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2902_c40_2141_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2884_c40_b2db_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2880_c40_c733_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2882_c40_dc08_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2905_c40_8898_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2904_c40_dd83_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2934_c40_473b_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2900_c40_7a50_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2888_c40_294b_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2940_c40_b128_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2896_c40_e535_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2886_c40_b641_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2892_c40_2905_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2944_c40_0377_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2925_c40_418d_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2924_c40_b667_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2917_c40_1728_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2916_c40_6249_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2891_c40_744a_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2890_c40_bf14_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2876_c48_bea0] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2876_c48_bea0_phase <= VAR_brk_uxn_opcodes_h_l2876_c48_bea0_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2876_c48_bea0_return_output := brk_uxn_opcodes_h_l2876_c48_bea0_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2947_c16_f65b] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output := CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2868_c14_0427] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_left;
     BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output := BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output;
     VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2868_c14_0427_return_output;
     VAR_stack_index_uxn_opcodes_h_l2947_c2_c9be := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2947_c16_f65b_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue := VAR_brk_uxn_opcodes_h_l2876_c48_bea0_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left := VAR_stack_index_uxn_opcodes_h_l2947_c2_c9be;
     -- BIN_OP_XOR[uxn_opcodes_h_l2869_c14_a5a2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_left;
     BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output := BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2869_c14_a5a2_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2869_c14_b071] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_left;
     BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output := BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2869_c14_b071_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2869_c14_ef30] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2869_c14_ef30_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2869_c14_591e] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2869_c14_591e_return_output;
     -- MUX[uxn_opcodes_h_l2869_c14_1b59] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2869_c14_1b59_cond <= VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_cond;
     MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue <= VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iftrue;
     MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse <= VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_return_output := MUX_uxn_opcodes_h_l2869_c14_1b59_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_cond := VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2869_c14_1b59_return_output;
     -- MUX[uxn_opcodes_h_l2870_c8_29f6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2870_c8_29f6_cond <= VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_cond;
     MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue <= VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iftrue;
     MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse <= VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output := MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2870_c8_29f6_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_1a69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_50d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_560b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_69b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4e16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_f185] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_7862] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_9b28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_421d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_3cde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_38d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_f822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_59e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_f33f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_4431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_29a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_d0ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_0d4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_aaf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_ea6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_f0b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_5fcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_3621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f329] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_6758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_dcf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c6_a431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_5635] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_ab28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_1c9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_d2d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ea83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_3d9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ecf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_a58a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_90fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_521c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_77b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8efb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_5d46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5ce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_dfb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_7f85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_7942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_5f61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_d548] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_a8d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_73e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_d0d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_108a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_191d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_369c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_6d7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_6a22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_0d88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_0000] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_5d24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f7b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_11d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2859] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_957d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1cf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_d472] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_2005] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_b452] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_2738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_ddf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_9564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_8581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c6_a431_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0d4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_3d9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_77b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_ea6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_ddf7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b452_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8581_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_0000_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7942_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_7862_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5d24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_d0ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5ce2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f185_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_108a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_59e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f7b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_5d46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6a22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_5635_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8efb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2005_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_f33f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_50d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ecf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_0d88_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_6758_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a8d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1a69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_3621_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_38d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_560b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_3cde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_aaf2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_d2d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_191d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2859_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_90fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_421d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_69b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_7f85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2ec6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_5fcf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_4431_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_11d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_73e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_29a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_6d7f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_a58a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ab28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_521c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_2738_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_d0d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_957d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_f822_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f329_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ea83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_d548_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_5f61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_f0b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_dcf1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_369c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_9b28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_1c9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_dfb2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_d472_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2876_c2_3f7b] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond;
     is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output := is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_13f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_b570] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_7c25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_b570_return_output;
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7c25_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2878] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_2f50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output;

     -- jci[uxn_opcodes_h_l2877_c40_efb9] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2877_c40_efb9_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2877_c40_efb9_phase <= VAR_jci_uxn_opcodes_h_l2877_c40_efb9_phase;
     jci_uxn_opcodes_h_l2877_c40_efb9_pc <= VAR_jci_uxn_opcodes_h_l2877_c40_efb9_pc;
     jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_stack_read;
     jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2877_c40_efb9_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2877_c40_efb9_return_output := jci_uxn_opcodes_h_l2877_c40_efb9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output;
     VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2878_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue := VAR_jci_uxn_opcodes_h_l2877_c40_efb9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_b387] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output;

     -- jmi[uxn_opcodes_h_l2878_c40_4c75] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2878_c40_4c75_phase <= VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_phase;
     jmi_uxn_opcodes_h_l2878_c40_4c75_pc <= VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_pc;
     jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_return_output := jmi_uxn_opcodes_h_l2878_c40_4c75_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_f254] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_b387_return_output;
     VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_f254_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue := VAR_jmi_uxn_opcodes_h_l2878_c40_4c75_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_df55] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output;

     -- jsi[uxn_opcodes_h_l2879_c40_14c6] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2879_c40_14c6_phase <= VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_phase;
     jsi_uxn_opcodes_h_l2879_c40_14c6_pc <= VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_pc;
     jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_return_output := jsi_uxn_opcodes_h_l2879_c40_14c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_d184] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_df55_return_output;
     VAR_lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_d184_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue := VAR_jsi_uxn_opcodes_h_l2879_c40_14c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_fcc7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_82af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output;

     -- lit[uxn_opcodes_h_l2880_c40_c733] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2880_c40_c733_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2880_c40_c733_phase <= VAR_lit_uxn_opcodes_h_l2880_c40_c733_phase;
     lit_uxn_opcodes_h_l2880_c40_c733_pc <= VAR_lit_uxn_opcodes_h_l2880_c40_c733_pc;
     lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2880_c40_c733_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2880_c40_c733_return_output := lit_uxn_opcodes_h_l2880_c40_c733_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_82af_return_output;
     VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_fcc7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue := VAR_lit_uxn_opcodes_h_l2880_c40_c733_return_output;
     -- lit2[uxn_opcodes_h_l2881_c40_5bcd] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2881_c40_5bcd_phase <= VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_phase;
     lit2_uxn_opcodes_h_l2881_c40_5bcd_pc <= VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_pc;
     lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output := lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_5f74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_0edd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output;
     VAR_lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_5f74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue := VAR_lit2_uxn_opcodes_h_l2881_c40_5bcd_return_output;
     -- lit[uxn_opcodes_h_l2882_c40_dc08] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2882_c40_dc08_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2882_c40_dc08_phase <= VAR_lit_uxn_opcodes_h_l2882_c40_dc08_phase;
     lit_uxn_opcodes_h_l2882_c40_dc08_pc <= VAR_lit_uxn_opcodes_h_l2882_c40_dc08_pc;
     lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2882_c40_dc08_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2882_c40_dc08_return_output := lit_uxn_opcodes_h_l2882_c40_dc08_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_1462] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_faaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output;
     VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1462_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue := VAR_lit_uxn_opcodes_h_l2882_c40_dc08_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_3771] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output;

     -- lit2[uxn_opcodes_h_l2883_c40_37c9] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2883_c40_37c9_phase <= VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_phase;
     lit2_uxn_opcodes_h_l2883_c40_37c9_pc <= VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_pc;
     lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_return_output := lit2_uxn_opcodes_h_l2883_c40_37c9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_6965] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_3771_return_output;
     VAR_inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6965_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue := VAR_lit2_uxn_opcodes_h_l2883_c40_37c9_return_output;
     -- inc[uxn_opcodes_h_l2884_c40_b2db] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2884_c40_b2db_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2884_c40_b2db_phase <= VAR_inc_uxn_opcodes_h_l2884_c40_b2db_phase;
     inc_uxn_opcodes_h_l2884_c40_b2db_ins <= VAR_inc_uxn_opcodes_h_l2884_c40_b2db_ins;
     inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2884_c40_b2db_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2884_c40_b2db_return_output := inc_uxn_opcodes_h_l2884_c40_b2db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_17a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_63db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output;
     VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_63db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue := VAR_inc_uxn_opcodes_h_l2884_c40_b2db_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_8d7a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_41ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output;

     -- inc2[uxn_opcodes_h_l2885_c40_40b7] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2885_c40_40b7_phase <= VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_phase;
     inc2_uxn_opcodes_h_l2885_c40_40b7_ins <= VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_ins;
     inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_return_output := inc2_uxn_opcodes_h_l2885_c40_40b7_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output;
     VAR_pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_8d7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue := VAR_inc2_uxn_opcodes_h_l2885_c40_40b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_5fea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_e3a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output;

     -- pop[uxn_opcodes_h_l2886_c40_b641] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2886_c40_b641_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2886_c40_b641_phase <= VAR_pop_uxn_opcodes_h_l2886_c40_b641_phase;
     pop_uxn_opcodes_h_l2886_c40_b641_ins <= VAR_pop_uxn_opcodes_h_l2886_c40_b641_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2886_c40_b641_return_output := pop_uxn_opcodes_h_l2886_c40_b641_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output;
     VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_5fea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue := VAR_pop_uxn_opcodes_h_l2886_c40_b641_return_output;
     -- pop2[uxn_opcodes_h_l2887_c40_c8a9] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2887_c40_c8a9_phase <= VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_phase;
     pop2_uxn_opcodes_h_l2887_c40_c8a9_ins <= VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output := pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_f0dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_7df0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output;
     VAR_nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_f0dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue := VAR_pop2_uxn_opcodes_h_l2887_c40_c8a9_return_output;
     -- nip[uxn_opcodes_h_l2888_c40_294b] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2888_c40_294b_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2888_c40_294b_phase <= VAR_nip_uxn_opcodes_h_l2888_c40_294b_phase;
     nip_uxn_opcodes_h_l2888_c40_294b_ins <= VAR_nip_uxn_opcodes_h_l2888_c40_294b_ins;
     nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2888_c40_294b_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2888_c40_294b_return_output := nip_uxn_opcodes_h_l2888_c40_294b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_e52e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_a6be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output;
     VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_a6be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue := VAR_nip_uxn_opcodes_h_l2888_c40_294b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_bb6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_7ff2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output;

     -- nip2[uxn_opcodes_h_l2889_c40_b45a] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2889_c40_b45a_phase <= VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_phase;
     nip2_uxn_opcodes_h_l2889_c40_b45a_ins <= VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_ins;
     nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_return_output := nip2_uxn_opcodes_h_l2889_c40_b45a_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output;
     VAR_swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7ff2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue := VAR_nip2_uxn_opcodes_h_l2889_c40_b45a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_3839] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_871c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output;

     -- swp[uxn_opcodes_h_l2890_c40_bf14] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2890_c40_bf14_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2890_c40_bf14_phase <= VAR_swp_uxn_opcodes_h_l2890_c40_bf14_phase;
     swp_uxn_opcodes_h_l2890_c40_bf14_ins <= VAR_swp_uxn_opcodes_h_l2890_c40_bf14_ins;
     swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2890_c40_bf14_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2890_c40_bf14_return_output := swp_uxn_opcodes_h_l2890_c40_bf14_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_3839_return_output;
     VAR_swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_871c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue := VAR_swp_uxn_opcodes_h_l2890_c40_bf14_return_output;
     -- swp2[uxn_opcodes_h_l2891_c40_744a] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2891_c40_744a_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2891_c40_744a_phase <= VAR_swp2_uxn_opcodes_h_l2891_c40_744a_phase;
     swp2_uxn_opcodes_h_l2891_c40_744a_ins <= VAR_swp2_uxn_opcodes_h_l2891_c40_744a_ins;
     swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2891_c40_744a_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2891_c40_744a_return_output := swp2_uxn_opcodes_h_l2891_c40_744a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_0adc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_6763] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output;
     VAR_rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6763_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue := VAR_swp2_uxn_opcodes_h_l2891_c40_744a_return_output;
     -- rot[uxn_opcodes_h_l2892_c40_2905] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2892_c40_2905_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2892_c40_2905_phase <= VAR_rot_uxn_opcodes_h_l2892_c40_2905_phase;
     rot_uxn_opcodes_h_l2892_c40_2905_ins <= VAR_rot_uxn_opcodes_h_l2892_c40_2905_ins;
     rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2892_c40_2905_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2892_c40_2905_return_output := rot_uxn_opcodes_h_l2892_c40_2905_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_37f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_88f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output;
     VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_37f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue := VAR_rot_uxn_opcodes_h_l2892_c40_2905_return_output;
     -- rot2[uxn_opcodes_h_l2893_c40_2b69] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2893_c40_2b69_phase <= VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_phase;
     rot2_uxn_opcodes_h_l2893_c40_2b69_ins <= VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_ins;
     rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_return_output := rot2_uxn_opcodes_h_l2893_c40_2b69_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_4b4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_5a30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output;
     VAR_dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_5a30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue := VAR_rot2_uxn_opcodes_h_l2893_c40_2b69_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_da36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output;

     -- dup[uxn_opcodes_h_l2894_c40_b463] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2894_c40_b463_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2894_c40_b463_phase <= VAR_dup_uxn_opcodes_h_l2894_c40_b463_phase;
     dup_uxn_opcodes_h_l2894_c40_b463_ins <= VAR_dup_uxn_opcodes_h_l2894_c40_b463_ins;
     dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2894_c40_b463_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2894_c40_b463_return_output := dup_uxn_opcodes_h_l2894_c40_b463_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_3dd1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_da36_return_output;
     VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_3dd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue := VAR_dup_uxn_opcodes_h_l2894_c40_b463_return_output;
     -- dup2[uxn_opcodes_h_l2895_c40_56bb] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2895_c40_56bb_phase <= VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_phase;
     dup2_uxn_opcodes_h_l2895_c40_56bb_ins <= VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_ins;
     dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_return_output := dup2_uxn_opcodes_h_l2895_c40_56bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_bd25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_28c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output;
     VAR_ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_bd25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue := VAR_dup2_uxn_opcodes_h_l2895_c40_56bb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_3fa4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output;

     -- ovr[uxn_opcodes_h_l2896_c40_e535] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2896_c40_e535_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2896_c40_e535_phase <= VAR_ovr_uxn_opcodes_h_l2896_c40_e535_phase;
     ovr_uxn_opcodes_h_l2896_c40_e535_ins <= VAR_ovr_uxn_opcodes_h_l2896_c40_e535_ins;
     ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2896_c40_e535_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2896_c40_e535_return_output := ovr_uxn_opcodes_h_l2896_c40_e535_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_6cd0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output;
     VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_6cd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue := VAR_ovr_uxn_opcodes_h_l2896_c40_e535_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_5dcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output;

     -- ovr2[uxn_opcodes_h_l2897_c40_465f] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2897_c40_465f_phase <= VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_phase;
     ovr2_uxn_opcodes_h_l2897_c40_465f_ins <= VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_ins;
     ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_return_output := ovr2_uxn_opcodes_h_l2897_c40_465f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_f5b8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output;
     VAR_equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_5dcd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue := VAR_ovr2_uxn_opcodes_h_l2897_c40_465f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_38b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_e97d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output;

     -- equ[uxn_opcodes_h_l2898_c40_5d63] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2898_c40_5d63_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2898_c40_5d63_phase <= VAR_equ_uxn_opcodes_h_l2898_c40_5d63_phase;
     equ_uxn_opcodes_h_l2898_c40_5d63_ins <= VAR_equ_uxn_opcodes_h_l2898_c40_5d63_ins;
     equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2898_c40_5d63_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2898_c40_5d63_return_output := equ_uxn_opcodes_h_l2898_c40_5d63_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output;
     VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_38b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue := VAR_equ_uxn_opcodes_h_l2898_c40_5d63_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_ebe2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_0789] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output;

     -- equ2[uxn_opcodes_h_l2899_c40_9c12] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2899_c40_9c12_phase <= VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_phase;
     equ2_uxn_opcodes_h_l2899_c40_9c12_ins <= VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_ins;
     equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_return_output := equ2_uxn_opcodes_h_l2899_c40_9c12_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output;
     VAR_neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_0789_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue := VAR_equ2_uxn_opcodes_h_l2899_c40_9c12_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_a660] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output;

     -- neq[uxn_opcodes_h_l2900_c40_7a50] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2900_c40_7a50_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2900_c40_7a50_phase <= VAR_neq_uxn_opcodes_h_l2900_c40_7a50_phase;
     neq_uxn_opcodes_h_l2900_c40_7a50_ins <= VAR_neq_uxn_opcodes_h_l2900_c40_7a50_ins;
     neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2900_c40_7a50_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2900_c40_7a50_return_output := neq_uxn_opcodes_h_l2900_c40_7a50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_4ef7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_a660_return_output;
     VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_4ef7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue := VAR_neq_uxn_opcodes_h_l2900_c40_7a50_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_fc70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_faaf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output;

     -- neq2[uxn_opcodes_h_l2901_c40_5da1] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2901_c40_5da1_phase <= VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_phase;
     neq2_uxn_opcodes_h_l2901_c40_5da1_ins <= VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_ins;
     neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_return_output := neq2_uxn_opcodes_h_l2901_c40_5da1_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output;
     VAR_gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_faaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue := VAR_neq2_uxn_opcodes_h_l2901_c40_5da1_return_output;
     -- gth[uxn_opcodes_h_l2902_c40_2141] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2902_c40_2141_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2902_c40_2141_phase <= VAR_gth_uxn_opcodes_h_l2902_c40_2141_phase;
     gth_uxn_opcodes_h_l2902_c40_2141_ins <= VAR_gth_uxn_opcodes_h_l2902_c40_2141_ins;
     gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2902_c40_2141_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2902_c40_2141_return_output := gth_uxn_opcodes_h_l2902_c40_2141_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ac79] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_a6a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output;
     VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue := VAR_gth_uxn_opcodes_h_l2902_c40_2141_return_output;
     -- gth2[uxn_opcodes_h_l2903_c40_3dc0] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2903_c40_3dc0_phase <= VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_phase;
     gth2_uxn_opcodes_h_l2903_c40_3dc0_ins <= VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_ins;
     gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output := gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_fc21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1e64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output;
     VAR_lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1e64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue := VAR_gth2_uxn_opcodes_h_l2903_c40_3dc0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_4337] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_0752] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output;

     -- lth[uxn_opcodes_h_l2904_c40_dd83] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2904_c40_dd83_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2904_c40_dd83_phase <= VAR_lth_uxn_opcodes_h_l2904_c40_dd83_phase;
     lth_uxn_opcodes_h_l2904_c40_dd83_ins <= VAR_lth_uxn_opcodes_h_l2904_c40_dd83_ins;
     lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2904_c40_dd83_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2904_c40_dd83_return_output := lth_uxn_opcodes_h_l2904_c40_dd83_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0752_return_output;
     VAR_lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4337_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue := VAR_lth_uxn_opcodes_h_l2904_c40_dd83_return_output;
     -- lth2[uxn_opcodes_h_l2905_c40_8898] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2905_c40_8898_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2905_c40_8898_phase <= VAR_lth2_uxn_opcodes_h_l2905_c40_8898_phase;
     lth2_uxn_opcodes_h_l2905_c40_8898_ins <= VAR_lth2_uxn_opcodes_h_l2905_c40_8898_ins;
     lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2905_c40_8898_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2905_c40_8898_return_output := lth2_uxn_opcodes_h_l2905_c40_8898_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_2ee4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_fb1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output;
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fb1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue := VAR_lth2_uxn_opcodes_h_l2905_c40_8898_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_cb41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output;

     -- jmp[uxn_opcodes_h_l2906_c40_5304] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2906_c40_5304_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2906_c40_5304_phase <= VAR_jmp_uxn_opcodes_h_l2906_c40_5304_phase;
     jmp_uxn_opcodes_h_l2906_c40_5304_ins <= VAR_jmp_uxn_opcodes_h_l2906_c40_5304_ins;
     jmp_uxn_opcodes_h_l2906_c40_5304_pc <= VAR_jmp_uxn_opcodes_h_l2906_c40_5304_pc;
     jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2906_c40_5304_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2906_c40_5304_return_output := jmp_uxn_opcodes_h_l2906_c40_5304_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_214f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_214f_return_output;
     VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_cb41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue := VAR_jmp_uxn_opcodes_h_l2906_c40_5304_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_3875] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_33bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output;

     -- jmp2[uxn_opcodes_h_l2907_c40_cad5] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2907_c40_cad5_phase <= VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_phase;
     jmp2_uxn_opcodes_h_l2907_c40_cad5_ins <= VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_ins;
     jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output := jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_3875_return_output;
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_33bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue := VAR_jmp2_uxn_opcodes_h_l2907_c40_cad5_return_output;
     -- jcn[uxn_opcodes_h_l2908_c40_5117] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2908_c40_5117_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2908_c40_5117_phase <= VAR_jcn_uxn_opcodes_h_l2908_c40_5117_phase;
     jcn_uxn_opcodes_h_l2908_c40_5117_ins <= VAR_jcn_uxn_opcodes_h_l2908_c40_5117_ins;
     jcn_uxn_opcodes_h_l2908_c40_5117_pc <= VAR_jcn_uxn_opcodes_h_l2908_c40_5117_pc;
     jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2908_c40_5117_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2908_c40_5117_return_output := jcn_uxn_opcodes_h_l2908_c40_5117_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_ef9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_ce40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output;
     VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_ef9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue := VAR_jcn_uxn_opcodes_h_l2908_c40_5117_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_e926] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_7fbd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output;

     -- jcn2[uxn_opcodes_h_l2909_c40_a66f] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2909_c40_a66f_phase <= VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_phase;
     jcn2_uxn_opcodes_h_l2909_c40_a66f_ins <= VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_ins;
     jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output := jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_e926_return_output;
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_7fbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue := VAR_jcn2_uxn_opcodes_h_l2909_c40_a66f_return_output;
     -- jsr[uxn_opcodes_h_l2910_c40_7591] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2910_c40_7591_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2910_c40_7591_phase <= VAR_jsr_uxn_opcodes_h_l2910_c40_7591_phase;
     jsr_uxn_opcodes_h_l2910_c40_7591_ins <= VAR_jsr_uxn_opcodes_h_l2910_c40_7591_ins;
     jsr_uxn_opcodes_h_l2910_c40_7591_pc <= VAR_jsr_uxn_opcodes_h_l2910_c40_7591_pc;
     jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2910_c40_7591_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2910_c40_7591_return_output := jsr_uxn_opcodes_h_l2910_c40_7591_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_524a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_c2d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_524a_return_output;
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c2d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue := VAR_jsr_uxn_opcodes_h_l2910_c40_7591_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_5088] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_9a4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output;

     -- jsr2[uxn_opcodes_h_l2911_c40_49d0] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2911_c40_49d0_phase <= VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_phase;
     jsr2_uxn_opcodes_h_l2911_c40_49d0_ins <= VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_ins;
     jsr2_uxn_opcodes_h_l2911_c40_49d0_pc <= VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_pc;
     jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output := jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_5088_return_output;
     VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_9a4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue := VAR_jsr2_uxn_opcodes_h_l2911_c40_49d0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_45a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output;

     -- sth[uxn_opcodes_h_l2912_c40_d8a9] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2912_c40_d8a9_phase <= VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_phase;
     sth_uxn_opcodes_h_l2912_c40_d8a9_ins <= VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_ins;
     sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_return_output := sth_uxn_opcodes_h_l2912_c40_d8a9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_8233] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_8233_return_output;
     VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_45a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue := VAR_sth_uxn_opcodes_h_l2912_c40_d8a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_55a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_6a07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output;

     -- sth2[uxn_opcodes_h_l2913_c40_44f7] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2913_c40_44f7_phase <= VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_phase;
     sth2_uxn_opcodes_h_l2913_c40_44f7_ins <= VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_ins;
     sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_return_output := sth2_uxn_opcodes_h_l2913_c40_44f7_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output;
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_55a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue := VAR_sth2_uxn_opcodes_h_l2913_c40_44f7_return_output;
     -- ldz[uxn_opcodes_h_l2914_c40_c5ed] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2914_c40_c5ed_phase <= VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_phase;
     ldz_uxn_opcodes_h_l2914_c40_c5ed_ins <= VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_ins;
     ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_stack_read;
     ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output := ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_4786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_acad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_4786_return_output;
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_acad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue := VAR_ldz_uxn_opcodes_h_l2914_c40_c5ed_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8ef8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_b675] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output;

     -- ldz2[uxn_opcodes_h_l2915_c40_acb0] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2915_c40_acb0_phase <= VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_phase;
     ldz2_uxn_opcodes_h_l2915_c40_acb0_ins <= VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_ins;
     ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_stack_read;
     ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output := ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output;
     VAR_stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_b675_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue := VAR_ldz2_uxn_opcodes_h_l2915_c40_acb0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7def] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_11ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output;

     -- stz[uxn_opcodes_h_l2916_c40_6249] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2916_c40_6249_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2916_c40_6249_phase <= VAR_stz_uxn_opcodes_h_l2916_c40_6249_phase;
     stz_uxn_opcodes_h_l2916_c40_6249_ins <= VAR_stz_uxn_opcodes_h_l2916_c40_6249_ins;
     stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2916_c40_6249_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2916_c40_6249_return_output := stz_uxn_opcodes_h_l2916_c40_6249_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output;
     VAR_stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7def_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue := VAR_stz_uxn_opcodes_h_l2916_c40_6249_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_67ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output;

     -- stz2[uxn_opcodes_h_l2917_c40_1728] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2917_c40_1728_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2917_c40_1728_phase <= VAR_stz2_uxn_opcodes_h_l2917_c40_1728_phase;
     stz2_uxn_opcodes_h_l2917_c40_1728_ins <= VAR_stz2_uxn_opcodes_h_l2917_c40_1728_ins;
     stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2917_c40_1728_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2917_c40_1728_return_output := stz2_uxn_opcodes_h_l2917_c40_1728_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_67a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output;
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_67a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue := VAR_stz2_uxn_opcodes_h_l2917_c40_1728_return_output;
     -- ldr[uxn_opcodes_h_l2918_c40_aa52] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2918_c40_aa52_phase <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_phase;
     ldr_uxn_opcodes_h_l2918_c40_aa52_ins <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_ins;
     ldr_uxn_opcodes_h_l2918_c40_aa52_pc <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_pc;
     ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_stack_read;
     ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_return_output := ldr_uxn_opcodes_h_l2918_c40_aa52_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_3a29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_085d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output;
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_085d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue := VAR_ldr_uxn_opcodes_h_l2918_c40_aa52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_5730] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_7afd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output;

     -- ldr2[uxn_opcodes_h_l2919_c40_842a] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2919_c40_842a_phase <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_phase;
     ldr2_uxn_opcodes_h_l2919_c40_842a_ins <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_ins;
     ldr2_uxn_opcodes_h_l2919_c40_842a_pc <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_pc;
     ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_stack_read;
     ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_return_output := ldr2_uxn_opcodes_h_l2919_c40_842a_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output;
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_5730_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue := VAR_ldr2_uxn_opcodes_h_l2919_c40_842a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_b431] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_59af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output;

     -- str1[uxn_opcodes_h_l2920_c40_c3d7] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2920_c40_c3d7_phase <= VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_phase;
     str1_uxn_opcodes_h_l2920_c40_c3d7_ins <= VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_ins;
     str1_uxn_opcodes_h_l2920_c40_c3d7_pc <= VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_pc;
     str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_return_output := str1_uxn_opcodes_h_l2920_c40_c3d7_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_b431_return_output;
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_59af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue := VAR_str1_uxn_opcodes_h_l2920_c40_c3d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_581d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_af3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output;

     -- str2[uxn_opcodes_h_l2921_c40_9f97] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2921_c40_9f97_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2921_c40_9f97_phase <= VAR_str2_uxn_opcodes_h_l2921_c40_9f97_phase;
     str2_uxn_opcodes_h_l2921_c40_9f97_ins <= VAR_str2_uxn_opcodes_h_l2921_c40_9f97_ins;
     str2_uxn_opcodes_h_l2921_c40_9f97_pc <= VAR_str2_uxn_opcodes_h_l2921_c40_9f97_pc;
     str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2921_c40_9f97_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2921_c40_9f97_return_output := str2_uxn_opcodes_h_l2921_c40_9f97_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_581d_return_output;
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_af3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue := VAR_str2_uxn_opcodes_h_l2921_c40_9f97_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_11ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_5393] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output;

     -- lda[uxn_opcodes_h_l2922_c40_bd07] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2922_c40_bd07_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2922_c40_bd07_phase <= VAR_lda_uxn_opcodes_h_l2922_c40_bd07_phase;
     lda_uxn_opcodes_h_l2922_c40_bd07_ins <= VAR_lda_uxn_opcodes_h_l2922_c40_bd07_ins;
     lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_stack_read;
     lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2922_c40_bd07_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2922_c40_bd07_return_output := lda_uxn_opcodes_h_l2922_c40_bd07_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_5393_return_output;
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_11ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue := VAR_lda_uxn_opcodes_h_l2922_c40_bd07_return_output;
     -- lda2[uxn_opcodes_h_l2923_c40_6d1b] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2923_c40_6d1b_phase <= VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_phase;
     lda2_uxn_opcodes_h_l2923_c40_6d1b_ins <= VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_ins;
     lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_stack_read;
     lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output := lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_e3e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_59d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output;
     VAR_sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e3e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue := VAR_lda2_uxn_opcodes_h_l2923_c40_6d1b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_f943] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_95b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output;

     -- sta[uxn_opcodes_h_l2924_c40_b667] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2924_c40_b667_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2924_c40_b667_phase <= VAR_sta_uxn_opcodes_h_l2924_c40_b667_phase;
     sta_uxn_opcodes_h_l2924_c40_b667_ins <= VAR_sta_uxn_opcodes_h_l2924_c40_b667_ins;
     sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2924_c40_b667_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2924_c40_b667_return_output := sta_uxn_opcodes_h_l2924_c40_b667_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_f943_return_output;
     VAR_sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_95b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue := VAR_sta_uxn_opcodes_h_l2924_c40_b667_return_output;
     -- sta2[uxn_opcodes_h_l2925_c40_418d] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2925_c40_418d_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2925_c40_418d_phase <= VAR_sta2_uxn_opcodes_h_l2925_c40_418d_phase;
     sta2_uxn_opcodes_h_l2925_c40_418d_ins <= VAR_sta2_uxn_opcodes_h_l2925_c40_418d_ins;
     sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2925_c40_418d_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2925_c40_418d_return_output := sta2_uxn_opcodes_h_l2925_c40_418d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_28f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_c49d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output;
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_c49d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue := VAR_sta2_uxn_opcodes_h_l2925_c40_418d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_b058] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output;

     -- dei[uxn_opcodes_h_l2926_c40_551f] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2926_c40_551f_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2926_c40_551f_phase <= VAR_dei_uxn_opcodes_h_l2926_c40_551f_phase;
     dei_uxn_opcodes_h_l2926_c40_551f_ins <= VAR_dei_uxn_opcodes_h_l2926_c40_551f_ins;
     dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_stack_read;
     dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2926_c40_551f_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2926_c40_551f_return_output := dei_uxn_opcodes_h_l2926_c40_551f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_047e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b058_return_output;
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_047e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue := VAR_dei_uxn_opcodes_h_l2926_c40_551f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_b773] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_fcb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output;

     -- dei2[uxn_opcodes_h_l2927_c40_5a6f] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2927_c40_5a6f_phase <= VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_phase;
     dei2_uxn_opcodes_h_l2927_c40_5a6f_ins <= VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_ins;
     dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_stack_read;
     dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output := dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output;
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b773_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue := VAR_dei2_uxn_opcodes_h_l2927_c40_5a6f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_c621] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output;

     -- deo[uxn_opcodes_h_l2928_c40_6751] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2928_c40_6751_phase <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_phase;
     deo_uxn_opcodes_h_l2928_c40_6751_ins <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_ins;
     deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_stack_read;
     deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_device_ram_read;
     deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2928_c40_6751_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2928_c40_6751_return_output := deo_uxn_opcodes_h_l2928_c40_6751_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_9e76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output;
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_c621_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue := VAR_deo_uxn_opcodes_h_l2928_c40_6751_return_output;
     -- deo2[uxn_opcodes_h_l2929_c40_34ea] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2929_c40_34ea_phase <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_phase;
     deo2_uxn_opcodes_h_l2929_c40_34ea_ins <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_ins;
     deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_stack_read;
     deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_return_output := deo2_uxn_opcodes_h_l2929_c40_34ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_557e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_e319] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_e319_return_output;
     VAR_add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_557e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue := VAR_deo2_uxn_opcodes_h_l2929_c40_34ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_35c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output;

     -- add[uxn_opcodes_h_l2930_c40_d059] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2930_c40_d059_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2930_c40_d059_phase <= VAR_add_uxn_opcodes_h_l2930_c40_d059_phase;
     add_uxn_opcodes_h_l2930_c40_d059_ins <= VAR_add_uxn_opcodes_h_l2930_c40_d059_ins;
     add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read <= VAR_add_uxn_opcodes_h_l2930_c40_d059_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2930_c40_d059_return_output := add_uxn_opcodes_h_l2930_c40_d059_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_0c81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output;
     VAR_add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_35c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue := VAR_add_uxn_opcodes_h_l2930_c40_d059_return_output;
     -- add2[uxn_opcodes_h_l2931_c40_6c17] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2931_c40_6c17_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2931_c40_6c17_phase <= VAR_add2_uxn_opcodes_h_l2931_c40_6c17_phase;
     add2_uxn_opcodes_h_l2931_c40_6c17_ins <= VAR_add2_uxn_opcodes_h_l2931_c40_6c17_ins;
     add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2931_c40_6c17_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2931_c40_6c17_return_output := add2_uxn_opcodes_h_l2931_c40_6c17_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_9bf9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_7a7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output;
     VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9bf9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue := VAR_add2_uxn_opcodes_h_l2931_c40_6c17_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a10a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output;

     -- sub[uxn_opcodes_h_l2932_c40_6a6d] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2932_c40_6a6d_phase <= VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_phase;
     sub_uxn_opcodes_h_l2932_c40_6a6d_ins <= VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_ins;
     sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_return_output := sub_uxn_opcodes_h_l2932_c40_6a6d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_26b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output;
     VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_26b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue := VAR_sub_uxn_opcodes_h_l2932_c40_6a6d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_2c09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_ca7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output;

     -- sub2[uxn_opcodes_h_l2933_c40_8c47] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2933_c40_8c47_phase <= VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_phase;
     sub2_uxn_opcodes_h_l2933_c40_8c47_ins <= VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_ins;
     sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_return_output := sub2_uxn_opcodes_h_l2933_c40_8c47_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output;
     VAR_mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_ca7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue := VAR_sub2_uxn_opcodes_h_l2933_c40_8c47_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_ce3c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output;

     -- mul[uxn_opcodes_h_l2934_c40_473b] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2934_c40_473b_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2934_c40_473b_phase <= VAR_mul_uxn_opcodes_h_l2934_c40_473b_phase;
     mul_uxn_opcodes_h_l2934_c40_473b_ins <= VAR_mul_uxn_opcodes_h_l2934_c40_473b_ins;
     mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2934_c40_473b_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2934_c40_473b_return_output := mul_uxn_opcodes_h_l2934_c40_473b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_aae2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output;
     VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_aae2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue := VAR_mul_uxn_opcodes_h_l2934_c40_473b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_b306] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e8a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output;

     -- mul2[uxn_opcodes_h_l2935_c40_12e5] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2935_c40_12e5_phase <= VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_phase;
     mul2_uxn_opcodes_h_l2935_c40_12e5_ins <= VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_ins;
     mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_return_output := mul2_uxn_opcodes_h_l2935_c40_12e5_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b306_return_output;
     VAR_div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e8a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue := VAR_mul2_uxn_opcodes_h_l2935_c40_12e5_return_output;
     -- div[uxn_opcodes_h_l2936_c40_88bc] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2936_c40_88bc_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2936_c40_88bc_phase <= VAR_div_uxn_opcodes_h_l2936_c40_88bc_phase;
     div_uxn_opcodes_h_l2936_c40_88bc_ins <= VAR_div_uxn_opcodes_h_l2936_c40_88bc_ins;
     div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read <= VAR_div_uxn_opcodes_h_l2936_c40_88bc_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2936_c40_88bc_return_output := div_uxn_opcodes_h_l2936_c40_88bc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_93b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_6f70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output;
     VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_93b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue := VAR_div_uxn_opcodes_h_l2936_c40_88bc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_1519] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output;

     -- div2[uxn_opcodes_h_l2937_c40_7e3f] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2937_c40_7e3f_phase <= VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_phase;
     div2_uxn_opcodes_h_l2937_c40_7e3f_ins <= VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_ins;
     div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_return_output := div2_uxn_opcodes_h_l2937_c40_7e3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_c2c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output;
     VAR_and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1519_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue := VAR_div2_uxn_opcodes_h_l2937_c40_7e3f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_62d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_fb0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output;

     -- and[uxn_opcodes_h_l2938_c40_2637] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2938_c40_2637_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2938_c40_2637_phase <= VAR_and_uxn_opcodes_h_l2938_c40_2637_phase;
     and_uxn_opcodes_h_l2938_c40_2637_ins <= VAR_and_uxn_opcodes_h_l2938_c40_2637_ins;
     and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read <= VAR_and_uxn_opcodes_h_l2938_c40_2637_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2938_c40_2637_return_output := and_uxn_opcodes_h_l2938_c40_2637_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output;
     VAR_and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_62d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue := VAR_and_uxn_opcodes_h_l2938_c40_2637_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_09fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_7aca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output;

     -- and2[uxn_opcodes_h_l2939_c40_50e1] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2939_c40_50e1_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2939_c40_50e1_phase <= VAR_and2_uxn_opcodes_h_l2939_c40_50e1_phase;
     and2_uxn_opcodes_h_l2939_c40_50e1_ins <= VAR_and2_uxn_opcodes_h_l2939_c40_50e1_ins;
     and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2939_c40_50e1_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2939_c40_50e1_return_output := and2_uxn_opcodes_h_l2939_c40_50e1_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output;
     VAR_ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_7aca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue := VAR_and2_uxn_opcodes_h_l2939_c40_50e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_6290] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output;

     -- ora[uxn_opcodes_h_l2940_c40_b128] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2940_c40_b128_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2940_c40_b128_phase <= VAR_ora_uxn_opcodes_h_l2940_c40_b128_phase;
     ora_uxn_opcodes_h_l2940_c40_b128_ins <= VAR_ora_uxn_opcodes_h_l2940_c40_b128_ins;
     ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2940_c40_b128_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2940_c40_b128_return_output := ora_uxn_opcodes_h_l2940_c40_b128_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_3e22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output;
     VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_6290_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue := VAR_ora_uxn_opcodes_h_l2940_c40_b128_return_output;
     -- ora2[uxn_opcodes_h_l2941_c40_1f35] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2941_c40_1f35_phase <= VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_phase;
     ora2_uxn_opcodes_h_l2941_c40_1f35_ins <= VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_ins;
     ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_return_output := ora2_uxn_opcodes_h_l2941_c40_1f35_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_e7c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_1e9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output;
     VAR_eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_e7c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue := VAR_ora2_uxn_opcodes_h_l2941_c40_1f35_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_27eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output;

     -- eor[uxn_opcodes_h_l2942_c40_2405] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2942_c40_2405_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2942_c40_2405_phase <= VAR_eor_uxn_opcodes_h_l2942_c40_2405_phase;
     eor_uxn_opcodes_h_l2942_c40_2405_ins <= VAR_eor_uxn_opcodes_h_l2942_c40_2405_ins;
     eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2942_c40_2405_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2942_c40_2405_return_output := eor_uxn_opcodes_h_l2942_c40_2405_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_c5ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output;
     VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_c5ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue := VAR_eor_uxn_opcodes_h_l2942_c40_2405_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_7376] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_7073] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output;

     -- eor2[uxn_opcodes_h_l2943_c40_7a78] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2943_c40_7a78_phase <= VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_phase;
     eor2_uxn_opcodes_h_l2943_c40_7a78_ins <= VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_ins;
     eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_return_output := eor2_uxn_opcodes_h_l2943_c40_7a78_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_7073_return_output;
     VAR_sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_7376_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue := VAR_eor2_uxn_opcodes_h_l2943_c40_7a78_return_output;
     -- sft[uxn_opcodes_h_l2944_c40_0377] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2944_c40_0377_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2944_c40_0377_phase <= VAR_sft_uxn_opcodes_h_l2944_c40_0377_phase;
     sft_uxn_opcodes_h_l2944_c40_0377_ins <= VAR_sft_uxn_opcodes_h_l2944_c40_0377_ins;
     sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2944_c40_0377_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2944_c40_0377_return_output := sft_uxn_opcodes_h_l2944_c40_0377_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_0677] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_0677_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue := VAR_sft_uxn_opcodes_h_l2944_c40_0377_return_output;
     -- sft2[uxn_opcodes_h_l2945_c40_fb3a] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2945_c40_fb3a_phase <= VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_phase;
     sft2_uxn_opcodes_h_l2945_c40_fb3a_ins <= VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_ins;
     sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output := sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue := VAR_sft2_uxn_opcodes_h_l2945_c40_fb3a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_7073] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_7073_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_27eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_27eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_1e9b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_1e9b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_3e22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_3e22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_09fc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_09fc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_fb0b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_fb0b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_c2c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_c2c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_6f70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6f70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_b306] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b306_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_ce3c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_ce3c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_2c09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_2c09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_a10a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a10a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_7a7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_7a7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_0c81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_0c81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_e319] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_e319_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_9e76] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9e76_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_fcb9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fcb9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_b058] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b058_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_28f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_28f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_f943] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_f943_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_59d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_59d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_5393] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_5393_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_581d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_581d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_b431] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_b431_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_7afd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7afd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_3a29] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_3a29_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_67ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_67ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_11ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_11ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_8ef8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8ef8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_4786] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_4786_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_6a07] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_6a07_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_8233] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_8233_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_5088] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_5088_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_524a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_524a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_e926] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_e926_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_ce40] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_ce40_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_3875] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_3875_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_214f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_214f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_2ee4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2ee4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_0752] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0752_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_fc21] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_fc21_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_a6a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a6a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_fc70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_a660] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_a660_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_ebe2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_ebe2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_e97d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_e97d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_f5b8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_f5b8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_3fa4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3fa4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_28c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_28c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_da36] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_da36_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_4b4d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4b4d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_88f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_88f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_0adc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0adc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_3839] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_3839_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_bb6c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_bb6c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_e52e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_e52e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_7df0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_7df0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_e3a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_e3a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_41ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_41ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_17a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_17a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_3771] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_3771_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_faaa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_faaa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_0edd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_0edd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_82af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_82af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_df55] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_df55_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_b387] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_b387_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_2f50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2f50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_b570] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_b570_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_13f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_13f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c2_3f7b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2962_c3_6c83] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_c3_6c83_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2968_c34_857f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2968_c34_857f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2969_c30_8bfe] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2969_c30_8bfe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2948_c17_ea74] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2948_c17_ea74_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2971_c34_d2b9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2971_c34_d2b9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2974_c32_3120] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2974_c32_3120_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2951_l2953_DUPLICATE_e2da LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2951_l2953_DUPLICATE_e2da_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2961_l2973_DUPLICATE_db54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2961_l2973_DUPLICATE_db54_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2966_c39_1beb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2966_c39_1beb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2967_c40_69fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2967_c40_69fb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2956_c68_fb12] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2956_c68_fb12_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2972_c37_4ca1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2972_c37_4ca1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2970_c33_a566] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2970_c33_a566_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output.is_ram_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2948_c17_ea74_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2962_c3_6c83_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2961_l2973_DUPLICATE_db54_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2953_l2951_DUPLICATE_8620 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2953_l2951_DUPLICATE_8620_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2951_l2953_DUPLICATE_e2da_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2956_c58_4232] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c58_4232_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2956_c68_fb12_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2948_c2_b58b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_left;
     BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output := BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2853_l2976_DUPLICATE_de91 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2853_l2976_DUPLICATE_de91_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2876_c2_3f7b_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2966_c39_1beb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2967_c40_69fb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2968_c34_857f_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2969_c30_8bfe_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2970_c33_a566_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2971_c34_d2b9_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2972_c37_4ca1_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2961_l2973_DUPLICATE_db54_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2974_c32_3120_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2956_c29_5178_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;
     VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2948_c2_b58b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2953_l2951_DUPLICATE_8620_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2953_l2951_DUPLICATE_8620_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c58_4232_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2853_l2976_DUPLICATE_de91_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2853_l2976_DUPLICATE_de91_return_output;
     -- MUX[uxn_opcodes_h_l2957_c20_da4c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2957_c20_da4c_cond <= VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_cond;
     MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue <= VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iftrue;
     MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse <= VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_return_output := MUX_uxn_opcodes_h_l2957_c20_da4c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2953_c3_d3fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2951_c3_4c29] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2951_c3_3a08 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2951_c3_4c29_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2953_c3_4794 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2953_c3_d3fa_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right := VAR_MUX_uxn_opcodes_h_l2957_c20_da4c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse := VAR_sp0_uxn_opcodes_h_l2953_c3_4794;
     VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue := VAR_sp1_uxn_opcodes_h_l2951_c3_3a08;
     -- sp1_MUX[uxn_opcodes_h_l2950_c2_0fde] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_cond;
     sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue;
     sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output := sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2950_c2_0fde] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_cond;
     sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iftrue;
     sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output := sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;
     VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2950_c2_0fde_return_output;
     -- MUX[uxn_opcodes_h_l2956_c29_5178] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2956_c29_5178_cond <= VAR_MUX_uxn_opcodes_h_l2956_c29_5178_cond;
     MUX_uxn_opcodes_h_l2956_c29_5178_iftrue <= VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iftrue;
     MUX_uxn_opcodes_h_l2956_c29_5178_iffalse <= VAR_MUX_uxn_opcodes_h_l2956_c29_5178_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2956_c29_5178_return_output := MUX_uxn_opcodes_h_l2956_c29_5178_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2956_c19_58e4] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c19_58e4_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2956_c29_5178_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2956_c19_58e4_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2956_c19_47dc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2956_c19_47dc_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2957_c2_56a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_left;
     BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output := BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2957_c2_56a7_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2959_c24_adcd] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_stack_address;
     stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value <= VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_value;
     stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output := stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2959_c24_adcd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_ins_a_3f <= REG_VAR_ins_a_3f;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_is_imm <= REG_VAR_is_imm;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_previous_stack_read <= REG_VAR_previous_stack_read;
REG_COMB_opc_result <= REG_VAR_opc_result;
REG_COMB_opc_eval_result <= REG_VAR_opc_eval_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     sp0 <= REG_COMB_sp0;
     sp1 <= REG_COMB_sp1;
     ins_a_3f <= REG_COMB_ins_a_3f;
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_wait <= REG_COMB_is_wait;
     is_imm <= REG_COMB_is_imm;
     stack_address <= REG_COMB_stack_address;
     previous_stack_read <= REG_COMB_previous_stack_read;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
