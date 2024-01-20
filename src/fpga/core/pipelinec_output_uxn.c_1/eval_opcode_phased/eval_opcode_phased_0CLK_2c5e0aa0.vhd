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
entity eval_opcode_phased_0CLK_2c5e0aa0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_2c5e0aa0;
architecture arch of eval_opcode_phased_0CLK_2c5e0aa0 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2864_c14_0200]
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_5cab]
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2865_c14_cf57]
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_4709]
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_2761]
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c14_492e]
signal MUX_uxn_opcodes_h_l2865_c14_492e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_492e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_492e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_492e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2866_c8_ce4c]
signal MUX_uxn_opcodes_h_l2866_c8_ce4c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_9475]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_1e9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c2_cd23]
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2872_c2_cd23]
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2872_c48_6685]
signal brk_uxn_opcodes_h_l2872_c48_6685_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2872_c48_6685_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_6aaa]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_51bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_0e80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_1e9c]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2873_c40_73f0]
signal jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_73f0_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_73f0_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_73f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_a9f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_1fb7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_61e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_0e80]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2874_c40_bb92]
signal jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_bb92_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_bb92_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_bb92_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_be4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_1e17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_df0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_61e3]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2875_c40_bea9]
signal jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_bea9_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_bea9_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_bea9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_618b]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ee47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_d09a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_df0d]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2876_c40_b389]
signal lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_b389_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_b389_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_b389_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_69aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_fd8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_37c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_d09a]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2877_c40_0bfe]
signal lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_0bfe_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_0bfe_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_63f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5bbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_611d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_37c3]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2878_c40_1cb4]
signal lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_1cb4_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_1cb4_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_1cb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_e612]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_5583]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_14b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_611d]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2879_c40_b1c5]
signal lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_b1c5_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_b1c5_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_1cab]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_1c2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_c00b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_14b3]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2880_c40_1391]
signal inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1391_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1391_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_1391_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_e0db]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_3740]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_ba1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_c00b]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2881_c40_736a]
signal inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_736a_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_736a_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_736a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_1dd5]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_1250]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_806e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_ba1a]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2882_c40_017d]
signal pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_017d_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_017d_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_017d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_3d58]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_1eab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_4535]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_806e]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2883_c40_0194]
signal pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_0194_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_0194_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_0194_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_cf91]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_8efe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_adab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_4535]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2884_c40_413b]
signal nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_413b_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_413b_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_413b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_c45a]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_c7f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_8a77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_adab]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2885_c40_3922]
signal nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_3922_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_3922_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_3922_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_cab5]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_0e9f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_9153]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_8a77]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2886_c40_5928]
signal swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_5928_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_5928_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_5928_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_3c57]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_e101]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3b1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_9153]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2887_c40_67be]
signal swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_67be_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_67be_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_67be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_650a]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_d88a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_c9b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_3b1c]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2888_c40_f2d3]
signal rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_f2d3_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_f2d3_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_f2d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_f8d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_cc1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_dd96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_c9b9]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2889_c40_e0ab]
signal rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_e0ab_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_e0ab_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_3e75]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_012f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_0ed8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_dd96]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2890_c40_efea]
signal dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_efea_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_efea_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_efea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_531f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_2821]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_0ed8]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2891_c40_2aad]
signal dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_2aad_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_2aad_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_2aad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_cadb]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_6b03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f859]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_2821]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2892_c40_b785]
signal ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_b785_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_b785_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_b785_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_c109]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_3c68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_832e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_f859]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2893_c40_5307]
signal ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_5307_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_5307_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_5307_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_066a]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_7551]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_4d29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_832e]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2894_c40_e500]
signal equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_e500_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_e500_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_e500_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_a002]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_a8f3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_6ef5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_4d29]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2895_c40_a9b9]
signal equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_a9b9_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_a9b9_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_4ef1]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_d8d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7860]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_6ef5]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2896_c40_bc1b]
signal neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_bc1b_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_bc1b_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_bc1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_abd0]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_aca8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_5597]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_7860]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2897_c40_38e0]
signal neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_38e0_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_38e0_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_38e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_e1ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_f1d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_723a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_5597]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2898_c40_21f2]
signal gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_21f2_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_21f2_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_21f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_720e]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_9335]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_d2c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_723a]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2899_c40_7de4]
signal gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7de4_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7de4_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7de4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_23c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_01e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_7d75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_d2c5]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2900_c40_3d9e]
signal lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_3d9e_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_3d9e_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_3d9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_e711]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_d49b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_6993]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_7d75]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2901_c40_d135]
signal lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_d135_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_d135_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_d135_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_b7d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_a3c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0dae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_6993]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2902_c40_3333]
signal jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_3333_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_3333_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_3333_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_3333_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_005e]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_c53d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_012c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_0dae]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2903_c40_1173]
signal jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_1173_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_1173_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_1173_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_89f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_d6fa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_7d4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_012c]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2904_c40_3407]
signal jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_3407_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_3407_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_3407_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_3407_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_81b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_ce05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_b068]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_7d4f]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2905_c40_5a02]
signal jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_5a02_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_5a02_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fdd1]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_43cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_e574]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_b068]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2906_c40_9bef]
signal jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_9bef_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_9bef_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_9bef_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_9bef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6fbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_2ef7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_acc8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_e574]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2907_c40_199f]
signal jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_199f_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_199f_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_199f_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_199f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_47ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_84c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_8140]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_acc8]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2908_c40_0f7b]
signal sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_0f7b_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_0f7b_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_0f7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7932]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_7c3d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_4dde]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_8140]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2909_c40_7c61]
signal sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_7c61_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_7c61_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_7c61_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_fd60]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_f126]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_b13b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_4dde]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2910_c40_4b4e]
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_0ba5]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_2462]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e73a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_b13b]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2911_c40_b453]
signal ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_b453_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_b453_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_b453_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_128f]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_27e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_a7c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_e73a]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2912_c40_6bec]
signal stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_6bec_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_6bec_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_6bec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_e638]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0e4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_9770]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_a7c2]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2913_c40_96cd]
signal stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_96cd_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_96cd_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_96cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_a3d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_540a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_dc1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_9770]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2914_c40_8dd0]
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_2ab3]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_056f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_c2f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_dc1b]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2915_c40_aadd]
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_c77a]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_c5ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_ae87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_c2f0]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2916_c40_190e]
signal str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_190e_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_190e_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_190e_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_190e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_d0ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_f920]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8412]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_ae87]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2917_c40_5cda]
signal str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_5cda_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_5cda_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_5cda_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_5cda_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d551]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_9413]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_fb84]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_8412]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2918_c40_e0d3]
signal lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_e0d3_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_e0d3_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_e0d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2677]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_8526]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_9e46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_fb84]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2919_c40_0049]
signal lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0049_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0049_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0049_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_c4c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_610b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_2fe2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_9e46]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2920_c40_575a]
signal sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_575a_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_575a_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_575a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b806]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f224]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_2a9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_2fe2]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2921_c40_ab2e]
signal sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_ab2e_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_ab2e_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_e73f]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_edd0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_4133]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_2a9e]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2922_c40_2a05]
signal dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2a05_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_d4eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_1675]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_090c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_4133]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2923_c40_f1be]
signal dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_f1be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_81d1]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_bb15]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_e248]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_090c]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2924_c40_dd75]
signal deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_dd75_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_4019]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_3b82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_2daf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_e248]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2925_c40_fd90]
signal deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_fd90_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_b288]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_45e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_2500]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_2daf]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2926_c40_0f1b]
signal add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2926_c40_0f1b_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_0f1b_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_0f1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_88cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_ce62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_62ed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_2500]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2927_c40_5617]
signal add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_5617_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_5617_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_5617_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e875]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_7117]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_575f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_62ed]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2928_c40_6da4]
signal sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2928_c40_6da4_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2928_c40_6da4_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2928_c40_6da4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_61e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_efc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_e689]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_575f]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2929_c40_f565]
signal sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f565_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f565_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f565_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_25d9]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_737c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_8c66]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_e689]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2930_c40_3491]
signal mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_3491_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_3491_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_3491_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_15b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_1555]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_32fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_8c66]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2931_c40_3e17]
signal mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_3e17_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_3e17_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_3e17_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_7add]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_2c08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_2243]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_32fe]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2932_c40_1c6b]
signal div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2932_c40_1c6b_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_1c6b_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_1c6b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_3443]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_523b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a999]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_2243]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2933_c40_bcc6]
signal div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_bcc6_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_bcc6_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_bcc6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_83b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_cfb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_937e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_a999]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2934_c40_8b38]
signal and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2934_c40_8b38_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_8b38_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_8b38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_2863]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_7ed7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_060f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_937e]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2935_c40_3ef7]
signal and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_3ef7_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_3ef7_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_3ef7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_07c7]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6a7f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_0a15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_060f]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2936_c40_9217]
signal ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9217_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9217_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9217_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c400]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_86cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_10d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_0a15]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2937_c40_6a22]
signal ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_6a22_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_6a22_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_6a22_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_6424]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_903c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_a7ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_10d1]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2938_c40_1c86]
signal eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1c86_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1c86_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_1c86_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_d6c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_970b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_0f76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_a7ef]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2939_c40_b770]
signal eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_b770_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_b770_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_b770_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_ae76]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_3706]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_bcda]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_0f76]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2940_c40_ee29]
signal sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_ee29_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_ee29_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_ee29_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_a13d]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f0e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_bcda]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2941_c40_827b]
signal sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_827b_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_827b_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_827b_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2943_c16_d85e]
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_2007]
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2946_c2_9603]
signal sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2946_c2_9603]
signal sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_c195]
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_4d5e]
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2952_c29_90f5]
signal MUX_uxn_opcodes_h_l2952_c29_90f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_90f5_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_a943]
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2953_c20_e392]
signal MUX_uxn_opcodes_h_l2953_c20_e392_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_e392_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_e392_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_e392_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2953_c2_ed5d]
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2955_c24_195c]
signal stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200
BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57
BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output);

-- MUX_uxn_opcodes_h_l2865_c14_492e
MUX_uxn_opcodes_h_l2865_c14_492e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c14_492e_cond,
MUX_uxn_opcodes_h_l2865_c14_492e_iftrue,
MUX_uxn_opcodes_h_l2865_c14_492e_iffalse,
MUX_uxn_opcodes_h_l2865_c14_492e_return_output);

-- MUX_uxn_opcodes_h_l2866_c8_ce4c
MUX_uxn_opcodes_h_l2866_c8_ce4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2866_c8_ce4c_cond,
MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue,
MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse,
MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23
opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23
is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond,
is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue,
is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse,
is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output);

-- brk_uxn_opcodes_h_l2872_c48_6685
brk_uxn_opcodes_h_l2872_c48_6685 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2872_c48_6685_phase,
brk_uxn_opcodes_h_l2872_c48_6685_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c
opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output);

-- jci_uxn_opcodes_h_l2873_c40_73f0
jci_uxn_opcodes_h_l2873_c40_73f0 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2873_c40_73f0_phase,
jci_uxn_opcodes_h_l2873_c40_73f0_pc,
jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read,
jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read,
jci_uxn_opcodes_h_l2873_c40_73f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80
opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output);

-- jmi_uxn_opcodes_h_l2874_c40_bb92
jmi_uxn_opcodes_h_l2874_c40_bb92 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2874_c40_bb92_phase,
jmi_uxn_opcodes_h_l2874_c40_bb92_pc,
jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read,
jmi_uxn_opcodes_h_l2874_c40_bb92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3
opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output);

