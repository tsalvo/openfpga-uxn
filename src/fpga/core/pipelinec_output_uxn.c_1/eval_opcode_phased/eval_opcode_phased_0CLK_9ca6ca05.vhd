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
entity eval_opcode_phased_0CLK_9ca6ca05 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(11 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_9ca6ca05;
architecture arch of eval_opcode_phased_0CLK_9ca6ca05 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2865_c14_695c]
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2866_c14_9ac2]
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2866_c14_9f2a]
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2866_c14_a70f]
signal UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2866_c14_526f]
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2866_c14_3979]
signal MUX_uxn_opcodes_h_l2866_c14_3979_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_3979_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_3979_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_3979_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2867_c8_c8e3]
signal MUX_uxn_opcodes_h_l2867_c8_c8e3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c6_9c6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_dff8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c2_ff60]
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2873_c2_ff60]
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2873_c48_db15]
signal brk_uxn_opcodes_h_l2873_c48_db15_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2873_c48_db15_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e744]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_be52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_67de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_dff8]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2874_c40_ae64]
signal jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_ae64_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_ae64_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_ae64_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1996]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_7429]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_38ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_67de]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2875_c40_b6ee]
signal jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_b6ee_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_b6ee_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_be84]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ae37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_2b80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_38ee]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2876_c40_1269]
signal jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_1269_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_1269_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_1269_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_aced]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_7d4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_8f85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_2b80]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_f9b4]
signal lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_f9b4_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_f9b4_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_f9b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_24a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_7604]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_20b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_8f85]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_ba72]
signal lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ba72_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ba72_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ba72_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_9b57]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_0611]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_ceee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_20b4]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2879_c40_c540]
signal lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_c540_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_c540_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_c540_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_b2b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_2230]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_58ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_ceee]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2880_c40_bed3]
signal lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_bed3_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_bed3_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_bed3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_e1b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_9a94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_7ee5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_58ac]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2881_c40_b396]
signal inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_b396_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_b396_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_b396_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_f5c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_530e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_aae7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_7ee5]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2882_c40_f3b2]
signal inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_f3b2_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_f3b2_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_4b48]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_3797]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_8c60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_aae7]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2883_c40_b5a0]
signal pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_b5a0_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_b5a0_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_b5a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_5f9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a486]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_a73c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_8c60]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2884_c40_ed6e]
signal pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_ed6e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_ed6e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_21df]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_d29b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7bcd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_a73c]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2885_c40_834a]
signal nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_834a_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_834a_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_834a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_97b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_d5e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_7b85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_7bcd]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2886_c40_0d20]
signal nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_0d20_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_0d20_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_0d20_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_081f]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_e58e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_f426]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_7b85]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2887_c40_1334]
signal swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_1334_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_1334_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_1334_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_a99d]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_bd98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_e9b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_f426]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2888_c40_0468]
signal swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_0468_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_0468_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_0468_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d44a]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_752f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_98a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_e9b9]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2889_c40_8304]
signal rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_8304_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_8304_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_8304_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_7d08]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_7b3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_8fa8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_98a5]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2890_c40_4118]
signal rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_4118_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_4118_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_4118_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_879a]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ef49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_0980]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_8fa8]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2891_c40_e220]
signal dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_e220_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_e220_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_e220_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_c0c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_56f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_a466]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_0980]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2892_c40_1c79]
signal dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_1c79_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_1c79_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_1c79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_60af]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_8ac2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_b015]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_a466]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2893_c40_797d]
signal ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_797d_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_797d_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_797d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_2ec5]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_4ae6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_18c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_b015]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2894_c40_0a78]
signal ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_0a78_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_0a78_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_caf8]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_7508]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_ee1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_18c2]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2895_c40_5fad]
signal equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_5fad_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_5fad_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_5fad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_79f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_62b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_2179]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_ee1c]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2896_c40_52ab]
signal equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_52ab_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_52ab_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_52ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_3e28]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_647b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_3521]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_2179]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2897_c40_dfcf]
signal neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_dfcf_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_dfcf_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_dfcf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_70fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_274d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_8047]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_3521]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2898_c40_1f47]
signal neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_1f47_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_1f47_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_1f47_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_7e95]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_fa1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_69c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_8047]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2899_c40_05ff]
signal gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_05ff_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_05ff_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_05ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_cd4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_ca10]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_7b9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_69c5]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2900_c40_9bb6]
signal gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_9bb6_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_9bb6_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_845d]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_ff34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_b7b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_7b9c]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2901_c40_be66]
signal lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_be66_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_be66_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_be66_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_dea0]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_478b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0c90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_b7b6]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2902_c40_b95a]
signal lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_b95a_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_b95a_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_b95a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_e8ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ac0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_2679]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_0c90]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2903_c40_4f3a]
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_4feb]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_3794]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_d1de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_2679]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2904_c40_5e00]
signal jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_5e00_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_5e00_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_9734]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_a283]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_1238]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_d1de]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2905_c40_69c5]
signal jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_69c5_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_69c5_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_69c5_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_69c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_9459]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_fe8a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_0bd5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_1238]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2906_c40_0a72]
signal jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_0a72_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_0a72_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_512a]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_33c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_3ded]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_0bd5]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2907_c40_2fa6]
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_2459]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_2c86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_c995]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_3ded]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2908_c40_95e3]
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_de73]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_8c03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_e2fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_c995]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2909_c40_f3a2]
signal sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_f3a2_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_f3a2_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_f3a2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_8451]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_9c93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_1551]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_e2fa]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2910_c40_9dc1]
signal sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_9dc1_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_9dc1_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_a3df]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_e350]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_dd92]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_1551]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2911_c40_8d26]
signal ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_8d26_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_8d26_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_8d26_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ecdb]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_c9db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_08dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_dd92]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2912_c40_193d]
signal ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_193d_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_193d_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_193d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_292e]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0627]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_c32f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_08dc]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2913_c40_1cbd]
signal stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_1cbd_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_1cbd_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_1cbd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_43af]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_b932]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_0ecd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_c32f]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2914_c40_6c0b]
signal stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_6c0b_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_6c0b_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_a7b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_008b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_ce33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_0ecd]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2915_c40_7579]
signal ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_7579_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_26a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_dbb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_7086]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_ce33]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2916_c40_8646]
signal ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_8646_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_11cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_14fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_9152]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_7086]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2917_c40_5061]
signal str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_5061_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_5061_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_5061_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_5061_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_e555]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_8da9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_5804]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_9152]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2918_c40_a620]
signal str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_a620_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_a620_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_a620_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_a620_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f291]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_21c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_8848]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_5804]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2919_c40_3546]
signal lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_3546_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_3546_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_3546_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_bbf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b9ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_c379]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_8848]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2920_c40_3139]
signal lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_3139_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_3139_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_3139_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_beee]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f170]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_95ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_c379]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2921_c40_c7d8]
signal sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_c7d8_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_c7d8_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_c7d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_773e]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_56dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f49a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_95ff]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2922_c40_df28]
signal sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_df28_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_df28_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_df28_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_2b3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_94d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_6be2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_f49a]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2923_c40_69c7]
signal dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_69c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_c717]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_cd63]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_3048]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_6be2]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2924_c40_4f10]
signal dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_4f10_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_14a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_1d92]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_d4c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_3048]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2925_c40_6f4b]
signal deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_6f4b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_6ddc]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_3875]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_7cd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_d4c3]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2926_c40_89e9]
signal deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_89e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_8939]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_5b90]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e095]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_7cd2]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2927_c40_7095]
signal add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2927_c40_7095_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_7095_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_7095_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_5954]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_b5d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_fe22]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_e095]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2928_c40_2da5]
signal add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_2da5_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_2da5_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_2da5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0916]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_4d08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_9bda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_fe22]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2929_c40_b86a]
signal sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_b86a_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_b86a_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_b86a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c3aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_7403]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_907e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_9bda]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2930_c40_817f]
signal sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_817f_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_817f_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_817f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_7456]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_cd58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_05f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_907e]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2931_c40_4b1b]
signal mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_4b1b_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_4b1b_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_4b1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_fc95]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_9774]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_b51a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_05f0]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2932_c40_9fbb]
signal mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_9fbb_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_9fbb_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_fdc4]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b7ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_dbbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_b51a]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2933_c40_688f]
signal div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2933_c40_688f_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_688f_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_688f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_a9e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_7242]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_9a1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_dbbc]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2934_c40_8f7b]
signal div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_8f7b_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_8f7b_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_8f7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_04f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_047c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_f7d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_9a1f]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2935_c40_c1db]
signal and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c1db_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c1db_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c1db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_bef0]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_853e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_c91f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_f7d8]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2936_c40_dcd6]
signal and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_dcd6_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_dcd6_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_dcd6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_451c]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_830e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_6b11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_c91f]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2937_c40_eef6]
signal ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_eef6_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_eef6_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_eef6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_41db]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_8555]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_2462]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_6b11]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2938_c40_6913]
signal ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_6913_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_6913_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_6913_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_0c2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_3b27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_8ff2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_2462]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2939_c40_80dc]
signal eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_80dc_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_80dc_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_80dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_3ae3]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_81c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_a5ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_8ff2]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2940_c40_afee]
signal eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_afee_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_afee_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_afee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_09ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_0a2e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_0dd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_a5ee]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2941_c40_68a4]
signal sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_68a4_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_68a4_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_68a4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_8a78]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_3353]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_0dd0]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2942_c40_0f74]
signal sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_0f74_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_0f74_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_0f74_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2944_c16_425e]
signal CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2945_c2_e554]
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2947_c2_6490]
signal sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2947_c2_6490]
signal sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_0f64]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2950_c3_c9e1]
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2953_c29_a7ff]
signal MUX_uxn_opcodes_h_l2953_c29_a7ff_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2953_c19_887a]
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2954_c20_4044]
signal MUX_uxn_opcodes_h_l2954_c20_4044_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4044_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4044_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4044_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2954_c2_8105]
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2956_c24_1f45]
signal stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c
BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left,
BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right,
BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left,
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right,
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a
BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left,
BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right,
BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left,
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right,
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output);

-- MUX_uxn_opcodes_h_l2866_c14_3979
MUX_uxn_opcodes_h_l2866_c14_3979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2866_c14_3979_cond,
MUX_uxn_opcodes_h_l2866_c14_3979_iftrue,
MUX_uxn_opcodes_h_l2866_c14_3979_iffalse,
MUX_uxn_opcodes_h_l2866_c14_3979_return_output);

-- MUX_uxn_opcodes_h_l2867_c8_c8e3
MUX_uxn_opcodes_h_l2867_c8_c8e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2867_c8_c8e3_cond,
MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue,
MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse,
MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60
opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60
is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond,
is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue,
is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse,
is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output);

-- brk_uxn_opcodes_h_l2873_c48_db15
brk_uxn_opcodes_h_l2873_c48_db15 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2873_c48_db15_phase,
brk_uxn_opcodes_h_l2873_c48_db15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8
opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output);

-- jci_uxn_opcodes_h_l2874_c40_ae64
jci_uxn_opcodes_h_l2874_c40_ae64 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2874_c40_ae64_phase,
jci_uxn_opcodes_h_l2874_c40_ae64_pc,
jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read,
jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read,
jci_uxn_opcodes_h_l2874_c40_ae64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_67de
opc_result_MUX_uxn_opcodes_h_l2875_c7_67de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output);