-- jsi_uxn_opcodes_h_l2875_c40_bea9
jsi_uxn_opcodes_h_l2875_c40_bea9 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2875_c40_bea9_phase,
jsi_uxn_opcodes_h_l2875_c40_bea9_pc,
jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read,
jsi_uxn_opcodes_h_l2875_c40_bea9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d
opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output);

-- lit_uxn_opcodes_h_l2876_c40_b389
lit_uxn_opcodes_h_l2876_c40_b389 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2876_c40_b389_phase,
lit_uxn_opcodes_h_l2876_c40_b389_pc,
lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read,
lit_uxn_opcodes_h_l2876_c40_b389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a
opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output);

-- lit2_uxn_opcodes_h_l2877_c40_0bfe
lit2_uxn_opcodes_h_l2877_c40_0bfe : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2877_c40_0bfe_phase,
lit2_uxn_opcodes_h_l2877_c40_0bfe_pc,
lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read,
lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3
opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output);

-- lit_uxn_opcodes_h_l2878_c40_1cb4
lit_uxn_opcodes_h_l2878_c40_1cb4 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2878_c40_1cb4_phase,
lit_uxn_opcodes_h_l2878_c40_1cb4_pc,
lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read,
lit_uxn_opcodes_h_l2878_c40_1cb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_611d
opc_result_MUX_uxn_opcodes_h_l2879_c7_611d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output);

-- lit2_uxn_opcodes_h_l2879_c40_b1c5
lit2_uxn_opcodes_h_l2879_c40_b1c5 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2879_c40_b1c5_phase,
lit2_uxn_opcodes_h_l2879_c40_b1c5_pc,
lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read,
lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3
opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output);

-- inc_uxn_opcodes_h_l2880_c40_1391
inc_uxn_opcodes_h_l2880_c40_1391 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2880_c40_1391_phase,
inc_uxn_opcodes_h_l2880_c40_1391_ins,
inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read,
inc_uxn_opcodes_h_l2880_c40_1391_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b
opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output);

-- inc2_uxn_opcodes_h_l2881_c40_736a
inc2_uxn_opcodes_h_l2881_c40_736a : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2881_c40_736a_phase,
inc2_uxn_opcodes_h_l2881_c40_736a_ins,
inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read,
inc2_uxn_opcodes_h_l2881_c40_736a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a
opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output);

-- pop_uxn_opcodes_h_l2882_c40_017d
pop_uxn_opcodes_h_l2882_c40_017d : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2882_c40_017d_phase,
pop_uxn_opcodes_h_l2882_c40_017d_ins,
pop_uxn_opcodes_h_l2882_c40_017d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_806e
opc_result_MUX_uxn_opcodes_h_l2883_c7_806e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output);

-- pop2_uxn_opcodes_h_l2883_c40_0194
pop2_uxn_opcodes_h_l2883_c40_0194 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2883_c40_0194_phase,
pop2_uxn_opcodes_h_l2883_c40_0194_ins,
pop2_uxn_opcodes_h_l2883_c40_0194_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_4535
opc_result_MUX_uxn_opcodes_h_l2884_c7_4535 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output);

-- nip_uxn_opcodes_h_l2884_c40_413b
nip_uxn_opcodes_h_l2884_c40_413b : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2884_c40_413b_phase,
nip_uxn_opcodes_h_l2884_c40_413b_ins,
nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read,
nip_uxn_opcodes_h_l2884_c40_413b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_adab
opc_result_MUX_uxn_opcodes_h_l2885_c7_adab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output);

-- nip2_uxn_opcodes_h_l2885_c40_3922
nip2_uxn_opcodes_h_l2885_c40_3922 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2885_c40_3922_phase,
nip2_uxn_opcodes_h_l2885_c40_3922_ins,
nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read,
nip2_uxn_opcodes_h_l2885_c40_3922_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77
opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output);

-- swp_uxn_opcodes_h_l2886_c40_5928
swp_uxn_opcodes_h_l2886_c40_5928 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2886_c40_5928_phase,
swp_uxn_opcodes_h_l2886_c40_5928_ins,
swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read,
swp_uxn_opcodes_h_l2886_c40_5928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_9153
opc_result_MUX_uxn_opcodes_h_l2887_c7_9153 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output);

-- swp2_uxn_opcodes_h_l2887_c40_67be
swp2_uxn_opcodes_h_l2887_c40_67be : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2887_c40_67be_phase,
swp2_uxn_opcodes_h_l2887_c40_67be_ins,
swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read,
swp2_uxn_opcodes_h_l2887_c40_67be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c
opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output);

-- rot_uxn_opcodes_h_l2888_c40_f2d3
rot_uxn_opcodes_h_l2888_c40_f2d3 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2888_c40_f2d3_phase,
rot_uxn_opcodes_h_l2888_c40_f2d3_ins,
rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read,
rot_uxn_opcodes_h_l2888_c40_f2d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9
opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output);

-- rot2_uxn_opcodes_h_l2889_c40_e0ab
rot2_uxn_opcodes_h_l2889_c40_e0ab : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2889_c40_e0ab_phase,
rot2_uxn_opcodes_h_l2889_c40_e0ab_ins,
rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read,
rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96
opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output);

-- dup_uxn_opcodes_h_l2890_c40_efea
dup_uxn_opcodes_h_l2890_c40_efea : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2890_c40_efea_phase,
dup_uxn_opcodes_h_l2890_c40_efea_ins,
dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read,
dup_uxn_opcodes_h_l2890_c40_efea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8
opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output);

-- dup2_uxn_opcodes_h_l2891_c40_2aad
dup2_uxn_opcodes_h_l2891_c40_2aad : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2891_c40_2aad_phase,
dup2_uxn_opcodes_h_l2891_c40_2aad_ins,
dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read,
dup2_uxn_opcodes_h_l2891_c40_2aad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_2821
opc_result_MUX_uxn_opcodes_h_l2892_c7_2821 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output);

-- ovr_uxn_opcodes_h_l2892_c40_b785
ovr_uxn_opcodes_h_l2892_c40_b785 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2892_c40_b785_phase,
ovr_uxn_opcodes_h_l2892_c40_b785_ins,
ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read,
ovr_uxn_opcodes_h_l2892_c40_b785_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_f859
opc_result_MUX_uxn_opcodes_h_l2893_c7_f859 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output);

-- ovr2_uxn_opcodes_h_l2893_c40_5307
ovr2_uxn_opcodes_h_l2893_c40_5307 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2893_c40_5307_phase,
ovr2_uxn_opcodes_h_l2893_c40_5307_ins,
ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read,
ovr2_uxn_opcodes_h_l2893_c40_5307_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_832e
opc_result_MUX_uxn_opcodes_h_l2894_c7_832e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output);

-- equ_uxn_opcodes_h_l2894_c40_e500
equ_uxn_opcodes_h_l2894_c40_e500 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2894_c40_e500_phase,
equ_uxn_opcodes_h_l2894_c40_e500_ins,
equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read,
equ_uxn_opcodes_h_l2894_c40_e500_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29
opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output);

-- equ2_uxn_opcodes_h_l2895_c40_a9b9
equ2_uxn_opcodes_h_l2895_c40_a9b9 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2895_c40_a9b9_phase,
equ2_uxn_opcodes_h_l2895_c40_a9b9_ins,
equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read,
equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5
opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output);

-- neq_uxn_opcodes_h_l2896_c40_bc1b
neq_uxn_opcodes_h_l2896_c40_bc1b : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2896_c40_bc1b_phase,
neq_uxn_opcodes_h_l2896_c40_bc1b_ins,
neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read,
neq_uxn_opcodes_h_l2896_c40_bc1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_7860
opc_result_MUX_uxn_opcodes_h_l2897_c7_7860 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output);

-- neq2_uxn_opcodes_h_l2897_c40_38e0
neq2_uxn_opcodes_h_l2897_c40_38e0 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2897_c40_38e0_phase,
neq2_uxn_opcodes_h_l2897_c40_38e0_ins,
neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read,
neq2_uxn_opcodes_h_l2897_c40_38e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_5597
opc_result_MUX_uxn_opcodes_h_l2898_c7_5597 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output);

-- gth_uxn_opcodes_h_l2898_c40_21f2
gth_uxn_opcodes_h_l2898_c40_21f2 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2898_c40_21f2_phase,
gth_uxn_opcodes_h_l2898_c40_21f2_ins,
gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read,
gth_uxn_opcodes_h_l2898_c40_21f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_723a
opc_result_MUX_uxn_opcodes_h_l2899_c7_723a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output);

-- gth2_uxn_opcodes_h_l2899_c40_7de4
gth2_uxn_opcodes_h_l2899_c40_7de4 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2899_c40_7de4_phase,
gth2_uxn_opcodes_h_l2899_c40_7de4_ins,
gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read,
gth2_uxn_opcodes_h_l2899_c40_7de4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5
opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output);

-- lth_uxn_opcodes_h_l2900_c40_3d9e
lth_uxn_opcodes_h_l2900_c40_3d9e : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2900_c40_3d9e_phase,
lth_uxn_opcodes_h_l2900_c40_3d9e_ins,
lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read,
lth_uxn_opcodes_h_l2900_c40_3d9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75
opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output);

-- lth2_uxn_opcodes_h_l2901_c40_d135
lth2_uxn_opcodes_h_l2901_c40_d135 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2901_c40_d135_phase,
lth2_uxn_opcodes_h_l2901_c40_d135_ins,
lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read,
lth2_uxn_opcodes_h_l2901_c40_d135_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_6993
opc_result_MUX_uxn_opcodes_h_l2902_c7_6993 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output);

-- jmp_uxn_opcodes_h_l2902_c40_3333
jmp_uxn_opcodes_h_l2902_c40_3333 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2902_c40_3333_phase,
jmp_uxn_opcodes_h_l2902_c40_3333_ins,
jmp_uxn_opcodes_h_l2902_c40_3333_pc,
jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read,
jmp_uxn_opcodes_h_l2902_c40_3333_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae
opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output);

-- jmp2_uxn_opcodes_h_l2903_c40_1173
jmp2_uxn_opcodes_h_l2903_c40_1173 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2903_c40_1173_phase,
jmp2_uxn_opcodes_h_l2903_c40_1173_ins,
jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read,
jmp2_uxn_opcodes_h_l2903_c40_1173_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_012c
opc_result_MUX_uxn_opcodes_h_l2904_c7_012c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output);

-- jcn_uxn_opcodes_h_l2904_c40_3407
jcn_uxn_opcodes_h_l2904_c40_3407 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2904_c40_3407_phase,
jcn_uxn_opcodes_h_l2904_c40_3407_ins,
jcn_uxn_opcodes_h_l2904_c40_3407_pc,
jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read,
jcn_uxn_opcodes_h_l2904_c40_3407_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f
opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output);

-- jcn2_uxn_opcodes_h_l2905_c40_5a02
jcn2_uxn_opcodes_h_l2905_c40_5a02 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2905_c40_5a02_phase,
jcn2_uxn_opcodes_h_l2905_c40_5a02_ins,
jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read,
jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_b068
opc_result_MUX_uxn_opcodes_h_l2906_c7_b068 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output);

-- jsr_uxn_opcodes_h_l2906_c40_9bef
jsr_uxn_opcodes_h_l2906_c40_9bef : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2906_c40_9bef_phase,
jsr_uxn_opcodes_h_l2906_c40_9bef_ins,
jsr_uxn_opcodes_h_l2906_c40_9bef_pc,
jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read,
jsr_uxn_opcodes_h_l2906_c40_9bef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_e574
opc_result_MUX_uxn_opcodes_h_l2907_c7_e574 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output);

-- jsr2_uxn_opcodes_h_l2907_c40_199f
jsr2_uxn_opcodes_h_l2907_c40_199f : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2907_c40_199f_phase,
jsr2_uxn_opcodes_h_l2907_c40_199f_ins,
jsr2_uxn_opcodes_h_l2907_c40_199f_pc,
jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read,
jsr2_uxn_opcodes_h_l2907_c40_199f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8
opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output);

-- sth_uxn_opcodes_h_l2908_c40_0f7b
sth_uxn_opcodes_h_l2908_c40_0f7b : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2908_c40_0f7b_phase,
sth_uxn_opcodes_h_l2908_c40_0f7b_ins,
sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read,
sth_uxn_opcodes_h_l2908_c40_0f7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_8140
opc_result_MUX_uxn_opcodes_h_l2909_c7_8140 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output);

-- sth2_uxn_opcodes_h_l2909_c40_7c61
sth2_uxn_opcodes_h_l2909_c40_7c61 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2909_c40_7c61_phase,
sth2_uxn_opcodes_h_l2909_c40_7c61_ins,
sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read,
sth2_uxn_opcodes_h_l2909_c40_7c61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde
opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output);

-- ldz_uxn_opcodes_h_l2910_c40_4b4e
ldz_uxn_opcodes_h_l2910_c40_4b4e : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2910_c40_4b4e_phase,
ldz_uxn_opcodes_h_l2910_c40_4b4e_ins,
ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read,
ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read,
ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b
opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output);

-- ldz2_uxn_opcodes_h_l2911_c40_b453
ldz2_uxn_opcodes_h_l2911_c40_b453 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2911_c40_b453_phase,
ldz2_uxn_opcodes_h_l2911_c40_b453_ins,
ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read,
ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read,
ldz2_uxn_opcodes_h_l2911_c40_b453_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a
opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output);

-- stz_uxn_opcodes_h_l2912_c40_6bec
stz_uxn_opcodes_h_l2912_c40_6bec : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2912_c40_6bec_phase,
stz_uxn_opcodes_h_l2912_c40_6bec_ins,
stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read,
stz_uxn_opcodes_h_l2912_c40_6bec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2
opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output);

-- stz2_uxn_opcodes_h_l2913_c40_96cd
stz2_uxn_opcodes_h_l2913_c40_96cd : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2913_c40_96cd_phase,
stz2_uxn_opcodes_h_l2913_c40_96cd_ins,
stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read,
stz2_uxn_opcodes_h_l2913_c40_96cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_9770
opc_result_MUX_uxn_opcodes_h_l2914_c7_9770 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output);

-- ldr_uxn_opcodes_h_l2914_c40_8dd0
ldr_uxn_opcodes_h_l2914_c40_8dd0 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2914_c40_8dd0_phase,
ldr_uxn_opcodes_h_l2914_c40_8dd0_ins,
ldr_uxn_opcodes_h_l2914_c40_8dd0_pc,
ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read,
ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read,
ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b
opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output);

-- ldr2_uxn_opcodes_h_l2915_c40_aadd
ldr2_uxn_opcodes_h_l2915_c40_aadd : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2915_c40_aadd_phase,
ldr2_uxn_opcodes_h_l2915_c40_aadd_ins,
ldr2_uxn_opcodes_h_l2915_c40_aadd_pc,
ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read,
ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read,
ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0
opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output);

-- str1_uxn_opcodes_h_l2916_c40_190e
str1_uxn_opcodes_h_l2916_c40_190e : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2916_c40_190e_phase,
str1_uxn_opcodes_h_l2916_c40_190e_ins,
str1_uxn_opcodes_h_l2916_c40_190e_pc,
str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read,
str1_uxn_opcodes_h_l2916_c40_190e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87
opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output);

-- str2_uxn_opcodes_h_l2917_c40_5cda
str2_uxn_opcodes_h_l2917_c40_5cda : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2917_c40_5cda_phase,
str2_uxn_opcodes_h_l2917_c40_5cda_ins,
str2_uxn_opcodes_h_l2917_c40_5cda_pc,
str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read,
str2_uxn_opcodes_h_l2917_c40_5cda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_8412
opc_result_MUX_uxn_opcodes_h_l2918_c7_8412 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output);

-- lda_uxn_opcodes_h_l2918_c40_e0d3
lda_uxn_opcodes_h_l2918_c40_e0d3 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2918_c40_e0d3_phase,
lda_uxn_opcodes_h_l2918_c40_e0d3_ins,
lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read,
lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read,
lda_uxn_opcodes_h_l2918_c40_e0d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84
opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output);

-- lda2_uxn_opcodes_h_l2919_c40_0049
lda2_uxn_opcodes_h_l2919_c40_0049 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2919_c40_0049_phase,
lda2_uxn_opcodes_h_l2919_c40_0049_ins,
lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read,
lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read,
lda2_uxn_opcodes_h_l2919_c40_0049_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46
opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output);

-- sta_uxn_opcodes_h_l2920_c40_575a
sta_uxn_opcodes_h_l2920_c40_575a : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2920_c40_575a_phase,
sta_uxn_opcodes_h_l2920_c40_575a_ins,
sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read,
sta_uxn_opcodes_h_l2920_c40_575a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output);

-- sta2_uxn_opcodes_h_l2921_c40_ab2e
sta2_uxn_opcodes_h_l2921_c40_ab2e : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2921_c40_ab2e_phase,
sta2_uxn_opcodes_h_l2921_c40_ab2e_ins,
sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read,
sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e
opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output);

-- dei_uxn_opcodes_h_l2922_c40_2a05
dei_uxn_opcodes_h_l2922_c40_2a05 : entity work.dei_0CLK_99af4b2a port map (
clk,
dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2922_c40_2a05_phase,
dei_uxn_opcodes_h_l2922_c40_2a05_ins,
dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons,
dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read,
dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read,
dei_uxn_opcodes_h_l2922_c40_2a05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_4133
opc_result_MUX_uxn_opcodes_h_l2923_c7_4133 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output);

-- dei2_uxn_opcodes_h_l2923_c40_f1be
dei2_uxn_opcodes_h_l2923_c40_f1be : entity work.dei2_0CLK_3f571420 port map (
clk,
dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2923_c40_f1be_phase,
dei2_uxn_opcodes_h_l2923_c40_f1be_ins,
dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons,
dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read,
dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read,
dei2_uxn_opcodes_h_l2923_c40_f1be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_090c
opc_result_MUX_uxn_opcodes_h_l2924_c7_090c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output);

-- deo_uxn_opcodes_h_l2924_c40_dd75
deo_uxn_opcodes_h_l2924_c40_dd75 : entity work.deo_0CLK_2ecc848d port map (
clk,
deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2924_c40_dd75_phase,
deo_uxn_opcodes_h_l2924_c40_dd75_ins,
deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read,
deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read,
deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read,
deo_uxn_opcodes_h_l2924_c40_dd75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_e248
opc_result_MUX_uxn_opcodes_h_l2925_c7_e248 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output);

-- deo2_uxn_opcodes_h_l2925_c40_fd90
deo2_uxn_opcodes_h_l2925_c40_fd90 : entity work.deo2_0CLK_fbcdaac5 port map (
clk,
deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2925_c40_fd90_phase,
deo2_uxn_opcodes_h_l2925_c40_fd90_ins,
deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read,
deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read,
deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read,
deo2_uxn_opcodes_h_l2925_c40_fd90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf
opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output);

-- add_uxn_opcodes_h_l2926_c40_0f1b
add_uxn_opcodes_h_l2926_c40_0f1b : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE,
add_uxn_opcodes_h_l2926_c40_0f1b_phase,
add_uxn_opcodes_h_l2926_c40_0f1b_ins,
add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read,
add_uxn_opcodes_h_l2926_c40_0f1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_2500
opc_result_MUX_uxn_opcodes_h_l2927_c7_2500 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output);

-- add2_uxn_opcodes_h_l2927_c40_5617
add2_uxn_opcodes_h_l2927_c40_5617 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2927_c40_5617_phase,
add2_uxn_opcodes_h_l2927_c40_5617_ins,
add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read,
add2_uxn_opcodes_h_l2927_c40_5617_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed
opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output);

-- sub_uxn_opcodes_h_l2928_c40_6da4
sub_uxn_opcodes_h_l2928_c40_6da4 : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2928_c40_6da4_phase,
sub_uxn_opcodes_h_l2928_c40_6da4_ins,
sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read,
sub_uxn_opcodes_h_l2928_c40_6da4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_575f
opc_result_MUX_uxn_opcodes_h_l2929_c7_575f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output);

-- sub2_uxn_opcodes_h_l2929_c40_f565
sub2_uxn_opcodes_h_l2929_c40_f565 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2929_c40_f565_phase,
sub2_uxn_opcodes_h_l2929_c40_f565_ins,
sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read,
sub2_uxn_opcodes_h_l2929_c40_f565_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_e689
opc_result_MUX_uxn_opcodes_h_l2930_c7_e689 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output);

-- mul_uxn_opcodes_h_l2930_c40_3491
mul_uxn_opcodes_h_l2930_c40_3491 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2930_c40_3491_phase,
mul_uxn_opcodes_h_l2930_c40_3491_ins,
mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read,
mul_uxn_opcodes_h_l2930_c40_3491_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66
opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output);

-- mul2_uxn_opcodes_h_l2931_c40_3e17
mul2_uxn_opcodes_h_l2931_c40_3e17 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2931_c40_3e17_phase,
mul2_uxn_opcodes_h_l2931_c40_3e17_ins,
mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read,
mul2_uxn_opcodes_h_l2931_c40_3e17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe
opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output);

-- div_uxn_opcodes_h_l2932_c40_1c6b
div_uxn_opcodes_h_l2932_c40_1c6b : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE,
div_uxn_opcodes_h_l2932_c40_1c6b_phase,
div_uxn_opcodes_h_l2932_c40_1c6b_ins,
div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read,
div_uxn_opcodes_h_l2932_c40_1c6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_2243
opc_result_MUX_uxn_opcodes_h_l2933_c7_2243 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output);

-- div2_uxn_opcodes_h_l2933_c40_bcc6
div2_uxn_opcodes_h_l2933_c40_bcc6 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2933_c40_bcc6_phase,
div2_uxn_opcodes_h_l2933_c40_bcc6_ins,
div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read,
div2_uxn_opcodes_h_l2933_c40_bcc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_a999
opc_result_MUX_uxn_opcodes_h_l2934_c7_a999 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output);

-- and_uxn_opcodes_h_l2934_c40_8b38
and_uxn_opcodes_h_l2934_c40_8b38 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE,
and_uxn_opcodes_h_l2934_c40_8b38_phase,
and_uxn_opcodes_h_l2934_c40_8b38_ins,
and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read,
and_uxn_opcodes_h_l2934_c40_8b38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_937e
opc_result_MUX_uxn_opcodes_h_l2935_c7_937e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output);

-- and2_uxn_opcodes_h_l2935_c40_3ef7
and2_uxn_opcodes_h_l2935_c40_3ef7 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2935_c40_3ef7_phase,
and2_uxn_opcodes_h_l2935_c40_3ef7_ins,
and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read,
and2_uxn_opcodes_h_l2935_c40_3ef7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_060f
opc_result_MUX_uxn_opcodes_h_l2936_c7_060f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output);