-- jmi_uxn_opcodes_h_l2875_c40_b6ee
jmi_uxn_opcodes_h_l2875_c40_b6ee : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2875_c40_b6ee_phase,
jmi_uxn_opcodes_h_l2875_c40_b6ee_pc,
jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read,
jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee
opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output);

-- jsi_uxn_opcodes_h_l2876_c40_1269
jsi_uxn_opcodes_h_l2876_c40_1269 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2876_c40_1269_phase,
jsi_uxn_opcodes_h_l2876_c40_1269_pc,
jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read,
jsi_uxn_opcodes_h_l2876_c40_1269_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output);

-- lit_uxn_opcodes_h_l2877_c40_f9b4
lit_uxn_opcodes_h_l2877_c40_f9b4 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_f9b4_phase,
lit_uxn_opcodes_h_l2877_c40_f9b4_pc,
lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_f9b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85
opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_ba72
lit2_uxn_opcodes_h_l2878_c40_ba72 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_ba72_phase,
lit2_uxn_opcodes_h_l2878_c40_ba72_pc,
lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_ba72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4
opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output);

-- lit_uxn_opcodes_h_l2879_c40_c540
lit_uxn_opcodes_h_l2879_c40_c540 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2879_c40_c540_phase,
lit_uxn_opcodes_h_l2879_c40_c540_pc,
lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read,
lit_uxn_opcodes_h_l2879_c40_c540_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee
opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output);

-- lit2_uxn_opcodes_h_l2880_c40_bed3
lit2_uxn_opcodes_h_l2880_c40_bed3 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2880_c40_bed3_phase,
lit2_uxn_opcodes_h_l2880_c40_bed3_pc,
lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read,
lit2_uxn_opcodes_h_l2880_c40_bed3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac
opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output);

-- inc_uxn_opcodes_h_l2881_c40_b396
inc_uxn_opcodes_h_l2881_c40_b396 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2881_c40_b396_phase,
inc_uxn_opcodes_h_l2881_c40_b396_ins,
inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read,
inc_uxn_opcodes_h_l2881_c40_b396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5
opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output);

-- inc2_uxn_opcodes_h_l2882_c40_f3b2
inc2_uxn_opcodes_h_l2882_c40_f3b2 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2882_c40_f3b2_phase,
inc2_uxn_opcodes_h_l2882_c40_f3b2_ins,
inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read,
inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7
opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output);

-- pop_uxn_opcodes_h_l2883_c40_b5a0
pop_uxn_opcodes_h_l2883_c40_b5a0 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2883_c40_b5a0_phase,
pop_uxn_opcodes_h_l2883_c40_b5a0_ins,
pop_uxn_opcodes_h_l2883_c40_b5a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output);

-- pop2_uxn_opcodes_h_l2884_c40_ed6e
pop2_uxn_opcodes_h_l2884_c40_ed6e : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2884_c40_ed6e_phase,
pop2_uxn_opcodes_h_l2884_c40_ed6e_ins,
pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c
opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output);

-- nip_uxn_opcodes_h_l2885_c40_834a
nip_uxn_opcodes_h_l2885_c40_834a : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2885_c40_834a_phase,
nip_uxn_opcodes_h_l2885_c40_834a_ins,
nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read,
nip_uxn_opcodes_h_l2885_c40_834a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd
opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output);

-- nip2_uxn_opcodes_h_l2886_c40_0d20
nip2_uxn_opcodes_h_l2886_c40_0d20 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2886_c40_0d20_phase,
nip2_uxn_opcodes_h_l2886_c40_0d20_ins,
nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read,
nip2_uxn_opcodes_h_l2886_c40_0d20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85
opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output);

-- swp_uxn_opcodes_h_l2887_c40_1334
swp_uxn_opcodes_h_l2887_c40_1334 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2887_c40_1334_phase,
swp_uxn_opcodes_h_l2887_c40_1334_ins,
swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read,
swp_uxn_opcodes_h_l2887_c40_1334_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_f426
opc_result_MUX_uxn_opcodes_h_l2888_c7_f426 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output);

-- swp2_uxn_opcodes_h_l2888_c40_0468
swp2_uxn_opcodes_h_l2888_c40_0468 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2888_c40_0468_phase,
swp2_uxn_opcodes_h_l2888_c40_0468_ins,
swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read,
swp2_uxn_opcodes_h_l2888_c40_0468_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9
opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output);

-- rot_uxn_opcodes_h_l2889_c40_8304
rot_uxn_opcodes_h_l2889_c40_8304 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2889_c40_8304_phase,
rot_uxn_opcodes_h_l2889_c40_8304_ins,
rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read,
rot_uxn_opcodes_h_l2889_c40_8304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5
opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output);

-- rot2_uxn_opcodes_h_l2890_c40_4118
rot2_uxn_opcodes_h_l2890_c40_4118 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2890_c40_4118_phase,
rot2_uxn_opcodes_h_l2890_c40_4118_ins,
rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read,
rot2_uxn_opcodes_h_l2890_c40_4118_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8
opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output);

-- dup_uxn_opcodes_h_l2891_c40_e220
dup_uxn_opcodes_h_l2891_c40_e220 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2891_c40_e220_phase,
dup_uxn_opcodes_h_l2891_c40_e220_ins,
dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read,
dup_uxn_opcodes_h_l2891_c40_e220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_0980
opc_result_MUX_uxn_opcodes_h_l2892_c7_0980 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output);

-- dup2_uxn_opcodes_h_l2892_c40_1c79
dup2_uxn_opcodes_h_l2892_c40_1c79 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2892_c40_1c79_phase,
dup2_uxn_opcodes_h_l2892_c40_1c79_ins,
dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read,
dup2_uxn_opcodes_h_l2892_c40_1c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_a466
opc_result_MUX_uxn_opcodes_h_l2893_c7_a466 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output);

-- ovr_uxn_opcodes_h_l2893_c40_797d
ovr_uxn_opcodes_h_l2893_c40_797d : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2893_c40_797d_phase,
ovr_uxn_opcodes_h_l2893_c40_797d_ins,
ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read,
ovr_uxn_opcodes_h_l2893_c40_797d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_b015
opc_result_MUX_uxn_opcodes_h_l2894_c7_b015 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output);

-- ovr2_uxn_opcodes_h_l2894_c40_0a78
ovr2_uxn_opcodes_h_l2894_c40_0a78 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2894_c40_0a78_phase,
ovr2_uxn_opcodes_h_l2894_c40_0a78_ins,
ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read,
ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2
opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output);

-- equ_uxn_opcodes_h_l2895_c40_5fad
equ_uxn_opcodes_h_l2895_c40_5fad : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2895_c40_5fad_phase,
equ_uxn_opcodes_h_l2895_c40_5fad_ins,
equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read,
equ_uxn_opcodes_h_l2895_c40_5fad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c
opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output);

-- equ2_uxn_opcodes_h_l2896_c40_52ab
equ2_uxn_opcodes_h_l2896_c40_52ab : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2896_c40_52ab_phase,
equ2_uxn_opcodes_h_l2896_c40_52ab_ins,
equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read,
equ2_uxn_opcodes_h_l2896_c40_52ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_2179
opc_result_MUX_uxn_opcodes_h_l2897_c7_2179 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output);

-- neq_uxn_opcodes_h_l2897_c40_dfcf
neq_uxn_opcodes_h_l2897_c40_dfcf : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2897_c40_dfcf_phase,
neq_uxn_opcodes_h_l2897_c40_dfcf_ins,
neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read,
neq_uxn_opcodes_h_l2897_c40_dfcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_3521
opc_result_MUX_uxn_opcodes_h_l2898_c7_3521 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output);

-- neq2_uxn_opcodes_h_l2898_c40_1f47
neq2_uxn_opcodes_h_l2898_c40_1f47 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2898_c40_1f47_phase,
neq2_uxn_opcodes_h_l2898_c40_1f47_ins,
neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read,
neq2_uxn_opcodes_h_l2898_c40_1f47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_8047
opc_result_MUX_uxn_opcodes_h_l2899_c7_8047 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output);

-- gth_uxn_opcodes_h_l2899_c40_05ff
gth_uxn_opcodes_h_l2899_c40_05ff : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2899_c40_05ff_phase,
gth_uxn_opcodes_h_l2899_c40_05ff_ins,
gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read,
gth_uxn_opcodes_h_l2899_c40_05ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5
opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output);

-- gth2_uxn_opcodes_h_l2900_c40_9bb6
gth2_uxn_opcodes_h_l2900_c40_9bb6 : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2900_c40_9bb6_phase,
gth2_uxn_opcodes_h_l2900_c40_9bb6_ins,
gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read,
gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c
opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output);

-- lth_uxn_opcodes_h_l2901_c40_be66
lth_uxn_opcodes_h_l2901_c40_be66 : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2901_c40_be66_phase,
lth_uxn_opcodes_h_l2901_c40_be66_ins,
lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read,
lth_uxn_opcodes_h_l2901_c40_be66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6
opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output);

-- lth2_uxn_opcodes_h_l2902_c40_b95a
lth2_uxn_opcodes_h_l2902_c40_b95a : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2902_c40_b95a_phase,
lth2_uxn_opcodes_h_l2902_c40_b95a_ins,
lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read,
lth2_uxn_opcodes_h_l2902_c40_b95a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90
opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output);

-- jmp_uxn_opcodes_h_l2903_c40_4f3a
jmp_uxn_opcodes_h_l2903_c40_4f3a : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2903_c40_4f3a_phase,
jmp_uxn_opcodes_h_l2903_c40_4f3a_ins,
jmp_uxn_opcodes_h_l2903_c40_4f3a_pc,
jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read,
jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_2679
opc_result_MUX_uxn_opcodes_h_l2904_c7_2679 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output);

-- jmp2_uxn_opcodes_h_l2904_c40_5e00
jmp2_uxn_opcodes_h_l2904_c40_5e00 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2904_c40_5e00_phase,
jmp2_uxn_opcodes_h_l2904_c40_5e00_ins,
jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read,
jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de
opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output);

-- jcn_uxn_opcodes_h_l2905_c40_69c5
jcn_uxn_opcodes_h_l2905_c40_69c5 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2905_c40_69c5_phase,
jcn_uxn_opcodes_h_l2905_c40_69c5_ins,
jcn_uxn_opcodes_h_l2905_c40_69c5_pc,
jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read,
jcn_uxn_opcodes_h_l2905_c40_69c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_1238
opc_result_MUX_uxn_opcodes_h_l2906_c7_1238 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output);

-- jcn2_uxn_opcodes_h_l2906_c40_0a72
jcn2_uxn_opcodes_h_l2906_c40_0a72 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2906_c40_0a72_phase,
jcn2_uxn_opcodes_h_l2906_c40_0a72_ins,
jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read,
jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5
opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output);

-- jsr_uxn_opcodes_h_l2907_c40_2fa6
jsr_uxn_opcodes_h_l2907_c40_2fa6 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2907_c40_2fa6_phase,
jsr_uxn_opcodes_h_l2907_c40_2fa6_ins,
jsr_uxn_opcodes_h_l2907_c40_2fa6_pc,
jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read,
jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded
opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output);