-- ora_uxn_opcodes_h_l2936_c40_9217
ora_uxn_opcodes_h_l2936_c40_9217 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2936_c40_9217_phase,
ora_uxn_opcodes_h_l2936_c40_9217_ins,
ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read,
ora_uxn_opcodes_h_l2936_c40_9217_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15
opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output);

-- ora2_uxn_opcodes_h_l2937_c40_6a22
ora2_uxn_opcodes_h_l2937_c40_6a22 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2937_c40_6a22_phase,
ora2_uxn_opcodes_h_l2937_c40_6a22_ins,
ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read,
ora2_uxn_opcodes_h_l2937_c40_6a22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1
opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output);

-- eor_uxn_opcodes_h_l2938_c40_1c86
eor_uxn_opcodes_h_l2938_c40_1c86 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2938_c40_1c86_phase,
eor_uxn_opcodes_h_l2938_c40_1c86_ins,
eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read,
eor_uxn_opcodes_h_l2938_c40_1c86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef
opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output);

-- eor2_uxn_opcodes_h_l2939_c40_b770
eor2_uxn_opcodes_h_l2939_c40_b770 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2939_c40_b770_phase,
eor2_uxn_opcodes_h_l2939_c40_b770_ins,
eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read,
eor2_uxn_opcodes_h_l2939_c40_b770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76
opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output);

-- sft_uxn_opcodes_h_l2940_c40_ee29
sft_uxn_opcodes_h_l2940_c40_ee29 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2940_c40_ee29_phase,
sft_uxn_opcodes_h_l2940_c40_ee29_ins,
sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read,
sft_uxn_opcodes_h_l2940_c40_ee29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda
opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output);

-- sft2_uxn_opcodes_h_l2941_c40_827b
sft2_uxn_opcodes_h_l2941_c40_827b : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2941_c40_827b_phase,
sft2_uxn_opcodes_h_l2941_c40_827b_ins,
sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read,
sft2_uxn_opcodes_h_l2941_c40_827b_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e
CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x,
CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output);

-- sp0_MUX_uxn_opcodes_h_l2946_c2_9603
sp0_MUX_uxn_opcodes_h_l2946_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond,
sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue,
sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse,
sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output);

-- sp1_MUX_uxn_opcodes_h_l2946_c2_9603
sp1_MUX_uxn_opcodes_h_l2946_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond,
sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue,
sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse,
sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output);

-- MUX_uxn_opcodes_h_l2952_c29_90f5
MUX_uxn_opcodes_h_l2952_c29_90f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c29_90f5_cond,
MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue,
MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse,
MUX_uxn_opcodes_h_l2952_c29_90f5_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output);

-- MUX_uxn_opcodes_h_l2953_c20_e392
MUX_uxn_opcodes_h_l2953_c20_e392 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c20_e392_cond,
MUX_uxn_opcodes_h_l2953_c20_e392_iftrue,
MUX_uxn_opcodes_h_l2953_c20_e392_iffalse,
MUX_uxn_opcodes_h_l2953_c20_e392_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d
BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output);

-- stack_ram_update_uxn_opcodes_h_l2955_c24_195c
stack_ram_update_uxn_opcodes_h_l2955_c24_195c : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address,
stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value,
stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable,
stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output,
 MUX_uxn_opcodes_h_l2865_c14_492e_return_output,
 MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output,
 is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output,
 brk_uxn_opcodes_h_l2872_c48_6685_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output,
 jci_uxn_opcodes_h_l2873_c40_73f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output,
 jmi_uxn_opcodes_h_l2874_c40_bb92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output,
 jsi_uxn_opcodes_h_l2875_c40_bea9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output,
 lit_uxn_opcodes_h_l2876_c40_b389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output,
 lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output,
 lit_uxn_opcodes_h_l2878_c40_1cb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output,
 lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output,
 inc_uxn_opcodes_h_l2880_c40_1391_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output,
 inc2_uxn_opcodes_h_l2881_c40_736a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output,
 pop_uxn_opcodes_h_l2882_c40_017d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output,
 pop2_uxn_opcodes_h_l2883_c40_0194_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output,
 nip_uxn_opcodes_h_l2884_c40_413b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output,
 nip2_uxn_opcodes_h_l2885_c40_3922_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output,
 swp_uxn_opcodes_h_l2886_c40_5928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output,
 swp2_uxn_opcodes_h_l2887_c40_67be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output,
 rot_uxn_opcodes_h_l2888_c40_f2d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output,
 rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output,
 dup_uxn_opcodes_h_l2890_c40_efea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output,
 dup2_uxn_opcodes_h_l2891_c40_2aad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output,
 ovr_uxn_opcodes_h_l2892_c40_b785_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output,
 ovr2_uxn_opcodes_h_l2893_c40_5307_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output,
 equ_uxn_opcodes_h_l2894_c40_e500_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output,
 equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output,
 neq_uxn_opcodes_h_l2896_c40_bc1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output,
 neq2_uxn_opcodes_h_l2897_c40_38e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output,
 gth_uxn_opcodes_h_l2898_c40_21f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output,
 gth2_uxn_opcodes_h_l2899_c40_7de4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output,
 lth_uxn_opcodes_h_l2900_c40_3d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output,
 lth2_uxn_opcodes_h_l2901_c40_d135_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output,
 jmp_uxn_opcodes_h_l2902_c40_3333_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output,
 jmp2_uxn_opcodes_h_l2903_c40_1173_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output,
 jcn_uxn_opcodes_h_l2904_c40_3407_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output,
 jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output,
 jsr_uxn_opcodes_h_l2906_c40_9bef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output,
 jsr2_uxn_opcodes_h_l2907_c40_199f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output,
 sth_uxn_opcodes_h_l2908_c40_0f7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output,
 sth2_uxn_opcodes_h_l2909_c40_7c61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output,
 ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output,
 ldz2_uxn_opcodes_h_l2911_c40_b453_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output,
 stz_uxn_opcodes_h_l2912_c40_6bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output,
 stz2_uxn_opcodes_h_l2913_c40_96cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output,
 ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output,
 ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output,
 str1_uxn_opcodes_h_l2916_c40_190e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output,
 str2_uxn_opcodes_h_l2917_c40_5cda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output,
 lda_uxn_opcodes_h_l2918_c40_e0d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output,
 lda2_uxn_opcodes_h_l2919_c40_0049_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output,
 sta_uxn_opcodes_h_l2920_c40_575a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output,
 sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output,
 dei_uxn_opcodes_h_l2922_c40_2a05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output,
 dei2_uxn_opcodes_h_l2923_c40_f1be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output,
 deo_uxn_opcodes_h_l2924_c40_dd75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output,
 deo2_uxn_opcodes_h_l2925_c40_fd90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output,
 add_uxn_opcodes_h_l2926_c40_0f1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output,
 add2_uxn_opcodes_h_l2927_c40_5617_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output,
 sub_uxn_opcodes_h_l2928_c40_6da4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output,
 sub2_uxn_opcodes_h_l2929_c40_f565_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output,
 mul_uxn_opcodes_h_l2930_c40_3491_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output,
 mul2_uxn_opcodes_h_l2931_c40_3e17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output,
 div_uxn_opcodes_h_l2932_c40_1c6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output,
 div2_uxn_opcodes_h_l2933_c40_bcc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output,
 and_uxn_opcodes_h_l2934_c40_8b38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output,
 and2_uxn_opcodes_h_l2935_c40_3ef7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output,
 ora_uxn_opcodes_h_l2936_c40_9217_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output,
 ora2_uxn_opcodes_h_l2937_c40_6a22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output,
 eor_uxn_opcodes_h_l2938_c40_1c86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output,
 eor2_uxn_opcodes_h_l2939_c40_b770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output,
 sft_uxn_opcodes_h_l2940_c40_ee29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output,
 sft2_uxn_opcodes_h_l2941_c40_827b_return_output,
 CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output,
 sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output,
 sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output,
 MUX_uxn_opcodes_h_l2952_c29_90f5_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output,
 MUX_uxn_opcodes_h_l2953_c20_e392_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output,
 stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_492e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_492e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_6685_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_6685_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_73f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_b389_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_b389_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_b389_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1391_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1391_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_1391_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_736a_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_736a_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_736a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_017d_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_017d_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_017d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_0194_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_0194_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_0194_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_413b_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_413b_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_413b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_3922_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_3922_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_3922_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_5928_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_5928_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_5928_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_67be_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_67be_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_67be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_efea_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_efea_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_efea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_b785_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_b785_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_b785_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_e500_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_e500_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_e500_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_21f2_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_21f2_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_21f2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_d135_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_d135_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_d135_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_3333_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_3407_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_6bec_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_6bec_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_6bec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_190e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_5cda_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0049_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_575a_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_575a_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_575a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2a05_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_dd75_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_0f1b_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_0f1b_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_0f1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_5617_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_5617_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_5617_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2928_c40_6da4_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2928_c40_6da4_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2928_c40_6da4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f565_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f565_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f565_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_3491_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_3491_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_3491_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_1c6b_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_1c6b_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_1c6b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_8b38_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_8b38_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_8b38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9217_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9217_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9217_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1c86_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1c86_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_1c86_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_b770_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_b770_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_b770_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_ee29_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_ee29_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_ee29_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_827b_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_827b_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_827b_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2943_c2_b477 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_ceb6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2949_c3_5e7d : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2947_c3_0864 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2797_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_43cf_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_5027_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_e392_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_e392_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_2108_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_19af_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_e350_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_d5a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_a529_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_fe2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_30e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_252a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e08b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_1d72_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2949_l2947_DUPLICATE_3a7c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_740d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_a7a9_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right := to_unsigned(62, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right := to_unsigned(21, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right := to_unsigned(36, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right := to_unsigned(59, 8);
     VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right := to_unsigned(20, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right := to_unsigned(2, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right := to_unsigned(31, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right := to_unsigned(37, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right := to_unsigned(30, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right := to_unsigned(55, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right := to_unsigned(35, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right := to_unsigned(10, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right := to_unsigned(15, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right := to_unsigned(96, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right := to_unsigned(23, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right := to_unsigned(223, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right := to_unsigned(0, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right := to_unsigned(54, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right := to_unsigned(22, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right := to_unsigned(27, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2927_c40_5617_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2926_c40_0f1b_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2934_c40_8b38_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2932_c40_1c6b_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2890_c40_efea_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2939_c40_b770_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2938_c40_1c86_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2894_c40_e500_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2898_c40_21f2_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2881_c40_736a_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2880_c40_1391_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2901_c40_d135_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2930_c40_3491_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2885_c40_3922_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2884_c40_413b_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2936_c40_9217_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2892_c40_b785_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2883_c40_0194_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2882_c40_017d_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2941_c40_827b_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2940_c40_ee29_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2920_c40_575a_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2912_c40_6bec_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f565_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2928_c40_6da4_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2887_c40_67be_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2886_c40_5928_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2876_c40_b389_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2927_c40_5617_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2926_c40_0f1b_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2934_c40_8b38_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2872_c48_6685_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2932_c40_1c6b_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2890_c40_efea_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2939_c40_b770_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2938_c40_1c86_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2894_c40_e500_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2898_c40_21f2_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2881_c40_736a_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2880_c40_1391_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2876_c40_b389_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2901_c40_d135_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2930_c40_3491_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2885_c40_3922_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2884_c40_413b_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2936_c40_9217_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2892_c40_b785_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2883_c40_0194_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2882_c40_017d_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2941_c40_827b_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2940_c40_ee29_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2920_c40_575a_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2912_c40_6bec_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f565_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2928_c40_6da4_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2887_c40_67be_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2886_c40_5928_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2872_c48_6685] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2872_c48_6685_phase <= VAR_brk_uxn_opcodes_h_l2872_c48_6685_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2872_c48_6685_return_output := brk_uxn_opcodes_h_l2872_c48_6685_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2864_c14_0200] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_left;
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output := BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2943_c16_d85e] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output := CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output;
     VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_0200_return_output;
     VAR_stack_index_uxn_opcodes_h_l2943_c2_b477 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_d85e_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue := VAR_brk_uxn_opcodes_h_l2872_c48_6685_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left := VAR_stack_index_uxn_opcodes_h_l2943_c2_b477;
     -- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_5cab] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_left;
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output := BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5cab_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2865_c14_cf57] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_left;
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output := BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_cf57_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_4709] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_4709_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_2761] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2865_c14_492e_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_2761_return_output;
     -- MUX[uxn_opcodes_h_l2865_c14_492e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c14_492e_cond <= VAR_MUX_uxn_opcodes_h_l2865_c14_492e_cond;
     MUX_uxn_opcodes_h_l2865_c14_492e_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iftrue;
     MUX_uxn_opcodes_h_l2865_c14_492e_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c14_492e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c14_492e_return_output := MUX_uxn_opcodes_h_l2865_c14_492e_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_cond := VAR_MUX_uxn_opcodes_h_l2865_c14_492e_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2865_c14_492e_return_output;
     -- MUX[uxn_opcodes_h_l2866_c8_ce4c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2866_c8_ce4c_cond <= VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_cond;
     MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue <= VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iftrue;
     MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse <= VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output := MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2866_c8_ce4c_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_0ba5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_f8d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_d4eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_a9f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_23c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_2863] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_88cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_61e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_07c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7932] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_c4c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_fd60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_69aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_81d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_3d58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_6aaa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_b288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_720e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_e0db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_a3d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_1cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_005e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_83b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_e1ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_128f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_3c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_d6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_3e75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_89f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_d0ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_25d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_2ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6fbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_650a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_a13d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_6424] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_618b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_1dd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_abd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_ae76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_9475] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_a002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_be4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fdd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_cadb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_c77a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_4ef1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_e638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_7add] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_15b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_b7d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_81b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_47ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_c45a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_e711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d551] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_c109] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_4019] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_cf91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_066a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_cab5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_3443] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_63f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_e73f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b806] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_e612] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_9475_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_6aaa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_a9f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_be4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_618b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_69aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_63f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e612_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_1cab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_e0db_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_1dd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_cf91_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_c45a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_cab5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3c57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_650a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_f8d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3e75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4ff3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cadb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_c109_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_066a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_a002_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4ef1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_abd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_e1ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_720e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_23c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_e711_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_b7d5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_005e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_89f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_81b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fdd1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fbb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_47ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7932_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_fd60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_0ba5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_128f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_e638_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_a3d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_2ab3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c77a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_d0ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d551_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2677_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c4c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b806_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_e73f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_d4eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_81d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_4019_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b288_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_88cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e875_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_61e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_25d9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_15b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_7add_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_3443_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_83b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2863_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_07c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c400_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6424_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_d6c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_ae76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_a13d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_1e9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2872_c2_cd23] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_cond;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output := is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_51bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_0e80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output;
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_51bc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_1fb7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output;

     -- jci[uxn_opcodes_h_l2873_c40_73f0] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2873_c40_73f0_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2873_c40_73f0_phase <= VAR_jci_uxn_opcodes_h_l2873_c40_73f0_phase;
     jci_uxn_opcodes_h_l2873_c40_73f0_pc <= VAR_jci_uxn_opcodes_h_l2873_c40_73f0_pc;
     jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_stack_read;
     jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2873_c40_73f0_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2873_c40_73f0_return_output := jci_uxn_opcodes_h_l2873_c40_73f0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_61e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output;
     VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_1fb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue := VAR_jci_uxn_opcodes_h_l2873_c40_73f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_1e17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output;

     -- jmi[uxn_opcodes_h_l2874_c40_bb92] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2874_c40_bb92_phase <= VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_phase;
     jmi_uxn_opcodes_h_l2874_c40_bb92_pc <= VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_pc;
     jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_return_output := jmi_uxn_opcodes_h_l2874_c40_bb92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_df0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output;
     VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1e17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue := VAR_jmi_uxn_opcodes_h_l2874_c40_bb92_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ee47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output;

     -- jsi[uxn_opcodes_h_l2875_c40_bea9] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2875_c40_bea9_phase <= VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_phase;
     jsi_uxn_opcodes_h_l2875_c40_bea9_pc <= VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_pc;
     jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_return_output := jsi_uxn_opcodes_h_l2875_c40_bea9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_d09a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output;
     VAR_lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ee47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue := VAR_jsi_uxn_opcodes_h_l2875_c40_bea9_return_output;
     -- lit[uxn_opcodes_h_l2876_c40_b389] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2876_c40_b389_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2876_c40_b389_phase <= VAR_lit_uxn_opcodes_h_l2876_c40_b389_phase;
     lit_uxn_opcodes_h_l2876_c40_b389_pc <= VAR_lit_uxn_opcodes_h_l2876_c40_b389_pc;
     lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2876_c40_b389_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2876_c40_b389_return_output := lit_uxn_opcodes_h_l2876_c40_b389_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_fd8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_37c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output;
     VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_fd8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue := VAR_lit_uxn_opcodes_h_l2876_c40_b389_return_output;
     -- lit2[uxn_opcodes_h_l2877_c40_0bfe] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2877_c40_0bfe_phase <= VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_phase;
     lit2_uxn_opcodes_h_l2877_c40_0bfe_pc <= VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_pc;
     lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output := lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_611d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5bbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_611d_return_output;
     VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5bbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue := VAR_lit2_uxn_opcodes_h_l2877_c40_0bfe_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_5583] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_14b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output;

     -- lit[uxn_opcodes_h_l2878_c40_1cb4] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2878_c40_1cb4_phase <= VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_phase;
     lit_uxn_opcodes_h_l2878_c40_1cb4_pc <= VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_pc;
     lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_return_output := lit_uxn_opcodes_h_l2878_c40_1cb4_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output;
     VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_5583_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue := VAR_lit_uxn_opcodes_h_l2878_c40_1cb4_return_output;
     -- lit2[uxn_opcodes_h_l2879_c40_b1c5] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2879_c40_b1c5_phase <= VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_phase;
     lit2_uxn_opcodes_h_l2879_c40_b1c5_pc <= VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_pc;
     lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output := lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_c00b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_1c2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output;
     VAR_inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_1c2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue := VAR_lit2_uxn_opcodes_h_l2879_c40_b1c5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_3740] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_ba1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output;

     -- inc[uxn_opcodes_h_l2880_c40_1391] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2880_c40_1391_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2880_c40_1391_phase <= VAR_inc_uxn_opcodes_h_l2880_c40_1391_phase;
     inc_uxn_opcodes_h_l2880_c40_1391_ins <= VAR_inc_uxn_opcodes_h_l2880_c40_1391_ins;
     inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2880_c40_1391_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2880_c40_1391_return_output := inc_uxn_opcodes_h_l2880_c40_1391_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output;
     VAR_inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_3740_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue := VAR_inc_uxn_opcodes_h_l2880_c40_1391_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_1250] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_806e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output;

     -- inc2[uxn_opcodes_h_l2881_c40_736a] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2881_c40_736a_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2881_c40_736a_phase <= VAR_inc2_uxn_opcodes_h_l2881_c40_736a_phase;
     inc2_uxn_opcodes_h_l2881_c40_736a_ins <= VAR_inc2_uxn_opcodes_h_l2881_c40_736a_ins;
     inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2881_c40_736a_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2881_c40_736a_return_output := inc2_uxn_opcodes_h_l2881_c40_736a_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_806e_return_output;
     VAR_pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_1250_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue := VAR_inc2_uxn_opcodes_h_l2881_c40_736a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_1eab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_4535] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output;

     -- pop[uxn_opcodes_h_l2882_c40_017d] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2882_c40_017d_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2882_c40_017d_phase <= VAR_pop_uxn_opcodes_h_l2882_c40_017d_phase;
     pop_uxn_opcodes_h_l2882_c40_017d_ins <= VAR_pop_uxn_opcodes_h_l2882_c40_017d_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2882_c40_017d_return_output := pop_uxn_opcodes_h_l2882_c40_017d_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_4535_return_output;
     VAR_pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_1eab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue := VAR_pop_uxn_opcodes_h_l2882_c40_017d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_8efe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_adab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output;

     -- pop2[uxn_opcodes_h_l2883_c40_0194] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2883_c40_0194_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2883_c40_0194_phase <= VAR_pop2_uxn_opcodes_h_l2883_c40_0194_phase;
     pop2_uxn_opcodes_h_l2883_c40_0194_ins <= VAR_pop2_uxn_opcodes_h_l2883_c40_0194_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2883_c40_0194_return_output := pop2_uxn_opcodes_h_l2883_c40_0194_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_adab_return_output;
     VAR_nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8efe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue := VAR_pop2_uxn_opcodes_h_l2883_c40_0194_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_8a77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_c7f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output;

     -- nip[uxn_opcodes_h_l2884_c40_413b] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2884_c40_413b_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2884_c40_413b_phase <= VAR_nip_uxn_opcodes_h_l2884_c40_413b_phase;
     nip_uxn_opcodes_h_l2884_c40_413b_ins <= VAR_nip_uxn_opcodes_h_l2884_c40_413b_ins;
     nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2884_c40_413b_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2884_c40_413b_return_output := nip_uxn_opcodes_h_l2884_c40_413b_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output;
     VAR_nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_c7f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue := VAR_nip_uxn_opcodes_h_l2884_c40_413b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_9153] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_0e9f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output;

     -- nip2[uxn_opcodes_h_l2885_c40_3922] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2885_c40_3922_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2885_c40_3922_phase <= VAR_nip2_uxn_opcodes_h_l2885_c40_3922_phase;
     nip2_uxn_opcodes_h_l2885_c40_3922_ins <= VAR_nip2_uxn_opcodes_h_l2885_c40_3922_ins;
     nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2885_c40_3922_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2885_c40_3922_return_output := nip2_uxn_opcodes_h_l2885_c40_3922_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_9153_return_output;
     VAR_swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0e9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue := VAR_nip2_uxn_opcodes_h_l2885_c40_3922_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3b1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_e101] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output;

     -- swp[uxn_opcodes_h_l2886_c40_5928] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2886_c40_5928_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2886_c40_5928_phase <= VAR_swp_uxn_opcodes_h_l2886_c40_5928_phase;
     swp_uxn_opcodes_h_l2886_c40_5928_ins <= VAR_swp_uxn_opcodes_h_l2886_c40_5928_ins;
     swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2886_c40_5928_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2886_c40_5928_return_output := swp_uxn_opcodes_h_l2886_c40_5928_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output;
     VAR_swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_e101_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue := VAR_swp_uxn_opcodes_h_l2886_c40_5928_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_d88a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output;

     -- swp2[uxn_opcodes_h_l2887_c40_67be] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2887_c40_67be_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2887_c40_67be_phase <= VAR_swp2_uxn_opcodes_h_l2887_c40_67be_phase;
     swp2_uxn_opcodes_h_l2887_c40_67be_ins <= VAR_swp2_uxn_opcodes_h_l2887_c40_67be_ins;
     swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2887_c40_67be_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2887_c40_67be_return_output := swp2_uxn_opcodes_h_l2887_c40_67be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_c9b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output;
     VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_d88a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue := VAR_swp2_uxn_opcodes_h_l2887_c40_67be_return_output;
     -- rot[uxn_opcodes_h_l2888_c40_f2d3] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2888_c40_f2d3_phase <= VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_phase;
     rot_uxn_opcodes_h_l2888_c40_f2d3_ins <= VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_ins;
     rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_return_output := rot_uxn_opcodes_h_l2888_c40_f2d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_cc1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_dd96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output;
     VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_cc1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue := VAR_rot_uxn_opcodes_h_l2888_c40_f2d3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_012f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output;

     -- rot2[uxn_opcodes_h_l2889_c40_e0ab] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2889_c40_e0ab_phase <= VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_phase;
     rot2_uxn_opcodes_h_l2889_c40_e0ab_ins <= VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_ins;
     rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output := rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_0ed8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output;
     VAR_dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_012f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue := VAR_rot2_uxn_opcodes_h_l2889_c40_e0ab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_2821] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_531f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output;

     -- dup[uxn_opcodes_h_l2890_c40_efea] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2890_c40_efea_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2890_c40_efea_phase <= VAR_dup_uxn_opcodes_h_l2890_c40_efea_phase;
     dup_uxn_opcodes_h_l2890_c40_efea_ins <= VAR_dup_uxn_opcodes_h_l2890_c40_efea_ins;
     dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2890_c40_efea_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2890_c40_efea_return_output := dup_uxn_opcodes_h_l2890_c40_efea_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_2821_return_output;
     VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_531f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue := VAR_dup_uxn_opcodes_h_l2890_c40_efea_return_output;
     -- dup2[uxn_opcodes_h_l2891_c40_2aad] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2891_c40_2aad_phase <= VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_phase;
     dup2_uxn_opcodes_h_l2891_c40_2aad_ins <= VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_ins;
     dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_return_output := dup2_uxn_opcodes_h_l2891_c40_2aad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f859] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_6b03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f859_return_output;
     VAR_ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_6b03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue := VAR_dup2_uxn_opcodes_h_l2891_c40_2aad_return_output;
     -- ovr[uxn_opcodes_h_l2892_c40_b785] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2892_c40_b785_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2892_c40_b785_phase <= VAR_ovr_uxn_opcodes_h_l2892_c40_b785_phase;
     ovr_uxn_opcodes_h_l2892_c40_b785_ins <= VAR_ovr_uxn_opcodes_h_l2892_c40_b785_ins;
     ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2892_c40_b785_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2892_c40_b785_return_output := ovr_uxn_opcodes_h_l2892_c40_b785_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_832e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_3c68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_832e_return_output;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_3c68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue := VAR_ovr_uxn_opcodes_h_l2892_c40_b785_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_7551] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output;

     -- ovr2[uxn_opcodes_h_l2893_c40_5307] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2893_c40_5307_phase <= VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_phase;
     ovr2_uxn_opcodes_h_l2893_c40_5307_ins <= VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_ins;
     ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_return_output := ovr2_uxn_opcodes_h_l2893_c40_5307_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_4d29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output;
     VAR_equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_7551_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue := VAR_ovr2_uxn_opcodes_h_l2893_c40_5307_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_6ef5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_a8f3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output;

     -- equ[uxn_opcodes_h_l2894_c40_e500] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2894_c40_e500_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2894_c40_e500_phase <= VAR_equ_uxn_opcodes_h_l2894_c40_e500_phase;
     equ_uxn_opcodes_h_l2894_c40_e500_ins <= VAR_equ_uxn_opcodes_h_l2894_c40_e500_ins;
     equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2894_c40_e500_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2894_c40_e500_return_output := equ_uxn_opcodes_h_l2894_c40_e500_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output;
     VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_a8f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue := VAR_equ_uxn_opcodes_h_l2894_c40_e500_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_d8d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7860] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output;

     -- equ2[uxn_opcodes_h_l2895_c40_a9b9] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2895_c40_a9b9_phase <= VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_phase;
     equ2_uxn_opcodes_h_l2895_c40_a9b9_ins <= VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_ins;
     equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output := equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7860_return_output;
     VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_d8d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue := VAR_equ2_uxn_opcodes_h_l2895_c40_a9b9_return_output;
     -- neq[uxn_opcodes_h_l2896_c40_bc1b] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2896_c40_bc1b_phase <= VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_phase;
     neq_uxn_opcodes_h_l2896_c40_bc1b_ins <= VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_ins;
     neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_return_output := neq_uxn_opcodes_h_l2896_c40_bc1b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_5597] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_aca8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_5597_return_output;
     VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_aca8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue := VAR_neq_uxn_opcodes_h_l2896_c40_bc1b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_f1d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_723a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output;

     -- neq2[uxn_opcodes_h_l2897_c40_38e0] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2897_c40_38e0_phase <= VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_phase;
     neq2_uxn_opcodes_h_l2897_c40_38e0_ins <= VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_ins;
     neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_return_output := neq2_uxn_opcodes_h_l2897_c40_38e0_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_723a_return_output;
     VAR_gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_f1d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue := VAR_neq2_uxn_opcodes_h_l2897_c40_38e0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_9335] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output;

     -- gth[uxn_opcodes_h_l2898_c40_21f2] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2898_c40_21f2_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2898_c40_21f2_phase <= VAR_gth_uxn_opcodes_h_l2898_c40_21f2_phase;
     gth_uxn_opcodes_h_l2898_c40_21f2_ins <= VAR_gth_uxn_opcodes_h_l2898_c40_21f2_ins;
     gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2898_c40_21f2_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2898_c40_21f2_return_output := gth_uxn_opcodes_h_l2898_c40_21f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_d2c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_9335_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue := VAR_gth_uxn_opcodes_h_l2898_c40_21f2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_01e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_7d75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output;

     -- gth2[uxn_opcodes_h_l2899_c40_7de4] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2899_c40_7de4_phase <= VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_phase;
     gth2_uxn_opcodes_h_l2899_c40_7de4_ins <= VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_ins;
     gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_return_output := gth2_uxn_opcodes_h_l2899_c40_7de4_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output;
     VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_01e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue := VAR_gth2_uxn_opcodes_h_l2899_c40_7de4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_6993] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output;

     -- lth[uxn_opcodes_h_l2900_c40_3d9e] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2900_c40_3d9e_phase <= VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_phase;
     lth_uxn_opcodes_h_l2900_c40_3d9e_ins <= VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_ins;
     lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_return_output := lth_uxn_opcodes_h_l2900_c40_3d9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_d49b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_6993_return_output;
     VAR_lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d49b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue := VAR_lth_uxn_opcodes_h_l2900_c40_3d9e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_a3c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0dae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output;

     -- lth2[uxn_opcodes_h_l2901_c40_d135] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2901_c40_d135_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2901_c40_d135_phase <= VAR_lth2_uxn_opcodes_h_l2901_c40_d135_phase;
     lth2_uxn_opcodes_h_l2901_c40_d135_ins <= VAR_lth2_uxn_opcodes_h_l2901_c40_d135_ins;
     lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2901_c40_d135_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2901_c40_d135_return_output := lth2_uxn_opcodes_h_l2901_c40_d135_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output;
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_a3c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue := VAR_lth2_uxn_opcodes_h_l2901_c40_d135_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_c53d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output;

     -- jmp[uxn_opcodes_h_l2902_c40_3333] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2902_c40_3333_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2902_c40_3333_phase <= VAR_jmp_uxn_opcodes_h_l2902_c40_3333_phase;
     jmp_uxn_opcodes_h_l2902_c40_3333_ins <= VAR_jmp_uxn_opcodes_h_l2902_c40_3333_ins;
     jmp_uxn_opcodes_h_l2902_c40_3333_pc <= VAR_jmp_uxn_opcodes_h_l2902_c40_3333_pc;
     jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2902_c40_3333_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2902_c40_3333_return_output := jmp_uxn_opcodes_h_l2902_c40_3333_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_012c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_012c_return_output;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_c53d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue := VAR_jmp_uxn_opcodes_h_l2902_c40_3333_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_7d4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_d6fa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output;

     -- jmp2[uxn_opcodes_h_l2903_c40_1173] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2903_c40_1173_phase <= VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_phase;
     jmp2_uxn_opcodes_h_l2903_c40_1173_ins <= VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_ins;
     jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_return_output := jmp2_uxn_opcodes_h_l2903_c40_1173_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output;
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d6fa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue := VAR_jmp2_uxn_opcodes_h_l2903_c40_1173_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_b068] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_ce05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output;

     -- jcn[uxn_opcodes_h_l2904_c40_3407] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2904_c40_3407_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2904_c40_3407_phase <= VAR_jcn_uxn_opcodes_h_l2904_c40_3407_phase;
     jcn_uxn_opcodes_h_l2904_c40_3407_ins <= VAR_jcn_uxn_opcodes_h_l2904_c40_3407_ins;
     jcn_uxn_opcodes_h_l2904_c40_3407_pc <= VAR_jcn_uxn_opcodes_h_l2904_c40_3407_pc;
     jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2904_c40_3407_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2904_c40_3407_return_output := jcn_uxn_opcodes_h_l2904_c40_3407_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_b068_return_output;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_ce05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue := VAR_jcn_uxn_opcodes_h_l2904_c40_3407_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_e574] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_43cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output;

     -- jcn2[uxn_opcodes_h_l2905_c40_5a02] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2905_c40_5a02_phase <= VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_phase;
     jcn2_uxn_opcodes_h_l2905_c40_5a02_ins <= VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_ins;
     jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output := jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_e574_return_output;
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_43cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue := VAR_jcn2_uxn_opcodes_h_l2905_c40_5a02_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_acc8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_2ef7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output;

     -- jsr[uxn_opcodes_h_l2906_c40_9bef] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2906_c40_9bef_phase <= VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_phase;
     jsr_uxn_opcodes_h_l2906_c40_9bef_ins <= VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_ins;
     jsr_uxn_opcodes_h_l2906_c40_9bef_pc <= VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_pc;
     jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_return_output := jsr_uxn_opcodes_h_l2906_c40_9bef_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_2ef7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue := VAR_jsr_uxn_opcodes_h_l2906_c40_9bef_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_8140] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output;

     -- jsr2[uxn_opcodes_h_l2907_c40_199f] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2907_c40_199f_phase <= VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_phase;
     jsr2_uxn_opcodes_h_l2907_c40_199f_ins <= VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_ins;
     jsr2_uxn_opcodes_h_l2907_c40_199f_pc <= VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_pc;
     jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_return_output := jsr2_uxn_opcodes_h_l2907_c40_199f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_84c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_8140_return_output;
     VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_84c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue := VAR_jsr2_uxn_opcodes_h_l2907_c40_199f_return_output;
     -- sth[uxn_opcodes_h_l2908_c40_0f7b] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2908_c40_0f7b_phase <= VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_phase;
     sth_uxn_opcodes_h_l2908_c40_0f7b_ins <= VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_ins;
     sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_return_output := sth_uxn_opcodes_h_l2908_c40_0f7b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_7c3d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_4dde] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output;
     VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_7c3d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue := VAR_sth_uxn_opcodes_h_l2908_c40_0f7b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_f126] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output;

     -- sth2[uxn_opcodes_h_l2909_c40_7c61] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2909_c40_7c61_phase <= VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_phase;
     sth2_uxn_opcodes_h_l2909_c40_7c61_ins <= VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_ins;
     sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_return_output := sth2_uxn_opcodes_h_l2909_c40_7c61_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_b13b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output;
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f126_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue := VAR_sth2_uxn_opcodes_h_l2909_c40_7c61_return_output;
     -- ldz[uxn_opcodes_h_l2910_c40_4b4e] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2910_c40_4b4e_phase <= VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_phase;
     ldz_uxn_opcodes_h_l2910_c40_4b4e_ins <= VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_ins;
     ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_stack_read;
     ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output := ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e73a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_2462] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_2462_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue := VAR_ldz_uxn_opcodes_h_l2910_c40_4b4e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_a7c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_27e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output;

     -- ldz2[uxn_opcodes_h_l2911_c40_b453] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2911_c40_b453_phase <= VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_phase;
     ldz2_uxn_opcodes_h_l2911_c40_b453_ins <= VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_ins;
     ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_stack_read;
     ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_return_output := ldz2_uxn_opcodes_h_l2911_c40_b453_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output;
     VAR_stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_27e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue := VAR_ldz2_uxn_opcodes_h_l2911_c40_b453_return_output;
     -- stz[uxn_opcodes_h_l2912_c40_6bec] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2912_c40_6bec_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2912_c40_6bec_phase <= VAR_stz_uxn_opcodes_h_l2912_c40_6bec_phase;
     stz_uxn_opcodes_h_l2912_c40_6bec_ins <= VAR_stz_uxn_opcodes_h_l2912_c40_6bec_ins;
     stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2912_c40_6bec_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2912_c40_6bec_return_output := stz_uxn_opcodes_h_l2912_c40_6bec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0e4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_9770] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_9770_return_output;
     VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0e4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue := VAR_stz_uxn_opcodes_h_l2912_c40_6bec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_dc1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output;

     -- stz2[uxn_opcodes_h_l2913_c40_96cd] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2913_c40_96cd_phase <= VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_phase;
     stz2_uxn_opcodes_h_l2913_c40_96cd_ins <= VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_ins;
     stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_return_output := stz2_uxn_opcodes_h_l2913_c40_96cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_540a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output;
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_540a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue := VAR_stz2_uxn_opcodes_h_l2913_c40_96cd_return_output;
     -- ldr[uxn_opcodes_h_l2914_c40_8dd0] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2914_c40_8dd0_phase <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_phase;
     ldr_uxn_opcodes_h_l2914_c40_8dd0_ins <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_ins;
     ldr_uxn_opcodes_h_l2914_c40_8dd0_pc <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_pc;
     ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_stack_read;
     ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output := ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_c2f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_056f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_056f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue := VAR_ldr_uxn_opcodes_h_l2914_c40_8dd0_return_output;
     -- ldr2[uxn_opcodes_h_l2915_c40_aadd] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2915_c40_aadd_phase <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_phase;
     ldr2_uxn_opcodes_h_l2915_c40_aadd_ins <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_ins;
     ldr2_uxn_opcodes_h_l2915_c40_aadd_pc <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_pc;
     ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_stack_read;
     ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output := ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_c5ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_ae87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output;
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_c5ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue := VAR_ldr2_uxn_opcodes_h_l2915_c40_aadd_return_output;
     -- str1[uxn_opcodes_h_l2916_c40_190e] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2916_c40_190e_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2916_c40_190e_phase <= VAR_str1_uxn_opcodes_h_l2916_c40_190e_phase;
     str1_uxn_opcodes_h_l2916_c40_190e_ins <= VAR_str1_uxn_opcodes_h_l2916_c40_190e_ins;
     str1_uxn_opcodes_h_l2916_c40_190e_pc <= VAR_str1_uxn_opcodes_h_l2916_c40_190e_pc;
     str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2916_c40_190e_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2916_c40_190e_return_output := str1_uxn_opcodes_h_l2916_c40_190e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_f920] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8412] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8412_return_output;
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_f920_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue := VAR_str1_uxn_opcodes_h_l2916_c40_190e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_fb84] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_9413] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output;

     -- str2[uxn_opcodes_h_l2917_c40_5cda] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2917_c40_5cda_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2917_c40_5cda_phase <= VAR_str2_uxn_opcodes_h_l2917_c40_5cda_phase;
     str2_uxn_opcodes_h_l2917_c40_5cda_ins <= VAR_str2_uxn_opcodes_h_l2917_c40_5cda_ins;
     str2_uxn_opcodes_h_l2917_c40_5cda_pc <= VAR_str2_uxn_opcodes_h_l2917_c40_5cda_pc;
     str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2917_c40_5cda_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2917_c40_5cda_return_output := str2_uxn_opcodes_h_l2917_c40_5cda_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output;
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9413_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue := VAR_str2_uxn_opcodes_h_l2917_c40_5cda_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_9e46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output;

     -- lda[uxn_opcodes_h_l2918_c40_e0d3] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2918_c40_e0d3_phase <= VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_phase;
     lda_uxn_opcodes_h_l2918_c40_e0d3_ins <= VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_ins;
     lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_stack_read;
     lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_return_output := lda_uxn_opcodes_h_l2918_c40_e0d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_8526] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8526_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue := VAR_lda_uxn_opcodes_h_l2918_c40_e0d3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_2fe2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output;

     -- lda2[uxn_opcodes_h_l2919_c40_0049] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2919_c40_0049_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2919_c40_0049_phase <= VAR_lda2_uxn_opcodes_h_l2919_c40_0049_phase;
     lda2_uxn_opcodes_h_l2919_c40_0049_ins <= VAR_lda2_uxn_opcodes_h_l2919_c40_0049_ins;
     lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_stack_read;
     lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_0049_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2919_c40_0049_return_output := lda2_uxn_opcodes_h_l2919_c40_0049_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_610b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output;
     VAR_sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_610b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue := VAR_lda2_uxn_opcodes_h_l2919_c40_0049_return_output;
     -- sta[uxn_opcodes_h_l2920_c40_575a] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2920_c40_575a_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2920_c40_575a_phase <= VAR_sta_uxn_opcodes_h_l2920_c40_575a_phase;
     sta_uxn_opcodes_h_l2920_c40_575a_ins <= VAR_sta_uxn_opcodes_h_l2920_c40_575a_ins;
     sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2920_c40_575a_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2920_c40_575a_return_output := sta_uxn_opcodes_h_l2920_c40_575a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f224] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_2a9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output;
     VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f224_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue := VAR_sta_uxn_opcodes_h_l2920_c40_575a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_edd0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output;

     -- sta2[uxn_opcodes_h_l2921_c40_ab2e] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2921_c40_ab2e_phase <= VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_phase;
     sta2_uxn_opcodes_h_l2921_c40_ab2e_ins <= VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_ins;
     sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output := sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_4133] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_4133_return_output;
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_edd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue := VAR_sta2_uxn_opcodes_h_l2921_c40_ab2e_return_output;
     -- dei[uxn_opcodes_h_l2922_c40_2a05] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2922_c40_2a05_phase <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_phase;
     dei_uxn_opcodes_h_l2922_c40_2a05_ins <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_ins;
     dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_controller0_buttons;
     dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_stack_read;
     dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2922_c40_2a05_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2922_c40_2a05_return_output := dei_uxn_opcodes_h_l2922_c40_2a05_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_1675] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_090c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_090c_return_output;
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_1675_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue := VAR_dei_uxn_opcodes_h_l2922_c40_2a05_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_bb15] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output;

     -- dei2[uxn_opcodes_h_l2923_c40_f1be] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2923_c40_f1be_phase <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_phase;
     dei2_uxn_opcodes_h_l2923_c40_f1be_ins <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_ins;
     dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_controller0_buttons;
     dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_stack_read;
     dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_return_output := dei2_uxn_opcodes_h_l2923_c40_f1be_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_e248] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_e248_return_output;
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_bb15_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue := VAR_dei2_uxn_opcodes_h_l2923_c40_f1be_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_2daf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_3b82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output;

     -- deo[uxn_opcodes_h_l2924_c40_dd75] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2924_c40_dd75_phase <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_phase;
     deo_uxn_opcodes_h_l2924_c40_dd75_ins <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_ins;
     deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_stack_read;
     deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_device_ram_read;
     deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_dd75_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2924_c40_dd75_return_output := deo_uxn_opcodes_h_l2924_c40_dd75_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output;
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_3b82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue := VAR_deo_uxn_opcodes_h_l2924_c40_dd75_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_2500] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output;

     -- deo2[uxn_opcodes_h_l2925_c40_fd90] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2925_c40_fd90_phase <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_phase;
     deo2_uxn_opcodes_h_l2925_c40_fd90_ins <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_ins;
     deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_stack_read;
     deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_return_output := deo2_uxn_opcodes_h_l2925_c40_fd90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_45e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_2500_return_output;
     VAR_add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_45e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue := VAR_deo2_uxn_opcodes_h_l2925_c40_fd90_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_62ed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_ce62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output;

     -- add[uxn_opcodes_h_l2926_c40_0f1b] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2926_c40_0f1b_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2926_c40_0f1b_phase <= VAR_add_uxn_opcodes_h_l2926_c40_0f1b_phase;
     add_uxn_opcodes_h_l2926_c40_0f1b_ins <= VAR_add_uxn_opcodes_h_l2926_c40_0f1b_ins;
     add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read <= VAR_add_uxn_opcodes_h_l2926_c40_0f1b_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2926_c40_0f1b_return_output := add_uxn_opcodes_h_l2926_c40_0f1b_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output;
     VAR_add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_ce62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue := VAR_add_uxn_opcodes_h_l2926_c40_0f1b_return_output;
     -- add2[uxn_opcodes_h_l2927_c40_5617] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2927_c40_5617_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2927_c40_5617_phase <= VAR_add2_uxn_opcodes_h_l2927_c40_5617_phase;
     add2_uxn_opcodes_h_l2927_c40_5617_ins <= VAR_add2_uxn_opcodes_h_l2927_c40_5617_ins;
     add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2927_c40_5617_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2927_c40_5617_return_output := add2_uxn_opcodes_h_l2927_c40_5617_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_7117] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_575f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_575f_return_output;
     VAR_sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_7117_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue := VAR_add2_uxn_opcodes_h_l2927_c40_5617_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_efc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output;

     -- sub[uxn_opcodes_h_l2928_c40_6da4] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2928_c40_6da4_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2928_c40_6da4_phase <= VAR_sub_uxn_opcodes_h_l2928_c40_6da4_phase;
     sub_uxn_opcodes_h_l2928_c40_6da4_ins <= VAR_sub_uxn_opcodes_h_l2928_c40_6da4_ins;
     sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2928_c40_6da4_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2928_c40_6da4_return_output := sub_uxn_opcodes_h_l2928_c40_6da4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_e689] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_e689_return_output;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_efc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue := VAR_sub_uxn_opcodes_h_l2928_c40_6da4_return_output;
     -- sub2[uxn_opcodes_h_l2929_c40_f565] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2929_c40_f565_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2929_c40_f565_phase <= VAR_sub2_uxn_opcodes_h_l2929_c40_f565_phase;
     sub2_uxn_opcodes_h_l2929_c40_f565_ins <= VAR_sub2_uxn_opcodes_h_l2929_c40_f565_ins;
     sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2929_c40_f565_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2929_c40_f565_return_output := sub2_uxn_opcodes_h_l2929_c40_f565_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_8c66] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_737c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output;
     VAR_mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_737c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue := VAR_sub2_uxn_opcodes_h_l2929_c40_f565_return_output;
     -- mul[uxn_opcodes_h_l2930_c40_3491] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2930_c40_3491_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2930_c40_3491_phase <= VAR_mul_uxn_opcodes_h_l2930_c40_3491_phase;
     mul_uxn_opcodes_h_l2930_c40_3491_ins <= VAR_mul_uxn_opcodes_h_l2930_c40_3491_ins;
     mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2930_c40_3491_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2930_c40_3491_return_output := mul_uxn_opcodes_h_l2930_c40_3491_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_32fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_1555] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output;
     VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_1555_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue := VAR_mul_uxn_opcodes_h_l2930_c40_3491_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_2c08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output;

     -- mul2[uxn_opcodes_h_l2931_c40_3e17] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2931_c40_3e17_phase <= VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_phase;
     mul2_uxn_opcodes_h_l2931_c40_3e17_ins <= VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_ins;
     mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_return_output := mul2_uxn_opcodes_h_l2931_c40_3e17_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_2243] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_2243_return_output;
     VAR_div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_2c08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue := VAR_mul2_uxn_opcodes_h_l2931_c40_3e17_return_output;
     -- div[uxn_opcodes_h_l2932_c40_1c6b] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2932_c40_1c6b_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2932_c40_1c6b_phase <= VAR_div_uxn_opcodes_h_l2932_c40_1c6b_phase;
     div_uxn_opcodes_h_l2932_c40_1c6b_ins <= VAR_div_uxn_opcodes_h_l2932_c40_1c6b_ins;
     div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read <= VAR_div_uxn_opcodes_h_l2932_c40_1c6b_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2932_c40_1c6b_return_output := div_uxn_opcodes_h_l2932_c40_1c6b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a999] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_523b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a999_return_output;
     VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_523b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue := VAR_div_uxn_opcodes_h_l2932_c40_1c6b_return_output;
     -- div2[uxn_opcodes_h_l2933_c40_bcc6] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2933_c40_bcc6_phase <= VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_phase;
     div2_uxn_opcodes_h_l2933_c40_bcc6_ins <= VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_ins;
     div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_return_output := div2_uxn_opcodes_h_l2933_c40_bcc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_cfb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_937e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_937e_return_output;
     VAR_and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_cfb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue := VAR_div2_uxn_opcodes_h_l2933_c40_bcc6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_7ed7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_060f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output;

     -- and[uxn_opcodes_h_l2934_c40_8b38] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2934_c40_8b38_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2934_c40_8b38_phase <= VAR_and_uxn_opcodes_h_l2934_c40_8b38_phase;
     and_uxn_opcodes_h_l2934_c40_8b38_ins <= VAR_and_uxn_opcodes_h_l2934_c40_8b38_ins;
     and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read <= VAR_and_uxn_opcodes_h_l2934_c40_8b38_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2934_c40_8b38_return_output := and_uxn_opcodes_h_l2934_c40_8b38_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_060f_return_output;
     VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7ed7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue := VAR_and_uxn_opcodes_h_l2934_c40_8b38_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6a7f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_0a15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output;

     -- and2[uxn_opcodes_h_l2935_c40_3ef7] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2935_c40_3ef7_phase <= VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_phase;
     and2_uxn_opcodes_h_l2935_c40_3ef7_ins <= VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_ins;
     and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_return_output := and2_uxn_opcodes_h_l2935_c40_3ef7_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output;
     VAR_ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue := VAR_and2_uxn_opcodes_h_l2935_c40_3ef7_return_output;
     -- ora[uxn_opcodes_h_l2936_c40_9217] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2936_c40_9217_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2936_c40_9217_phase <= VAR_ora_uxn_opcodes_h_l2936_c40_9217_phase;
     ora_uxn_opcodes_h_l2936_c40_9217_ins <= VAR_ora_uxn_opcodes_h_l2936_c40_9217_ins;
     ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2936_c40_9217_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2936_c40_9217_return_output := ora_uxn_opcodes_h_l2936_c40_9217_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_10d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_86cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output;
     VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_86cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue := VAR_ora_uxn_opcodes_h_l2936_c40_9217_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_a7ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_903c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output;

     -- ora2[uxn_opcodes_h_l2937_c40_6a22] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2937_c40_6a22_phase <= VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_phase;
     ora2_uxn_opcodes_h_l2937_c40_6a22_ins <= VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_ins;
     ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_return_output := ora2_uxn_opcodes_h_l2937_c40_6a22_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output;
     VAR_eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_903c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue := VAR_ora2_uxn_opcodes_h_l2937_c40_6a22_return_output;
     -- eor[uxn_opcodes_h_l2938_c40_1c86] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2938_c40_1c86_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2938_c40_1c86_phase <= VAR_eor_uxn_opcodes_h_l2938_c40_1c86_phase;
     eor_uxn_opcodes_h_l2938_c40_1c86_ins <= VAR_eor_uxn_opcodes_h_l2938_c40_1c86_ins;
     eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2938_c40_1c86_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2938_c40_1c86_return_output := eor_uxn_opcodes_h_l2938_c40_1c86_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_970b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_0f76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output;
     VAR_eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_970b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue := VAR_eor_uxn_opcodes_h_l2938_c40_1c86_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_bcda] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_3706] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output;

     -- eor2[uxn_opcodes_h_l2939_c40_b770] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2939_c40_b770_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2939_c40_b770_phase <= VAR_eor2_uxn_opcodes_h_l2939_c40_b770_phase;
     eor2_uxn_opcodes_h_l2939_c40_b770_ins <= VAR_eor2_uxn_opcodes_h_l2939_c40_b770_ins;
     eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2939_c40_b770_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2939_c40_b770_return_output := eor2_uxn_opcodes_h_l2939_c40_b770_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output;
     VAR_sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_3706_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue := VAR_eor2_uxn_opcodes_h_l2939_c40_b770_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f0e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output;

     -- sft[uxn_opcodes_h_l2940_c40_ee29] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2940_c40_ee29_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2940_c40_ee29_phase <= VAR_sft_uxn_opcodes_h_l2940_c40_ee29_phase;
     sft_uxn_opcodes_h_l2940_c40_ee29_ins <= VAR_sft_uxn_opcodes_h_l2940_c40_ee29_ins;
     sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2940_c40_ee29_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2940_c40_ee29_return_output := sft_uxn_opcodes_h_l2940_c40_ee29_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f0e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue := VAR_sft_uxn_opcodes_h_l2940_c40_ee29_return_output;
     -- sft2[uxn_opcodes_h_l2941_c40_827b] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2941_c40_827b_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2941_c40_827b_phase <= VAR_sft2_uxn_opcodes_h_l2941_c40_827b_phase;
     sft2_uxn_opcodes_h_l2941_c40_827b_ins <= VAR_sft2_uxn_opcodes_h_l2941_c40_827b_ins;
     sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2941_c40_827b_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2941_c40_827b_return_output := sft2_uxn_opcodes_h_l2941_c40_827b_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue := VAR_sft2_uxn_opcodes_h_l2941_c40_827b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_bcda] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_bcda_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_0f76] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_0f76_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_a7ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_a7ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_10d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_10d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_0a15] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_0a15_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_060f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_060f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_937e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_937e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_a999] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a999_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_2243] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_2243_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_32fe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_32fe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_8c66] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_8c66_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_e689] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_e689_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_575f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_575f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_62ed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_62ed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_2500] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_2500_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_2daf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_2daf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_e248] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_e248_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_090c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_090c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_4133] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_4133_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_2a9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_2a9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_2fe2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fe2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_9e46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_9e46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_fb84] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_fb84_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_8412] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8412_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_ae87] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_ae87_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_c2f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_c2f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_dc1b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_dc1b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_9770] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_9770_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_a7c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_a7c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_e73a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e73a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_b13b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_b13b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_4dde] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_4dde_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_8140] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_8140_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_acc8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_acc8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_e574] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_e574_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_b068] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_b068_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_7d4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_7d4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_012c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_012c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_0dae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0dae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_6993] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_6993_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_7d75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_7d75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_d2c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_d2c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_723a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_723a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_5597] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_5597_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_7860] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7860_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_6ef5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_6ef5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_4d29] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_4d29_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_832e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_832e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_f859] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f859_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_2821] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_2821_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_0ed8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_0ed8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_dd96] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_dd96_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_c9b9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_c9b9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_3b1c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3b1c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_9153] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_9153_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_8a77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_8a77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_adab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_adab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_4535] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_4535_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_806e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_806e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_ba1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ba1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_c00b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_c00b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_14b3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_14b3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_611d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_611d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_37c3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_37c3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_d09a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_d09a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_df0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_df0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_61e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_61e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_0e80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0e80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_1e9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_1e9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c2_cd23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2967_c34_30e2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_30e2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2958_c3_2108] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_2108_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2964_c34_d5a3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_d5a3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2944_c17_ceb6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_ceb6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_740d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_740d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2968_c37_252a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_252a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.vram_write_layer;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2952_c68_43cf] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_43cf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2963_c40_e350] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_e350_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_1d72 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_1d72_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2962_c39_19af] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_19af_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2966_c33_fe2b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_fe2b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2965_c30_a529] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_a529_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2970_c32_e08b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e08b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output.is_opc_done;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_ceb6_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_2108_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_740d_return_output;
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c58_5027] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_5027_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_43cf_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2949_l2947_DUPLICATE_3a7c LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2949_l2947_DUPLICATE_3a7c_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_1d72_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_2007] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_left;
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output := BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_a7a9 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_a7a9_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_cd23_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_19af_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_e350_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_d5a3_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_a529_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_fe2b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_30e2_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_252a_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_740d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_e08b_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c20_e392_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_2007_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2949_l2947_DUPLICATE_3a7c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2949_l2947_DUPLICATE_3a7c_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_5027_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_a7a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_a7a9_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_c195] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output;

     -- MUX[uxn_opcodes_h_l2953_c20_e392] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c20_e392_cond <= VAR_MUX_uxn_opcodes_h_l2953_c20_e392_cond;
     MUX_uxn_opcodes_h_l2953_c20_e392_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iftrue;
     MUX_uxn_opcodes_h_l2953_c20_e392_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c20_e392_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c20_e392_return_output := MUX_uxn_opcodes_h_l2953_c20_e392_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_4d5e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2947_c3_0864 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_c195_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2949_c3_5e7d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_4d5e_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right := VAR_MUX_uxn_opcodes_h_l2953_c20_e392_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse := VAR_sp0_uxn_opcodes_h_l2949_c3_5e7d;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue := VAR_sp1_uxn_opcodes_h_l2947_c3_0864;
     -- sp0_MUX[uxn_opcodes_h_l2946_c2_9603] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_cond;
     sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue;
     sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output := sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2946_c2_9603] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_cond;
     sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iftrue;
     sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output := sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_9603_return_output;
     -- MUX[uxn_opcodes_h_l2952_c29_90f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c29_90f5_cond <= VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_cond;
     MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iftrue;
     MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_return_output := MUX_uxn_opcodes_h_l2952_c29_90f5_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c19_2797] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2797_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2952_c29_90f5_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_2797_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_a943] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_a943_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2953_c2_ed5d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_left;
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output := BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_ed5d_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2955_c24_195c] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_stack_address;
     stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_value;
     stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output := stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_195c_return_output;
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