-- jsr2_uxn_opcodes_h_l2908_c40_95e3
jsr2_uxn_opcodes_h_l2908_c40_95e3 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2908_c40_95e3_phase,
jsr2_uxn_opcodes_h_l2908_c40_95e3_ins,
jsr2_uxn_opcodes_h_l2908_c40_95e3_pc,
jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read,
jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_c995
opc_result_MUX_uxn_opcodes_h_l2909_c7_c995 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output);

-- sth_uxn_opcodes_h_l2909_c40_f3a2
sth_uxn_opcodes_h_l2909_c40_f3a2 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2909_c40_f3a2_phase,
sth_uxn_opcodes_h_l2909_c40_f3a2_ins,
sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read,
sth_uxn_opcodes_h_l2909_c40_f3a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa
opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output);

-- sth2_uxn_opcodes_h_l2910_c40_9dc1
sth2_uxn_opcodes_h_l2910_c40_9dc1 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2910_c40_9dc1_phase,
sth2_uxn_opcodes_h_l2910_c40_9dc1_ins,
sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read,
sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_1551
opc_result_MUX_uxn_opcodes_h_l2911_c7_1551 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output);

-- ldz_uxn_opcodes_h_l2911_c40_8d26
ldz_uxn_opcodes_h_l2911_c40_8d26 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2911_c40_8d26_phase,
ldz_uxn_opcodes_h_l2911_c40_8d26_ins,
ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read,
ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read,
ldz_uxn_opcodes_h_l2911_c40_8d26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92
opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output);

-- ldz2_uxn_opcodes_h_l2912_c40_193d
ldz2_uxn_opcodes_h_l2912_c40_193d : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2912_c40_193d_phase,
ldz2_uxn_opcodes_h_l2912_c40_193d_ins,
ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read,
ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read,
ldz2_uxn_opcodes_h_l2912_c40_193d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc
opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output);

-- stz_uxn_opcodes_h_l2913_c40_1cbd
stz_uxn_opcodes_h_l2913_c40_1cbd : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2913_c40_1cbd_phase,
stz_uxn_opcodes_h_l2913_c40_1cbd_ins,
stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read,
stz_uxn_opcodes_h_l2913_c40_1cbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f
opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output);

-- stz2_uxn_opcodes_h_l2914_c40_6c0b
stz2_uxn_opcodes_h_l2914_c40_6c0b : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2914_c40_6c0b_phase,
stz2_uxn_opcodes_h_l2914_c40_6c0b_ins,
stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read,
stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd
opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output);

-- ldr_uxn_opcodes_h_l2915_c40_7579
ldr_uxn_opcodes_h_l2915_c40_7579 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2915_c40_7579_phase,
ldr_uxn_opcodes_h_l2915_c40_7579_ins,
ldr_uxn_opcodes_h_l2915_c40_7579_pc,
ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read,
ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read,
ldr_uxn_opcodes_h_l2915_c40_7579_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33
opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output);

-- ldr2_uxn_opcodes_h_l2916_c40_8646
ldr2_uxn_opcodes_h_l2916_c40_8646 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2916_c40_8646_phase,
ldr2_uxn_opcodes_h_l2916_c40_8646_ins,
ldr2_uxn_opcodes_h_l2916_c40_8646_pc,
ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read,
ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read,
ldr2_uxn_opcodes_h_l2916_c40_8646_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_7086
opc_result_MUX_uxn_opcodes_h_l2917_c7_7086 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output);

-- str1_uxn_opcodes_h_l2917_c40_5061
str1_uxn_opcodes_h_l2917_c40_5061 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2917_c40_5061_phase,
str1_uxn_opcodes_h_l2917_c40_5061_ins,
str1_uxn_opcodes_h_l2917_c40_5061_pc,
str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read,
str1_uxn_opcodes_h_l2917_c40_5061_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_9152
opc_result_MUX_uxn_opcodes_h_l2918_c7_9152 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output);

-- str2_uxn_opcodes_h_l2918_c40_a620
str2_uxn_opcodes_h_l2918_c40_a620 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2918_c40_a620_phase,
str2_uxn_opcodes_h_l2918_c40_a620_ins,
str2_uxn_opcodes_h_l2918_c40_a620_pc,
str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read,
str2_uxn_opcodes_h_l2918_c40_a620_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_5804
opc_result_MUX_uxn_opcodes_h_l2919_c7_5804 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output);

-- lda_uxn_opcodes_h_l2919_c40_3546
lda_uxn_opcodes_h_l2919_c40_3546 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2919_c40_3546_phase,
lda_uxn_opcodes_h_l2919_c40_3546_ins,
lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read,
lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read,
lda_uxn_opcodes_h_l2919_c40_3546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_8848
opc_result_MUX_uxn_opcodes_h_l2920_c7_8848 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output);

-- lda2_uxn_opcodes_h_l2920_c40_3139
lda2_uxn_opcodes_h_l2920_c40_3139 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2920_c40_3139_phase,
lda2_uxn_opcodes_h_l2920_c40_3139_ins,
lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read,
lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read,
lda2_uxn_opcodes_h_l2920_c40_3139_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_c379
opc_result_MUX_uxn_opcodes_h_l2921_c7_c379 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output);

-- sta_uxn_opcodes_h_l2921_c40_c7d8
sta_uxn_opcodes_h_l2921_c40_c7d8 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2921_c40_c7d8_phase,
sta_uxn_opcodes_h_l2921_c40_c7d8_ins,
sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read,
sta_uxn_opcodes_h_l2921_c40_c7d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff
opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output);

-- sta2_uxn_opcodes_h_l2922_c40_df28
sta2_uxn_opcodes_h_l2922_c40_df28 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2922_c40_df28_phase,
sta2_uxn_opcodes_h_l2922_c40_df28_ins,
sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read,
sta2_uxn_opcodes_h_l2922_c40_df28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a
opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output);

-- dei_uxn_opcodes_h_l2923_c40_69c7
dei_uxn_opcodes_h_l2923_c40_69c7 : entity work.dei_0CLK_11d1c5ea port map (
clk,
dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2923_c40_69c7_phase,
dei_uxn_opcodes_h_l2923_c40_69c7_ins,
dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons,
dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0,
dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1,
dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read,
dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read,
dei_uxn_opcodes_h_l2923_c40_69c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2
opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output);

-- dei2_uxn_opcodes_h_l2924_c40_4f10
dei2_uxn_opcodes_h_l2924_c40_4f10 : entity work.dei2_0CLK_898867fd port map (
clk,
dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2924_c40_4f10_phase,
dei2_uxn_opcodes_h_l2924_c40_4f10_ins,
dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons,
dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0,
dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1,
dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read,
dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read,
dei2_uxn_opcodes_h_l2924_c40_4f10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_3048
opc_result_MUX_uxn_opcodes_h_l2925_c7_3048 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output);

-- deo_uxn_opcodes_h_l2925_c40_6f4b
deo_uxn_opcodes_h_l2925_c40_6f4b : entity work.deo_0CLK_65c69ceb port map (
clk,
deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2925_c40_6f4b_phase,
deo_uxn_opcodes_h_l2925_c40_6f4b_ins,
deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read,
deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read,
deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read,
deo_uxn_opcodes_h_l2925_c40_6f4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3
opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output);

-- deo2_uxn_opcodes_h_l2926_c40_89e9
deo2_uxn_opcodes_h_l2926_c40_89e9 : entity work.deo2_0CLK_8faca1d2 port map (
clk,
deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2926_c40_89e9_phase,
deo2_uxn_opcodes_h_l2926_c40_89e9_ins,
deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read,
deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read,
deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read,
deo2_uxn_opcodes_h_l2926_c40_89e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2
opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output);

-- add_uxn_opcodes_h_l2927_c40_7095
add_uxn_opcodes_h_l2927_c40_7095 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE,
add_uxn_opcodes_h_l2927_c40_7095_phase,
add_uxn_opcodes_h_l2927_c40_7095_ins,
add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read,
add_uxn_opcodes_h_l2927_c40_7095_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_e095
opc_result_MUX_uxn_opcodes_h_l2928_c7_e095 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output);

-- add2_uxn_opcodes_h_l2928_c40_2da5
add2_uxn_opcodes_h_l2928_c40_2da5 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2928_c40_2da5_phase,
add2_uxn_opcodes_h_l2928_c40_2da5_ins,
add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read,
add2_uxn_opcodes_h_l2928_c40_2da5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22
opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output);

-- sub1_uxn_opcodes_h_l2929_c40_b86a
sub1_uxn_opcodes_h_l2929_c40_b86a : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2929_c40_b86a_phase,
sub1_uxn_opcodes_h_l2929_c40_b86a_ins,
sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read,
sub1_uxn_opcodes_h_l2929_c40_b86a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda
opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output);

-- sub2_uxn_opcodes_h_l2930_c40_817f
sub2_uxn_opcodes_h_l2930_c40_817f : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2930_c40_817f_phase,
sub2_uxn_opcodes_h_l2930_c40_817f_ins,
sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read,
sub2_uxn_opcodes_h_l2930_c40_817f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_907e
opc_result_MUX_uxn_opcodes_h_l2931_c7_907e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output);

-- mul_uxn_opcodes_h_l2931_c40_4b1b
mul_uxn_opcodes_h_l2931_c40_4b1b : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2931_c40_4b1b_phase,
mul_uxn_opcodes_h_l2931_c40_4b1b_ins,
mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read,
mul_uxn_opcodes_h_l2931_c40_4b1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0
opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output);

-- mul2_uxn_opcodes_h_l2932_c40_9fbb
mul2_uxn_opcodes_h_l2932_c40_9fbb : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2932_c40_9fbb_phase,
mul2_uxn_opcodes_h_l2932_c40_9fbb_ins,
mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read,
mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a
opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output);

-- div_uxn_opcodes_h_l2933_c40_688f
div_uxn_opcodes_h_l2933_c40_688f : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE,
div_uxn_opcodes_h_l2933_c40_688f_phase,
div_uxn_opcodes_h_l2933_c40_688f_ins,
div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read,
div_uxn_opcodes_h_l2933_c40_688f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output);

-- div2_uxn_opcodes_h_l2934_c40_8f7b
div2_uxn_opcodes_h_l2934_c40_8f7b : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2934_c40_8f7b_phase,
div2_uxn_opcodes_h_l2934_c40_8f7b_ins,
div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read,
div2_uxn_opcodes_h_l2934_c40_8f7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f
opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output);

-- and_uxn_opcodes_h_l2935_c40_c1db
and_uxn_opcodes_h_l2935_c40_c1db : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE,
and_uxn_opcodes_h_l2935_c40_c1db_phase,
and_uxn_opcodes_h_l2935_c40_c1db_ins,
and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read,
and_uxn_opcodes_h_l2935_c40_c1db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8
opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output);

-- and2_uxn_opcodes_h_l2936_c40_dcd6
and2_uxn_opcodes_h_l2936_c40_dcd6 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2936_c40_dcd6_phase,
and2_uxn_opcodes_h_l2936_c40_dcd6_ins,
and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read,
and2_uxn_opcodes_h_l2936_c40_dcd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f
opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output);

-- ora_uxn_opcodes_h_l2937_c40_eef6
ora_uxn_opcodes_h_l2937_c40_eef6 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2937_c40_eef6_phase,
ora_uxn_opcodes_h_l2937_c40_eef6_ins,
ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read,
ora_uxn_opcodes_h_l2937_c40_eef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11
opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output);

-- ora2_uxn_opcodes_h_l2938_c40_6913
ora2_uxn_opcodes_h_l2938_c40_6913 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2938_c40_6913_phase,
ora2_uxn_opcodes_h_l2938_c40_6913_ins,
ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read,
ora2_uxn_opcodes_h_l2938_c40_6913_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_2462
opc_result_MUX_uxn_opcodes_h_l2939_c7_2462 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output);

-- eor_uxn_opcodes_h_l2939_c40_80dc
eor_uxn_opcodes_h_l2939_c40_80dc : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2939_c40_80dc_phase,
eor_uxn_opcodes_h_l2939_c40_80dc_ins,
eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read,
eor_uxn_opcodes_h_l2939_c40_80dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2
opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output);

-- eor2_uxn_opcodes_h_l2940_c40_afee
eor2_uxn_opcodes_h_l2940_c40_afee : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2940_c40_afee_phase,
eor2_uxn_opcodes_h_l2940_c40_afee_ins,
eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read,
eor2_uxn_opcodes_h_l2940_c40_afee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee
opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output);

-- sft_uxn_opcodes_h_l2941_c40_68a4
sft_uxn_opcodes_h_l2941_c40_68a4 : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2941_c40_68a4_phase,
sft_uxn_opcodes_h_l2941_c40_68a4_ins,
sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read,
sft_uxn_opcodes_h_l2941_c40_68a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0
opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output);

-- sft2_uxn_opcodes_h_l2942_c40_0f74
sft2_uxn_opcodes_h_l2942_c40_0f74 : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2942_c40_0f74_phase,
sft2_uxn_opcodes_h_l2942_c40_0f74_ins,
sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read,
sft2_uxn_opcodes_h_l2942_c40_0f74_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2944_c16_425e
CONST_SR_6_uxn_opcodes_h_l2944_c16_425e : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x,
CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left,
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right,
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output);

-- sp0_MUX_uxn_opcodes_h_l2947_c2_6490
sp0_MUX_uxn_opcodes_h_l2947_c2_6490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond,
sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue,
sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse,
sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output);

-- sp1_MUX_uxn_opcodes_h_l2947_c2_6490
sp1_MUX_uxn_opcodes_h_l2947_c2_6490 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond,
sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue,
sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse,
sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left,
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right,
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output);

-- MUX_uxn_opcodes_h_l2953_c29_a7ff
MUX_uxn_opcodes_h_l2953_c29_a7ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c29_a7ff_cond,
MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue,
MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse,
MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left,
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right,
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output);

-- MUX_uxn_opcodes_h_l2954_c20_4044
MUX_uxn_opcodes_h_l2954_c20_4044 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2954_c20_4044_cond,
MUX_uxn_opcodes_h_l2954_c20_4044_iftrue,
MUX_uxn_opcodes_h_l2954_c20_4044_iffalse,
MUX_uxn_opcodes_h_l2954_c20_4044_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105
BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105 : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left,
BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right,
BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output);

-- stack_ram_update_uxn_opcodes_h_l2956_c24_1f45
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address,
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value,
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable,
stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 controller0_buttons,
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
 BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output,
 MUX_uxn_opcodes_h_l2866_c14_3979_return_output,
 MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output,
 is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output,
 brk_uxn_opcodes_h_l2873_c48_db15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output,
 jci_uxn_opcodes_h_l2874_c40_ae64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output,
 jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output,
 jsi_uxn_opcodes_h_l2876_c40_1269_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output,
 lit_uxn_opcodes_h_l2877_c40_f9b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output,
 lit2_uxn_opcodes_h_l2878_c40_ba72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output,
 lit_uxn_opcodes_h_l2879_c40_c540_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output,
 lit2_uxn_opcodes_h_l2880_c40_bed3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output,
 inc_uxn_opcodes_h_l2881_c40_b396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output,
 inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output,
 pop_uxn_opcodes_h_l2883_c40_b5a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output,
 pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output,
 nip_uxn_opcodes_h_l2885_c40_834a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output,
 nip2_uxn_opcodes_h_l2886_c40_0d20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output,
 swp_uxn_opcodes_h_l2887_c40_1334_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output,
 swp2_uxn_opcodes_h_l2888_c40_0468_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output,
 rot_uxn_opcodes_h_l2889_c40_8304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output,
 rot2_uxn_opcodes_h_l2890_c40_4118_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output,
 dup_uxn_opcodes_h_l2891_c40_e220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output,
 dup2_uxn_opcodes_h_l2892_c40_1c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output,
 ovr_uxn_opcodes_h_l2893_c40_797d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output,
 ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output,
 equ_uxn_opcodes_h_l2895_c40_5fad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output,
 equ2_uxn_opcodes_h_l2896_c40_52ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output,
 neq_uxn_opcodes_h_l2897_c40_dfcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output,
 neq2_uxn_opcodes_h_l2898_c40_1f47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output,
 gth_uxn_opcodes_h_l2899_c40_05ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output,
 gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output,
 lth_uxn_opcodes_h_l2901_c40_be66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output,
 lth2_uxn_opcodes_h_l2902_c40_b95a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output,
 jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output,
 jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output,
 jcn_uxn_opcodes_h_l2905_c40_69c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output,
 jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output,
 jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output,
 jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output,
 sth_uxn_opcodes_h_l2909_c40_f3a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output,
 sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output,
 ldz_uxn_opcodes_h_l2911_c40_8d26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output,
 ldz2_uxn_opcodes_h_l2912_c40_193d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output,
 stz_uxn_opcodes_h_l2913_c40_1cbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output,
 stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output,
 ldr_uxn_opcodes_h_l2915_c40_7579_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output,
 ldr2_uxn_opcodes_h_l2916_c40_8646_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output,
 str1_uxn_opcodes_h_l2917_c40_5061_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output,
 str2_uxn_opcodes_h_l2918_c40_a620_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output,
 lda_uxn_opcodes_h_l2919_c40_3546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output,
 lda2_uxn_opcodes_h_l2920_c40_3139_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output,
 sta_uxn_opcodes_h_l2921_c40_c7d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output,
 sta2_uxn_opcodes_h_l2922_c40_df28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output,
 dei_uxn_opcodes_h_l2923_c40_69c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output,
 dei2_uxn_opcodes_h_l2924_c40_4f10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output,
 deo_uxn_opcodes_h_l2925_c40_6f4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output,
 deo2_uxn_opcodes_h_l2926_c40_89e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output,
 add_uxn_opcodes_h_l2927_c40_7095_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output,
 add2_uxn_opcodes_h_l2928_c40_2da5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output,
 sub1_uxn_opcodes_h_l2929_c40_b86a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output,
 sub2_uxn_opcodes_h_l2930_c40_817f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output,
 mul_uxn_opcodes_h_l2931_c40_4b1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output,
 mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output,
 div_uxn_opcodes_h_l2933_c40_688f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output,
 div2_uxn_opcodes_h_l2934_c40_8f7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output,
 and_uxn_opcodes_h_l2935_c40_c1db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output,
 and2_uxn_opcodes_h_l2936_c40_dcd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output,
 ora_uxn_opcodes_h_l2937_c40_eef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output,
 ora2_uxn_opcodes_h_l2938_c40_6913_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output,
 eor_uxn_opcodes_h_l2939_c40_80dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output,
 eor2_uxn_opcodes_h_l2940_c40_afee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output,
 sft_uxn_opcodes_h_l2941_c40_68a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output,
 sft2_uxn_opcodes_h_l2942_c40_0f74_return_output,
 CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output,
 sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output,
 sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output,
 MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output,
 MUX_uxn_opcodes_h_l2954_c20_4044_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output,
 stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_3979_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_3979_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2873_c48_db15_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2873_c48_db15_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_ae64_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_1269_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_1269_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_1269_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_c540_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_c540_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_c540_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_b396_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_b396_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_b396_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_834a_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_834a_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_834a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_1334_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_1334_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_1334_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_0468_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_0468_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_0468_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_8304_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_8304_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_8304_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_4118_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_4118_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_4118_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_e220_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_e220_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_e220_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_797d_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_797d_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_797d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_5fad_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_5fad_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_5fad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_05ff_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_05ff_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_05ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_be66_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_be66_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_be66_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_7579_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_5061_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_a620_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_3546_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_3139_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_df28_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_df28_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_df28_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_69c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_7095_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_7095_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_7095_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_2da5_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_2da5_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_2da5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_817f_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_817f_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_817f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_688f_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_688f_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_688f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c1db_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c1db_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c1db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_eef6_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_eef6_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_eef6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_6913_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_6913_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_6913_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_80dc_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_80dc_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_80dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_afee_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_afee_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_afee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_68a4_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_68a4_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_68a4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2944_c2_ca33 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_a37a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2950_c3_1d36 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2948_c3_206d : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_143e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_e48d_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_a5f6_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4044_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4044_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_8ecc_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_7c3d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_650d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_5f40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_6175_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_9f94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_7d17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_4f3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_6b32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_b67c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2950_l2948_DUPLICATE_a95a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_449e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_b524_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right := to_unsigned(55, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right := to_unsigned(11, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right := to_unsigned(59, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right := to_unsigned(43, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right := to_unsigned(224, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right := to_unsigned(21, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right := to_unsigned(23, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right := to_unsigned(48, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right := to_unsigned(35, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right := to_unsigned(54, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right := to_unsigned(0, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right := to_unsigned(31, 8);
     VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right := to_unsigned(14, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right := to_unsigned(17, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right := to_unsigned(34, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right := to_unsigned(58, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right := to_unsigned(51, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right := to_unsigned(96, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right := to_unsigned(26, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right := to_unsigned(15, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right := to_unsigned(40, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right := to_unsigned(3, 8);

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
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_ram_read := previous_ram_read;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2928_c40_2da5_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2927_c40_7095_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2935_c40_c1db_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2933_c40_688f_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2891_c40_e220_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2940_c40_afee_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2939_c40_80dc_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2895_c40_5fad_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2899_c40_05ff_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2881_c40_b396_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2901_c40_be66_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2885_c40_834a_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2938_c40_6913_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2937_c40_eef6_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2893_c40_797d_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2890_c40_4118_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2889_c40_8304_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2941_c40_68a4_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2922_c40_df28_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2930_c40_817f_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2888_c40_0468_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2887_c40_1334_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2876_c40_1269_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2879_c40_c540_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2928_c40_2da5_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2927_c40_7095_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2935_c40_c1db_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2873_c48_db15_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2933_c40_688f_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2891_c40_e220_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2940_c40_afee_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2939_c40_80dc_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2895_c40_5fad_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2899_c40_05ff_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2881_c40_b396_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2876_c40_1269_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2879_c40_c540_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2901_c40_be66_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2885_c40_834a_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2938_c40_6913_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2937_c40_eef6_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2893_c40_797d_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2890_c40_4118_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2889_c40_8304_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2941_c40_68a4_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2922_c40_df28_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2930_c40_817f_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2888_c40_0468_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2887_c40_1334_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0 := sp0;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0 := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1 := sp1;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1 := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2865_c14_695c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_left;
     BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output := BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2944_c16_425e] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output := CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output;

     -- brk[uxn_opcodes_h_l2873_c48_db15] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2873_c48_db15_phase <= VAR_brk_uxn_opcodes_h_l2873_c48_db15_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2873_c48_db15_return_output := brk_uxn_opcodes_h_l2873_c48_db15_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output;
     VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_695c_return_output;
     VAR_stack_index_uxn_opcodes_h_l2944_c2_ca33 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_425e_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue := VAR_brk_uxn_opcodes_h_l2873_c48_db15_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left := VAR_stack_index_uxn_opcodes_h_l2944_c2_ca33;
     -- BIN_OP_XOR[uxn_opcodes_h_l2866_c14_9ac2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_left;
     BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output := BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_9ac2_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2866_c14_9f2a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_left;
     BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output := BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_9f2a_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2866_c14_a70f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_a70f_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2866_c14_526f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2866_c14_3979_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_526f_return_output;
     -- MUX[uxn_opcodes_h_l2866_c14_3979] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2866_c14_3979_cond <= VAR_MUX_uxn_opcodes_h_l2866_c14_3979_cond;
     MUX_uxn_opcodes_h_l2866_c14_3979_iftrue <= VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iftrue;
     MUX_uxn_opcodes_h_l2866_c14_3979_iffalse <= VAR_MUX_uxn_opcodes_h_l2866_c14_3979_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2866_c14_3979_return_output := MUX_uxn_opcodes_h_l2866_c14_3979_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_cond := VAR_MUX_uxn_opcodes_h_l2866_c14_3979_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2866_c14_3979_return_output;
     -- MUX[uxn_opcodes_h_l2867_c8_c8e3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2867_c8_c8e3_cond <= VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_cond;
     MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue <= VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iftrue;
     MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse <= VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output := MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2867_c8_c8e3_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_c0c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_24a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_21df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_de73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_8939] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_081f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_7e95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_70fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_a9e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_5954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_845d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_beee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_f5c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_8a78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_7456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_04f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_512a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ecdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_09ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_79f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_6ddc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_2459] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_9734] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_4b48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_451c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_3e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_2ec5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_26a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_14a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_8451] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_292e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_c717] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_2b3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_43af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_cd4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_dea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_879a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_0916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_9459] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_97b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d44a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_fc95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_caf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_3ae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_bbf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_a99d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_a3df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_e1b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_a7b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_9b57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_60af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_7d08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_11cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_bef0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_e555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_b2b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c6_9c6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_41db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_4feb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_aced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_be84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c3aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_5f9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_e8ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_773e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_0c2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_fdc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1996] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_9c6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e744_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1996_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_be84_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_aced_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_24a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_9b57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_b2b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e1b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f5c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4b48_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_5f9a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_21df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_081f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_a99d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d44a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_7d08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_879a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_c0c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_60af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2ec5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_caf8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_79f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3e28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_70fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_7e95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_cd4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_845d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_dea0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_e8ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_4feb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_9734_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9459_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_512a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_2459_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_de73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_8451_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_a3df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ecdb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_292e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_43af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_a7b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_26a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_11cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_e555_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f291_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_bbf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_beee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_773e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_2b3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_c717_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_14a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_6ddc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_8939_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5954_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_0916_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c3aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7456_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_fc95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdc4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_a9e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_04f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_bef0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_451c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_41db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_0c2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_3ae3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_09ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_8a78_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_dff8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2873_c2_ff60] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_cond;
     is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output := is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_67de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_be52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_67de_return_output;
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_be52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_7429] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_38ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output;

     -- jci[uxn_opcodes_h_l2874_c40_ae64] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2874_c40_ae64_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2874_c40_ae64_phase <= VAR_jci_uxn_opcodes_h_l2874_c40_ae64_phase;
     jci_uxn_opcodes_h_l2874_c40_ae64_pc <= VAR_jci_uxn_opcodes_h_l2874_c40_ae64_pc;
     jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_stack_read;
     jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2874_c40_ae64_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2874_c40_ae64_return_output := jci_uxn_opcodes_h_l2874_c40_ae64_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output;
     VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_7429_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue := VAR_jci_uxn_opcodes_h_l2874_c40_ae64_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_2b80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output;

     -- jmi[uxn_opcodes_h_l2875_c40_b6ee] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2875_c40_b6ee_phase <= VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_phase;
     jmi_uxn_opcodes_h_l2875_c40_b6ee_pc <= VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_pc;
     jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output := jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ae37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output;
     VAR_jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ae37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue := VAR_jmi_uxn_opcodes_h_l2875_c40_b6ee_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_7d4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output;

     -- jsi[uxn_opcodes_h_l2876_c40_1269] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2876_c40_1269_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2876_c40_1269_phase <= VAR_jsi_uxn_opcodes_h_l2876_c40_1269_phase;
     jsi_uxn_opcodes_h_l2876_c40_1269_pc <= VAR_jsi_uxn_opcodes_h_l2876_c40_1269_pc;
     jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2876_c40_1269_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2876_c40_1269_return_output := jsi_uxn_opcodes_h_l2876_c40_1269_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_8f85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_7d4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue := VAR_jsi_uxn_opcodes_h_l2876_c40_1269_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_20b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_7604] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_f9b4] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_f9b4_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_phase;
     lit_uxn_opcodes_h_l2877_c40_f9b4_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_pc;
     lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_return_output := lit_uxn_opcodes_h_l2877_c40_f9b4_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_7604_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_f9b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_0611] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_ceee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_ba72] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_ba72_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_phase;
     lit2_uxn_opcodes_h_l2878_c40_ba72_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_pc;
     lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_return_output := lit2_uxn_opcodes_h_l2878_c40_ba72_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output;
     VAR_lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_0611_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_ba72_return_output;
     -- lit[uxn_opcodes_h_l2879_c40_c540] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2879_c40_c540_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2879_c40_c540_phase <= VAR_lit_uxn_opcodes_h_l2879_c40_c540_phase;
     lit_uxn_opcodes_h_l2879_c40_c540_pc <= VAR_lit_uxn_opcodes_h_l2879_c40_c540_pc;
     lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2879_c40_c540_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2879_c40_c540_return_output := lit_uxn_opcodes_h_l2879_c40_c540_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_58ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_2230] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output;
     VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2230_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue := VAR_lit_uxn_opcodes_h_l2879_c40_c540_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_9a94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_7ee5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output;

     -- lit2[uxn_opcodes_h_l2880_c40_bed3] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2880_c40_bed3_phase <= VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_phase;
     lit2_uxn_opcodes_h_l2880_c40_bed3_pc <= VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_pc;
     lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_return_output := lit2_uxn_opcodes_h_l2880_c40_bed3_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output;
     VAR_inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_9a94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue := VAR_lit2_uxn_opcodes_h_l2880_c40_bed3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_aae7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output;

     -- inc[uxn_opcodes_h_l2881_c40_b396] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2881_c40_b396_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2881_c40_b396_phase <= VAR_inc_uxn_opcodes_h_l2881_c40_b396_phase;
     inc_uxn_opcodes_h_l2881_c40_b396_ins <= VAR_inc_uxn_opcodes_h_l2881_c40_b396_ins;
     inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2881_c40_b396_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2881_c40_b396_return_output := inc_uxn_opcodes_h_l2881_c40_b396_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_530e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output;
     VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_530e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue := VAR_inc_uxn_opcodes_h_l2881_c40_b396_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_8c60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_3797] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output;

     -- inc2[uxn_opcodes_h_l2882_c40_f3b2] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2882_c40_f3b2_phase <= VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_phase;
     inc2_uxn_opcodes_h_l2882_c40_f3b2_ins <= VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_ins;
     inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output := inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output;
     VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3797_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue := VAR_inc2_uxn_opcodes_h_l2882_c40_f3b2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_a73c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a486] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output;

     -- pop[uxn_opcodes_h_l2883_c40_b5a0] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2883_c40_b5a0_phase <= VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_phase;
     pop_uxn_opcodes_h_l2883_c40_b5a0_ins <= VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_return_output := pop_uxn_opcodes_h_l2883_c40_b5a0_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output;
     VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a486_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue := VAR_pop_uxn_opcodes_h_l2883_c40_b5a0_return_output;
     -- pop2[uxn_opcodes_h_l2884_c40_ed6e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2884_c40_ed6e_phase <= VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_phase;
     pop2_uxn_opcodes_h_l2884_c40_ed6e_ins <= VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output := pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7bcd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_d29b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output;
     VAR_nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_d29b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue := VAR_pop2_uxn_opcodes_h_l2884_c40_ed6e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_d5e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_7b85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output;

     -- nip[uxn_opcodes_h_l2885_c40_834a] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2885_c40_834a_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2885_c40_834a_phase <= VAR_nip_uxn_opcodes_h_l2885_c40_834a_phase;
     nip_uxn_opcodes_h_l2885_c40_834a_ins <= VAR_nip_uxn_opcodes_h_l2885_c40_834a_ins;
     nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2885_c40_834a_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2885_c40_834a_return_output := nip_uxn_opcodes_h_l2885_c40_834a_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output;
     VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d5e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue := VAR_nip_uxn_opcodes_h_l2885_c40_834a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_f426] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_e58e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output;

     -- nip2[uxn_opcodes_h_l2886_c40_0d20] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2886_c40_0d20_phase <= VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_phase;
     nip2_uxn_opcodes_h_l2886_c40_0d20_ins <= VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_ins;
     nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_return_output := nip2_uxn_opcodes_h_l2886_c40_0d20_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_f426_return_output;
     VAR_swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e58e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue := VAR_nip2_uxn_opcodes_h_l2886_c40_0d20_return_output;
     -- swp[uxn_opcodes_h_l2887_c40_1334] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2887_c40_1334_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2887_c40_1334_phase <= VAR_swp_uxn_opcodes_h_l2887_c40_1334_phase;
     swp_uxn_opcodes_h_l2887_c40_1334_ins <= VAR_swp_uxn_opcodes_h_l2887_c40_1334_ins;
     swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2887_c40_1334_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2887_c40_1334_return_output := swp_uxn_opcodes_h_l2887_c40_1334_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_bd98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_e9b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output;
     VAR_swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_bd98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue := VAR_swp_uxn_opcodes_h_l2887_c40_1334_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_98a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_752f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output;

     -- swp2[uxn_opcodes_h_l2888_c40_0468] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2888_c40_0468_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2888_c40_0468_phase <= VAR_swp2_uxn_opcodes_h_l2888_c40_0468_phase;
     swp2_uxn_opcodes_h_l2888_c40_0468_ins <= VAR_swp2_uxn_opcodes_h_l2888_c40_0468_ins;
     swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2888_c40_0468_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2888_c40_0468_return_output := swp2_uxn_opcodes_h_l2888_c40_0468_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output;
     VAR_rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_752f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue := VAR_swp2_uxn_opcodes_h_l2888_c40_0468_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_7b3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_8fa8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output;

     -- rot[uxn_opcodes_h_l2889_c40_8304] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2889_c40_8304_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2889_c40_8304_phase <= VAR_rot_uxn_opcodes_h_l2889_c40_8304_phase;
     rot_uxn_opcodes_h_l2889_c40_8304_ins <= VAR_rot_uxn_opcodes_h_l2889_c40_8304_ins;
     rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2889_c40_8304_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2889_c40_8304_return_output := rot_uxn_opcodes_h_l2889_c40_8304_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output;
     VAR_rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_7b3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue := VAR_rot_uxn_opcodes_h_l2889_c40_8304_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_ef49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_0980] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output;

     -- rot2[uxn_opcodes_h_l2890_c40_4118] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2890_c40_4118_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2890_c40_4118_phase <= VAR_rot2_uxn_opcodes_h_l2890_c40_4118_phase;
     rot2_uxn_opcodes_h_l2890_c40_4118_ins <= VAR_rot2_uxn_opcodes_h_l2890_c40_4118_ins;
     rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2890_c40_4118_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2890_c40_4118_return_output := rot2_uxn_opcodes_h_l2890_c40_4118_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_0980_return_output;
     VAR_dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_ef49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue := VAR_rot2_uxn_opcodes_h_l2890_c40_4118_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_56f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_a466] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output;

     -- dup[uxn_opcodes_h_l2891_c40_e220] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2891_c40_e220_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2891_c40_e220_phase <= VAR_dup_uxn_opcodes_h_l2891_c40_e220_phase;
     dup_uxn_opcodes_h_l2891_c40_e220_ins <= VAR_dup_uxn_opcodes_h_l2891_c40_e220_ins;
     dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2891_c40_e220_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2891_c40_e220_return_output := dup_uxn_opcodes_h_l2891_c40_e220_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_a466_return_output;
     VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_56f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue := VAR_dup_uxn_opcodes_h_l2891_c40_e220_return_output;
     -- dup2[uxn_opcodes_h_l2892_c40_1c79] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2892_c40_1c79_phase <= VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_phase;
     dup2_uxn_opcodes_h_l2892_c40_1c79_ins <= VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_ins;
     dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_return_output := dup2_uxn_opcodes_h_l2892_c40_1c79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_b015] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_8ac2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b015_return_output;
     VAR_ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8ac2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue := VAR_dup2_uxn_opcodes_h_l2892_c40_1c79_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_4ae6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_18c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output;

     -- ovr[uxn_opcodes_h_l2893_c40_797d] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2893_c40_797d_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2893_c40_797d_phase <= VAR_ovr_uxn_opcodes_h_l2893_c40_797d_phase;
     ovr_uxn_opcodes_h_l2893_c40_797d_ins <= VAR_ovr_uxn_opcodes_h_l2893_c40_797d_ins;
     ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2893_c40_797d_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2893_c40_797d_return_output := ovr_uxn_opcodes_h_l2893_c40_797d_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_4ae6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue := VAR_ovr_uxn_opcodes_h_l2893_c40_797d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_7508] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_ee1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output;

     -- ovr2[uxn_opcodes_h_l2894_c40_0a78] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2894_c40_0a78_phase <= VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_phase;
     ovr2_uxn_opcodes_h_l2894_c40_0a78_ins <= VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_ins;
     ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output := ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output;
     VAR_equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7508_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue := VAR_ovr2_uxn_opcodes_h_l2894_c40_0a78_return_output;
     -- equ[uxn_opcodes_h_l2895_c40_5fad] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2895_c40_5fad_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2895_c40_5fad_phase <= VAR_equ_uxn_opcodes_h_l2895_c40_5fad_phase;
     equ_uxn_opcodes_h_l2895_c40_5fad_ins <= VAR_equ_uxn_opcodes_h_l2895_c40_5fad_ins;
     equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2895_c40_5fad_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2895_c40_5fad_return_output := equ_uxn_opcodes_h_l2895_c40_5fad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_2179] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_62b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_2179_return_output;
     VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_62b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue := VAR_equ_uxn_opcodes_h_l2895_c40_5fad_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_3521] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output;

     -- equ2[uxn_opcodes_h_l2896_c40_52ab] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2896_c40_52ab_phase <= VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_phase;
     equ2_uxn_opcodes_h_l2896_c40_52ab_ins <= VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_ins;
     equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_return_output := equ2_uxn_opcodes_h_l2896_c40_52ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_647b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_3521_return_output;
     VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_647b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue := VAR_equ2_uxn_opcodes_h_l2896_c40_52ab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_8047] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output;

     -- neq[uxn_opcodes_h_l2897_c40_dfcf] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2897_c40_dfcf_phase <= VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_phase;
     neq_uxn_opcodes_h_l2897_c40_dfcf_ins <= VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_ins;
     neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_return_output := neq_uxn_opcodes_h_l2897_c40_dfcf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_274d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8047_return_output;
     VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_274d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue := VAR_neq_uxn_opcodes_h_l2897_c40_dfcf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_fa1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output;

     -- neq2[uxn_opcodes_h_l2898_c40_1f47] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2898_c40_1f47_phase <= VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_phase;
     neq2_uxn_opcodes_h_l2898_c40_1f47_ins <= VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_ins;
     neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_return_output := neq2_uxn_opcodes_h_l2898_c40_1f47_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_69c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output;
     VAR_gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_fa1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue := VAR_neq2_uxn_opcodes_h_l2898_c40_1f47_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_ca10] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_7b9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output;

     -- gth[uxn_opcodes_h_l2899_c40_05ff] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2899_c40_05ff_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2899_c40_05ff_phase <= VAR_gth_uxn_opcodes_h_l2899_c40_05ff_phase;
     gth_uxn_opcodes_h_l2899_c40_05ff_ins <= VAR_gth_uxn_opcodes_h_l2899_c40_05ff_ins;
     gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2899_c40_05ff_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2899_c40_05ff_return_output := gth_uxn_opcodes_h_l2899_c40_05ff_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output;
     VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_ca10_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue := VAR_gth_uxn_opcodes_h_l2899_c40_05ff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_b7b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_ff34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output;

     -- gth2[uxn_opcodes_h_l2900_c40_9bb6] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2900_c40_9bb6_phase <= VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_phase;
     gth2_uxn_opcodes_h_l2900_c40_9bb6_ins <= VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_ins;
     gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output := gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output;
     VAR_lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_ff34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue := VAR_gth2_uxn_opcodes_h_l2900_c40_9bb6_return_output;
     -- lth[uxn_opcodes_h_l2901_c40_be66] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2901_c40_be66_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2901_c40_be66_phase <= VAR_lth_uxn_opcodes_h_l2901_c40_be66_phase;
     lth_uxn_opcodes_h_l2901_c40_be66_ins <= VAR_lth_uxn_opcodes_h_l2901_c40_be66_ins;
     lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2901_c40_be66_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2901_c40_be66_return_output := lth_uxn_opcodes_h_l2901_c40_be66_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0c90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_478b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output;
     VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_478b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue := VAR_lth_uxn_opcodes_h_l2901_c40_be66_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_2679] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ac0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output;

     -- lth2[uxn_opcodes_h_l2902_c40_b95a] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2902_c40_b95a_phase <= VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_phase;
     lth2_uxn_opcodes_h_l2902_c40_b95a_ins <= VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_ins;
     lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_return_output := lth2_uxn_opcodes_h_l2902_c40_b95a_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_2679_return_output;
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ac0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue := VAR_lth2_uxn_opcodes_h_l2902_c40_b95a_return_output;
     -- jmp[uxn_opcodes_h_l2903_c40_4f3a] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2903_c40_4f3a_phase <= VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_phase;
     jmp_uxn_opcodes_h_l2903_c40_4f3a_ins <= VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_ins;
     jmp_uxn_opcodes_h_l2903_c40_4f3a_pc <= VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_pc;
     jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output := jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_3794] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_d1de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3794_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue := VAR_jmp_uxn_opcodes_h_l2903_c40_4f3a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_1238] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output;

     -- jmp2[uxn_opcodes_h_l2904_c40_5e00] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2904_c40_5e00_phase <= VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_phase;
     jmp2_uxn_opcodes_h_l2904_c40_5e00_ins <= VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_ins;
     jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output := jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_a283] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1238_return_output;
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_a283_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue := VAR_jmp2_uxn_opcodes_h_l2904_c40_5e00_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_0bd5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output;

     -- jcn[uxn_opcodes_h_l2905_c40_69c5] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2905_c40_69c5_phase <= VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_phase;
     jcn_uxn_opcodes_h_l2905_c40_69c5_ins <= VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_ins;
     jcn_uxn_opcodes_h_l2905_c40_69c5_pc <= VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_pc;
     jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_return_output := jcn_uxn_opcodes_h_l2905_c40_69c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_fe8a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_fe8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue := VAR_jcn_uxn_opcodes_h_l2905_c40_69c5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_3ded] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_33c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output;

     -- jcn2[uxn_opcodes_h_l2906_c40_0a72] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2906_c40_0a72_phase <= VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_phase;
     jcn2_uxn_opcodes_h_l2906_c40_0a72_ins <= VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_ins;
     jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output := jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output;
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_33c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue := VAR_jcn2_uxn_opcodes_h_l2906_c40_0a72_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_c995] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_2c86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output;

     -- jsr[uxn_opcodes_h_l2907_c40_2fa6] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2907_c40_2fa6_phase <= VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_phase;
     jsr_uxn_opcodes_h_l2907_c40_2fa6_ins <= VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_ins;
     jsr_uxn_opcodes_h_l2907_c40_2fa6_pc <= VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_pc;
     jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output := jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_c995_return_output;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2c86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue := VAR_jsr_uxn_opcodes_h_l2907_c40_2fa6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_8c03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_e2fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output;

     -- jsr2[uxn_opcodes_h_l2908_c40_95e3] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2908_c40_95e3_phase <= VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_phase;
     jsr2_uxn_opcodes_h_l2908_c40_95e3_ins <= VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_ins;
     jsr2_uxn_opcodes_h_l2908_c40_95e3_pc <= VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_pc;
     jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output := jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output;
     VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8c03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue := VAR_jsr2_uxn_opcodes_h_l2908_c40_95e3_return_output;
     -- sth[uxn_opcodes_h_l2909_c40_f3a2] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2909_c40_f3a2_phase <= VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_phase;
     sth_uxn_opcodes_h_l2909_c40_f3a2_ins <= VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_ins;
     sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_return_output := sth_uxn_opcodes_h_l2909_c40_f3a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_9c93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_1551] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_1551_return_output;
     VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_9c93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue := VAR_sth_uxn_opcodes_h_l2909_c40_f3a2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_dd92] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_e350] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output;

     -- sth2[uxn_opcodes_h_l2910_c40_9dc1] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2910_c40_9dc1_phase <= VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_phase;
     sth2_uxn_opcodes_h_l2910_c40_9dc1_ins <= VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_ins;
     sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output := sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output;
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_e350_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue := VAR_sth2_uxn_opcodes_h_l2910_c40_9dc1_return_output;
     -- ldz[uxn_opcodes_h_l2911_c40_8d26] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2911_c40_8d26_phase <= VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_phase;
     ldz_uxn_opcodes_h_l2911_c40_8d26_ins <= VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_ins;
     ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_stack_read;
     ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_return_output := ldz_uxn_opcodes_h_l2911_c40_8d26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_c9db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_08dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c9db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue := VAR_ldz_uxn_opcodes_h_l2911_c40_8d26_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_c32f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0627] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output;

     -- ldz2[uxn_opcodes_h_l2912_c40_193d] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2912_c40_193d_phase <= VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_phase;
     ldz2_uxn_opcodes_h_l2912_c40_193d_ins <= VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_ins;
     ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_stack_read;
     ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_return_output := ldz2_uxn_opcodes_h_l2912_c40_193d_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output;
     VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0627_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue := VAR_ldz2_uxn_opcodes_h_l2912_c40_193d_return_output;
     -- stz[uxn_opcodes_h_l2913_c40_1cbd] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2913_c40_1cbd_phase <= VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_phase;
     stz_uxn_opcodes_h_l2913_c40_1cbd_ins <= VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_ins;
     stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_return_output := stz_uxn_opcodes_h_l2913_c40_1cbd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_b932] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_0ecd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output;
     VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b932_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue := VAR_stz_uxn_opcodes_h_l2913_c40_1cbd_return_output;
     -- stz2[uxn_opcodes_h_l2914_c40_6c0b] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2914_c40_6c0b_phase <= VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_phase;
     stz2_uxn_opcodes_h_l2914_c40_6c0b_ins <= VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_ins;
     stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output := stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_ce33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_008b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output;
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_008b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue := VAR_stz2_uxn_opcodes_h_l2914_c40_6c0b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_dbb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output;

     -- ldr[uxn_opcodes_h_l2915_c40_7579] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2915_c40_7579_phase <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_phase;
     ldr_uxn_opcodes_h_l2915_c40_7579_ins <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_ins;
     ldr_uxn_opcodes_h_l2915_c40_7579_pc <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_pc;
     ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_stack_read;
     ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2915_c40_7579_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2915_c40_7579_return_output := ldr_uxn_opcodes_h_l2915_c40_7579_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_7086] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_7086_return_output;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_dbb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue := VAR_ldr_uxn_opcodes_h_l2915_c40_7579_return_output;
     -- ldr2[uxn_opcodes_h_l2916_c40_8646] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2916_c40_8646_phase <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_phase;
     ldr2_uxn_opcodes_h_l2916_c40_8646_ins <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_ins;
     ldr2_uxn_opcodes_h_l2916_c40_8646_pc <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_pc;
     ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_stack_read;
     ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_return_output := ldr2_uxn_opcodes_h_l2916_c40_8646_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_9152] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_14fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_9152_return_output;
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_14fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue := VAR_ldr2_uxn_opcodes_h_l2916_c40_8646_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_5804] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output;

     -- str1[uxn_opcodes_h_l2917_c40_5061] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2917_c40_5061_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2917_c40_5061_phase <= VAR_str1_uxn_opcodes_h_l2917_c40_5061_phase;
     str1_uxn_opcodes_h_l2917_c40_5061_ins <= VAR_str1_uxn_opcodes_h_l2917_c40_5061_ins;
     str1_uxn_opcodes_h_l2917_c40_5061_pc <= VAR_str1_uxn_opcodes_h_l2917_c40_5061_pc;
     str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2917_c40_5061_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2917_c40_5061_return_output := str1_uxn_opcodes_h_l2917_c40_5061_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_8da9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_5804_return_output;
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_8da9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue := VAR_str1_uxn_opcodes_h_l2917_c40_5061_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_21c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output;

     -- str2[uxn_opcodes_h_l2918_c40_a620] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2918_c40_a620_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2918_c40_a620_phase <= VAR_str2_uxn_opcodes_h_l2918_c40_a620_phase;
     str2_uxn_opcodes_h_l2918_c40_a620_ins <= VAR_str2_uxn_opcodes_h_l2918_c40_a620_ins;
     str2_uxn_opcodes_h_l2918_c40_a620_pc <= VAR_str2_uxn_opcodes_h_l2918_c40_a620_pc;
     str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2918_c40_a620_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2918_c40_a620_return_output := str2_uxn_opcodes_h_l2918_c40_a620_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_8848] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_8848_return_output;
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_21c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue := VAR_str2_uxn_opcodes_h_l2918_c40_a620_return_output;
     -- lda[uxn_opcodes_h_l2919_c40_3546] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2919_c40_3546_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2919_c40_3546_phase <= VAR_lda_uxn_opcodes_h_l2919_c40_3546_phase;
     lda_uxn_opcodes_h_l2919_c40_3546_ins <= VAR_lda_uxn_opcodes_h_l2919_c40_3546_ins;
     lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_stack_read;
     lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2919_c40_3546_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2919_c40_3546_return_output := lda_uxn_opcodes_h_l2919_c40_3546_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b9ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_c379] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_c379_return_output;
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b9ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue := VAR_lda_uxn_opcodes_h_l2919_c40_3546_return_output;
     -- lda2[uxn_opcodes_h_l2920_c40_3139] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2920_c40_3139_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2920_c40_3139_phase <= VAR_lda2_uxn_opcodes_h_l2920_c40_3139_phase;
     lda2_uxn_opcodes_h_l2920_c40_3139_ins <= VAR_lda2_uxn_opcodes_h_l2920_c40_3139_ins;
     lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_stack_read;
     lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2920_c40_3139_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2920_c40_3139_return_output := lda2_uxn_opcodes_h_l2920_c40_3139_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_95ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f170] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output;
     VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f170_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue := VAR_lda2_uxn_opcodes_h_l2920_c40_3139_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_56dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output;

     -- sta[uxn_opcodes_h_l2921_c40_c7d8] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2921_c40_c7d8_phase <= VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_phase;
     sta_uxn_opcodes_h_l2921_c40_c7d8_ins <= VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_ins;
     sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_return_output := sta_uxn_opcodes_h_l2921_c40_c7d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f49a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output;
     VAR_sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_56dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue := VAR_sta_uxn_opcodes_h_l2921_c40_c7d8_return_output;
     -- sta2[uxn_opcodes_h_l2922_c40_df28] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2922_c40_df28_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2922_c40_df28_phase <= VAR_sta2_uxn_opcodes_h_l2922_c40_df28_phase;
     sta2_uxn_opcodes_h_l2922_c40_df28_ins <= VAR_sta2_uxn_opcodes_h_l2922_c40_df28_ins;
     sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2922_c40_df28_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2922_c40_df28_return_output := sta2_uxn_opcodes_h_l2922_c40_df28_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_94d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_6be2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output;
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_94d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue := VAR_sta2_uxn_opcodes_h_l2922_c40_df28_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_cd63] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output;

     -- dei[uxn_opcodes_h_l2923_c40_69c7] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2923_c40_69c7_phase <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_phase;
     dei_uxn_opcodes_h_l2923_c40_69c7_ins <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_ins;
     dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_controller0_buttons;
     dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0 <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr0;
     dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1 <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_stack_ptr1;
     dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_stack_read;
     dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2923_c40_69c7_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2923_c40_69c7_return_output := dei_uxn_opcodes_h_l2923_c40_69c7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_3048] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3048_return_output;
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_cd63_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue := VAR_dei_uxn_opcodes_h_l2923_c40_69c7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_1d92] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output;

     -- dei2[uxn_opcodes_h_l2924_c40_4f10] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2924_c40_4f10_phase <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_phase;
     dei2_uxn_opcodes_h_l2924_c40_4f10_ins <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_ins;
     dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_controller0_buttons;
     dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0 <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr0;
     dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1 <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_stack_ptr1;
     dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_stack_read;
     dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_return_output := dei2_uxn_opcodes_h_l2924_c40_4f10_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_d4c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output;
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_1d92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue := VAR_dei2_uxn_opcodes_h_l2924_c40_4f10_return_output;
     -- deo[uxn_opcodes_h_l2925_c40_6f4b] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2925_c40_6f4b_phase <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_phase;
     deo_uxn_opcodes_h_l2925_c40_6f4b_ins <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_ins;
     deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_stack_read;
     deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_device_ram_read;
     deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_return_output := deo_uxn_opcodes_h_l2925_c40_6f4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_3875] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_7cd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output;
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_3875_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue := VAR_deo_uxn_opcodes_h_l2925_c40_6f4b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e095] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_5b90] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output;

     -- deo2[uxn_opcodes_h_l2926_c40_89e9] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2926_c40_89e9_phase <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_phase;
     deo2_uxn_opcodes_h_l2926_c40_89e9_ins <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_ins;
     deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_stack_read;
     deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_return_output := deo2_uxn_opcodes_h_l2926_c40_89e9_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e095_return_output;
     VAR_add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_5b90_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue := VAR_deo2_uxn_opcodes_h_l2926_c40_89e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_fe22] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_b5d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output;

     -- add[uxn_opcodes_h_l2927_c40_7095] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2927_c40_7095_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2927_c40_7095_phase <= VAR_add_uxn_opcodes_h_l2927_c40_7095_phase;
     add_uxn_opcodes_h_l2927_c40_7095_ins <= VAR_add_uxn_opcodes_h_l2927_c40_7095_ins;
     add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read <= VAR_add_uxn_opcodes_h_l2927_c40_7095_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2927_c40_7095_return_output := add_uxn_opcodes_h_l2927_c40_7095_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output;
     VAR_add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_b5d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue := VAR_add_uxn_opcodes_h_l2927_c40_7095_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_4d08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output;

     -- add2[uxn_opcodes_h_l2928_c40_2da5] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2928_c40_2da5_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2928_c40_2da5_phase <= VAR_add2_uxn_opcodes_h_l2928_c40_2da5_phase;
     add2_uxn_opcodes_h_l2928_c40_2da5_ins <= VAR_add2_uxn_opcodes_h_l2928_c40_2da5_ins;
     add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2928_c40_2da5_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2928_c40_2da5_return_output := add2_uxn_opcodes_h_l2928_c40_2da5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_9bda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output;
     VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_4d08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue := VAR_add2_uxn_opcodes_h_l2928_c40_2da5_return_output;
     -- sub1[uxn_opcodes_h_l2929_c40_b86a] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2929_c40_b86a_phase <= VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_phase;
     sub1_uxn_opcodes_h_l2929_c40_b86a_ins <= VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_ins;
     sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_return_output := sub1_uxn_opcodes_h_l2929_c40_b86a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_7403] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_907e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_907e_return_output;
     VAR_sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_7403_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue := VAR_sub1_uxn_opcodes_h_l2929_c40_b86a_return_output;
     -- sub2[uxn_opcodes_h_l2930_c40_817f] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2930_c40_817f_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2930_c40_817f_phase <= VAR_sub2_uxn_opcodes_h_l2930_c40_817f_phase;
     sub2_uxn_opcodes_h_l2930_c40_817f_ins <= VAR_sub2_uxn_opcodes_h_l2930_c40_817f_ins;
     sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2930_c40_817f_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2930_c40_817f_return_output := sub2_uxn_opcodes_h_l2930_c40_817f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_05f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_cd58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output;
     VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_cd58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue := VAR_sub2_uxn_opcodes_h_l2930_c40_817f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_9774] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_b51a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output;

     -- mul[uxn_opcodes_h_l2931_c40_4b1b] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2931_c40_4b1b_phase <= VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_phase;
     mul_uxn_opcodes_h_l2931_c40_4b1b_ins <= VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_ins;
     mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_return_output := mul_uxn_opcodes_h_l2931_c40_4b1b_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output;
     VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_9774_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue := VAR_mul_uxn_opcodes_h_l2931_c40_4b1b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_dbbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b7ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output;

     -- mul2[uxn_opcodes_h_l2932_c40_9fbb] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2932_c40_9fbb_phase <= VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_phase;
     mul2_uxn_opcodes_h_l2932_c40_9fbb_ins <= VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_ins;
     mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output := mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output;
     VAR_div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b7ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue := VAR_mul2_uxn_opcodes_h_l2932_c40_9fbb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_7242] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_9a1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output;

     -- div[uxn_opcodes_h_l2933_c40_688f] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2933_c40_688f_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2933_c40_688f_phase <= VAR_div_uxn_opcodes_h_l2933_c40_688f_phase;
     div_uxn_opcodes_h_l2933_c40_688f_ins <= VAR_div_uxn_opcodes_h_l2933_c40_688f_ins;
     div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read <= VAR_div_uxn_opcodes_h_l2933_c40_688f_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2933_c40_688f_return_output := div_uxn_opcodes_h_l2933_c40_688f_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output;
     VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_7242_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue := VAR_div_uxn_opcodes_h_l2933_c40_688f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_047c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_f7d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output;

     -- div2[uxn_opcodes_h_l2934_c40_8f7b] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2934_c40_8f7b_phase <= VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_phase;
     div2_uxn_opcodes_h_l2934_c40_8f7b_ins <= VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_ins;
     div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_return_output := div2_uxn_opcodes_h_l2934_c40_8f7b_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output;
     VAR_and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_047c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue := VAR_div2_uxn_opcodes_h_l2934_c40_8f7b_return_output;
     -- and[uxn_opcodes_h_l2935_c40_c1db] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2935_c40_c1db_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2935_c40_c1db_phase <= VAR_and_uxn_opcodes_h_l2935_c40_c1db_phase;
     and_uxn_opcodes_h_l2935_c40_c1db_ins <= VAR_and_uxn_opcodes_h_l2935_c40_c1db_ins;
     and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read <= VAR_and_uxn_opcodes_h_l2935_c40_c1db_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2935_c40_c1db_return_output := and_uxn_opcodes_h_l2935_c40_c1db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_c91f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_853e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output;
     VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_853e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue := VAR_and_uxn_opcodes_h_l2935_c40_c1db_return_output;
     -- and2[uxn_opcodes_h_l2936_c40_dcd6] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2936_c40_dcd6_phase <= VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_phase;
     and2_uxn_opcodes_h_l2936_c40_dcd6_ins <= VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_ins;
     and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_return_output := and2_uxn_opcodes_h_l2936_c40_dcd6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_830e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_6b11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output;
     VAR_ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_830e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue := VAR_and2_uxn_opcodes_h_l2936_c40_dcd6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_2462] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output;

     -- ora[uxn_opcodes_h_l2937_c40_eef6] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2937_c40_eef6_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2937_c40_eef6_phase <= VAR_ora_uxn_opcodes_h_l2937_c40_eef6_phase;
     ora_uxn_opcodes_h_l2937_c40_eef6_ins <= VAR_ora_uxn_opcodes_h_l2937_c40_eef6_ins;
     ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2937_c40_eef6_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2937_c40_eef6_return_output := ora_uxn_opcodes_h_l2937_c40_eef6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_8555] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_2462_return_output;
     VAR_ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_8555_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue := VAR_ora_uxn_opcodes_h_l2937_c40_eef6_return_output;
     -- ora2[uxn_opcodes_h_l2938_c40_6913] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2938_c40_6913_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2938_c40_6913_phase <= VAR_ora2_uxn_opcodes_h_l2938_c40_6913_phase;
     ora2_uxn_opcodes_h_l2938_c40_6913_ins <= VAR_ora2_uxn_opcodes_h_l2938_c40_6913_ins;
     ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2938_c40_6913_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2938_c40_6913_return_output := ora2_uxn_opcodes_h_l2938_c40_6913_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_8ff2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_3b27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output;
     VAR_eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_3b27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue := VAR_ora2_uxn_opcodes_h_l2938_c40_6913_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_81c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_a5ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output;

     -- eor[uxn_opcodes_h_l2939_c40_80dc] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2939_c40_80dc_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2939_c40_80dc_phase <= VAR_eor_uxn_opcodes_h_l2939_c40_80dc_phase;
     eor_uxn_opcodes_h_l2939_c40_80dc_ins <= VAR_eor_uxn_opcodes_h_l2939_c40_80dc_ins;
     eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2939_c40_80dc_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2939_c40_80dc_return_output := eor_uxn_opcodes_h_l2939_c40_80dc_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output;
     VAR_eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_81c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue := VAR_eor_uxn_opcodes_h_l2939_c40_80dc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_0dd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output;

     -- eor2[uxn_opcodes_h_l2940_c40_afee] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2940_c40_afee_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2940_c40_afee_phase <= VAR_eor2_uxn_opcodes_h_l2940_c40_afee_phase;
     eor2_uxn_opcodes_h_l2940_c40_afee_ins <= VAR_eor2_uxn_opcodes_h_l2940_c40_afee_ins;
     eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2940_c40_afee_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2940_c40_afee_return_output := eor2_uxn_opcodes_h_l2940_c40_afee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_0a2e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output;
     VAR_sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_0a2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue := VAR_eor2_uxn_opcodes_h_l2940_c40_afee_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_3353] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output;

     -- sft[uxn_opcodes_h_l2941_c40_68a4] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2941_c40_68a4_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2941_c40_68a4_phase <= VAR_sft_uxn_opcodes_h_l2941_c40_68a4_phase;
     sft_uxn_opcodes_h_l2941_c40_68a4_ins <= VAR_sft_uxn_opcodes_h_l2941_c40_68a4_ins;
     sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2941_c40_68a4_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2941_c40_68a4_return_output := sft_uxn_opcodes_h_l2941_c40_68a4_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_3353_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue := VAR_sft_uxn_opcodes_h_l2941_c40_68a4_return_output;
     -- sft2[uxn_opcodes_h_l2942_c40_0f74] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2942_c40_0f74_phase <= VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_phase;
     sft2_uxn_opcodes_h_l2942_c40_0f74_ins <= VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_ins;
     sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_return_output := sft2_uxn_opcodes_h_l2942_c40_0f74_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue := VAR_sft2_uxn_opcodes_h_l2942_c40_0f74_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_0dd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_0dd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_a5ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_a5ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_8ff2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_8ff2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_2462] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_2462_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_6b11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_6b11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_c91f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_c91f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_f7d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_f7d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_9a1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_9a1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_dbbc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbbc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_b51a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b51a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_05f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_05f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_907e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_907e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_9bda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_9bda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_fe22] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_fe22_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_e095] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e095_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_7cd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_7cd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_d4c3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_d4c3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_3048] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3048_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_6be2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6be2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_f49a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f49a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_95ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_95ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_c379] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_c379_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_8848] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_8848_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_5804] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_5804_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_9152] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_9152_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_7086] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_7086_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_ce33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_ce33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_0ecd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0ecd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_c32f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c32f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_08dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_08dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_dd92] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dd92_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_1551] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_1551_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_e2fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_e2fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_c995] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_c995_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_3ded] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_3ded_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_0bd5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_0bd5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_1238] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1238_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_d1de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_d1de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_2679] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_2679_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_0c90] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0c90_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_b7b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_b7b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_7b9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7b9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_69c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_69c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_8047] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8047_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_3521] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_3521_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_2179] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_2179_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_ee1c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_ee1c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_18c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_18c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_b015] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b015_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_a466] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_a466_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_0980] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_0980_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_8fa8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_8fa8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_98a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_98a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_e9b9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_e9b9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_f426] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_f426_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_7b85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_7b85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_7bcd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7bcd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_a73c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_a73c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_8c60] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c60_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_aae7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_aae7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_7ee5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_7ee5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_58ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_58ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_ceee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_ceee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_20b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_20b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_8f85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8f85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_2b80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_38ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_38ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_67de] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_67de_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_dff8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_dff8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c2_ff60] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2965_c34_5f40] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_5f40_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2964_c40_650d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_650d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2968_c34_7d17] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_7d17_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2959_c3_8ecc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_8ecc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2963_c39_7c3d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_7c3d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2966_c30_6175] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_6175_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2945_c17_a37a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_a37a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2969_c37_4f3c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_4f3c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.vram_write_layer;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2953_c68_e48d] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_e48d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2967_c33_9f94] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_9f94_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2971_c32_6b32] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_6b32_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_449e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_449e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_b67c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_b67c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output.sp_relative_shift;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_a37a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_8ecc_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_449e_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2950_l2948_DUPLICATE_a95a LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2950_l2948_DUPLICATE_a95a_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_b67c_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_b524 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_b524_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_ff60_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_7c3d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_650d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_5f40_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_6175_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_9f94_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_7d17_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_4f3c_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_449e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_6b32_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2945_c2_e554] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_left;
     BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output := BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2953_c58_a5f6] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_a5f6_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_e48d_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;
     VAR_MUX_uxn_opcodes_h_l2954_c20_4044_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_e554_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2950_l2948_DUPLICATE_a95a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2950_l2948_DUPLICATE_a95a_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_a5f6_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_b524_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_b524_return_output;
     -- MUX[uxn_opcodes_h_l2954_c20_4044] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2954_c20_4044_cond <= VAR_MUX_uxn_opcodes_h_l2954_c20_4044_cond;
     MUX_uxn_opcodes_h_l2954_c20_4044_iftrue <= VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iftrue;
     MUX_uxn_opcodes_h_l2954_c20_4044_iffalse <= VAR_MUX_uxn_opcodes_h_l2954_c20_4044_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2954_c20_4044_return_output := MUX_uxn_opcodes_h_l2954_c20_4044_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2950_c3_c9e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_0f64] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2948_c3_206d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0f64_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2950_c3_1d36 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_c9e1_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right := VAR_MUX_uxn_opcodes_h_l2954_c20_4044_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse := VAR_sp0_uxn_opcodes_h_l2950_c3_1d36;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue := VAR_sp1_uxn_opcodes_h_l2948_c3_206d;
     -- sp1_MUX[uxn_opcodes_h_l2947_c2_6490] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_cond;
     sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue;
     sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output := sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2947_c2_6490] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_cond;
     sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iftrue;
     sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output := sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_6490_return_output;
     -- MUX[uxn_opcodes_h_l2953_c29_a7ff] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c29_a7ff_cond <= VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_cond;
     MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iftrue;
     MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output := MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2953_c19_143e] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_143e_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2953_c29_a7ff_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_143e_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2953_c19_887a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_887a_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2954_c2_8105] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_left;
     BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output := BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_8105_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2956_c24_1f45] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_stack_address;
     stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_value;
     stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output := stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_1f45_return_output;
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
