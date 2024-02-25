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
entity eval_opcode_phased_0CLK_0f98f30e is
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
end eval_opcode_phased_0CLK_0f98f30e;
architecture arch of eval_opcode_phased_0CLK_0f98f30e is
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
-- BIN_OP_AND[uxn_opcodes_h_l2864_c14_8132]
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_5b9b]
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2865_c14_78b6]
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_6f9a]
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_5a76]
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c14_8aaa]
signal MUX_uxn_opcodes_h_l2865_c14_8aaa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2866_c8_0aae]
signal MUX_uxn_opcodes_h_l2866_c8_0aae_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_0aae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_764e]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_799a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c2_5eec]
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2872_c2_5eec]
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2872_c48_1c01]
signal brk_uxn_opcodes_h_l2872_c48_1c01_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2872_c48_1c01_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_241b]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_f253]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_853f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_799a]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2873_c40_a850]
signal jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_a850_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_a850_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_a850_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_9160]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_d0ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_9394]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_853f]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2874_c40_5153]
signal jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_5153_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_5153_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_5153_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1b30]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_a70a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_e0da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_9394]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2875_c40_23f0]
signal jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_23f0_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_23f0_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_23f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_0332]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_cdbf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_dea3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_e0da]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2876_c40_36d0]
signal lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_36d0_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_36d0_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_36d0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_0591]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_2929]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_638f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_dea3]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2877_c40_d94a]
signal lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_d94a_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_d94a_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_d94a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_fb0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_e899]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_2b3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_638f]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2878_c40_8098]
signal lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_8098_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_8098_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_8098_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_a4ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_9f20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_d92b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_2b3d]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2879_c40_a734]
signal lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_a734_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_a734_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_a734_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_9a28]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_80d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_9514]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_d92b]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2880_c40_a430]
signal inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_a430_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_a430_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_a430_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_32d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_0fc6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_20d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_9514]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2881_c40_b02f]
signal inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_b02f_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_b02f_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_b02f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_f3a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_a341]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_6647]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_20d7]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2882_c40_d09a]
signal pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_d09a_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_d09a_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_d09a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_2d37]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_3fcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_3dbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_6647]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2883_c40_223d]
signal pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_223d_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_223d_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_223d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_29f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_8c12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_5f88]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_3dbb]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2884_c40_4213]
signal nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_4213_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_4213_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_4213_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_7e4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_f0a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_3c46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_5f88]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2885_c40_df9c]
signal nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_df9c_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_df9c_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_df9c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_1189]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_f48c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_22e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_3c46]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2886_c40_1ea8]
signal swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_1ea8_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_1ea8_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_1ea8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_3f24]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_bdb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_68d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_22e4]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2887_c40_08bf]
signal swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_08bf_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_08bf_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_08bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_9e3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_630c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_375c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_68d1]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2888_c40_299b]
signal rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_299b_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_299b_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_299b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_2199]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_e8dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_f72e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_375c]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2889_c40_1d4a]
signal rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_1d4a_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_1d4a_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_3384]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_3b64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_31b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_f72e]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2890_c40_931d]
signal dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_931d_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_931d_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_931d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7a47]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_03ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_d7ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_31b7]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2891_c40_9f79]
signal dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_9f79_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_9f79_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_9f79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_d152]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_63be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_0a2c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_d7ba]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2892_c40_690d]
signal ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_690d_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_690d_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_690d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_6c8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_cdb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_ca3b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_0a2c]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2893_c40_927d]
signal ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_927d_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_927d_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_927d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_855b]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_0da5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_e68f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_ca3b]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2894_c40_12c7]
signal equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_12c7_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_12c7_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_12c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_31ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_7b83]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_82fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_e68f]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2895_c40_1527]
signal equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1527_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1527_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_1527_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_65f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3673]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7314]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_82fd]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2896_c40_36c6]
signal neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_36c6_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_36c6_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_36c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_e770]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_a693]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_66ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_7314]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2897_c40_de30]
signal neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_de30_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_de30_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_de30_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8250]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_0bb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_cda5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_66ca]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2898_c40_35e0]
signal gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_35e0_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_35e0_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_35e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1dcc]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_892a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6f10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_cda5]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2899_c40_390f]
signal gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_390f_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_390f_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_390f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_1392]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_d0bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_d0f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_6f10]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2900_c40_7435]
signal lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_7435_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_7435_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_7435_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_d842]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_35ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_2321]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_d0f2]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2901_c40_6ede]
signal lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_6ede_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_6ede_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_6ede_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_f0ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_212f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0f09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_2321]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2902_c40_addc]
signal jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_addc_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_addc_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_addc_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_addc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_dc65]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ad6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_7a6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_0f09]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2903_c40_449f]
signal jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_449f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_449f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_449f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_43d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_15db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_f6e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_7a6d]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2904_c40_dcbd]
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_ba74]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_7d3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_1b02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_f6e8]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2905_c40_08a8]
signal jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_08a8_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_08a8_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_6a1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_5545]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_2e11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_1b02]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2906_c40_13d3]
signal jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_13d3_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_13d3_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_13d3_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_13d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6fd2]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_067d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_06cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_2e11]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2907_c40_0a83]
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_1d08]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f819]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_1194]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_06cd]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2908_c40_2c5e]
signal sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2c5e_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2c5e_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_2c5e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_8703]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_cf56]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_021a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_1194]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2909_c40_49ac]
signal sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_49ac_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_49ac_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_49ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_acde]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0ebf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_5c7a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_021a]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2910_c40_3c35]
signal ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_3c35_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_3c35_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_3c35_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_4ca8]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_9d34]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_f685]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_5c7a]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2911_c40_afd9]
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ac3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_c53e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_2225]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_f685]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2912_c40_d3e2]
signal stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_d3e2_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_d3e2_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_d3e2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_9fa2]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_8f88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_424f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_2225]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2913_c40_ddcd]
signal stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_ddcd_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_ddcd_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_7d92]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_565a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_f899]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_424f]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2914_c40_73cc]
signal ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_73cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_d9b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_0f75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_bc33]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_f899]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2915_c40_d5b8]
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_a830]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_0e59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_eb4b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_bc33]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2916_c40_c015]
signal str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_c015_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_c015_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_c015_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_c015_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_3848]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_85b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_aec3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_eb4b]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2917_c40_176b]
signal str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_176b_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_176b_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_176b_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_176b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b68a]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_d0d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_77ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_aec3]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2918_c40_4ac1]
signal lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_4ac1_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_4ac1_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_4ac1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_b231]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_2d1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_ea47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_77ab]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2919_c40_0150]
signal lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0150_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0150_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_0150_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_8240]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_c186]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_7498]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_ea47]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2920_c40_c9ec]
signal sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_c9ec_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_c9ec_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_c9ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b333]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_37e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_a962]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_7498]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2921_c40_6808]
signal sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_6808_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_6808_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_6808_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_1b8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6684]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_5b1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_a962]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2922_c40_25d5]
signal dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_25d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c7b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_721d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_6077]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_5b1d]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2923_c40_2c9d]
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_0b10]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_e169]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_82ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_6077]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2924_c40_37b0]
signal deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_37b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_12c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_bad0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_52c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_82ce]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2925_c40_ddfb]
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_b9cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_645a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_6896]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_52c3]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2926_c40_f119]
signal add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2926_c40_f119_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_f119_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_f119_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_fa49]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d6cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_26ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_6896]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2927_c40_b710]
signal add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_b710_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_b710_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_b710_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e112]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_9a3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_0a4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_26ad]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2928_c40_1a41]
signal sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_1a41_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_1a41_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_1a41_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_c1c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_8fcf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_36e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_0a4d]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2929_c40_f4c7]
signal sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f4c7_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f4c7_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c621]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_038b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_0013]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_36e3]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2930_c40_1282]
signal mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_1282_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_1282_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_1282_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_5324]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_f06e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_7eb9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_0013]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2931_c40_af50]
signal mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_af50_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_af50_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_af50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_365c]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_7850]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_d9fe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_7eb9]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2932_c40_3a2f]
signal div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2932_c40_3a2f_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_3a2f_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_3a2f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_fdfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_403f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_7129]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_d9fe]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2933_c40_8bd0]
signal div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_8bd0_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_8bd0_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_8bd0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_8b1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_d0b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_46b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_7129]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2934_c40_fd28]
signal and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2934_c40_fd28_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_fd28_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_fd28_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_0ed0]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_1678]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_0c77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_46b5]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2935_c40_c167]
signal and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_c167_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_c167_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_c167_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0623]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_3ec5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_b7fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_0c77]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2936_c40_52d3]
signal ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_52d3_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_52d3_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_52d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_43ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_0b09]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_7ffa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_b7fc]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2937_c40_7bd2]
signal ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7bd2_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7bd2_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_a8c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_9e27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_7e03]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_7ffa]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2938_c40_0a62]
signal eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_0a62_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_0a62_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_0a62_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_9593]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_c3e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_51e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_7e03]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2939_c40_9be0]
signal eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_9be0_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_9be0_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_9be0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_89f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_4f96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_2c2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_51e7]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2940_c40_2b03]
signal sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_2b03_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_2b03_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_2b03_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_ff0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_2444]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_2c2d]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2941_c40_207e]
signal sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_207e_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_207e_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_207e_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2943_c16_dd81]
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_13bd]
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2946_c2_53a6]
signal sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2946_c2_53a6]
signal sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_e096]
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_a615]
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2952_c29_4da6]
signal MUX_uxn_opcodes_h_l2952_c29_4da6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_4da6_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_3da0]
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2953_c20_492a]
signal MUX_uxn_opcodes_h_l2953_c20_492a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_492a_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_492a_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_492a_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2953_c2_a20d]
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2955_c24_9c2a]
signal stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132
BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6
BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output);

-- MUX_uxn_opcodes_h_l2865_c14_8aaa
MUX_uxn_opcodes_h_l2865_c14_8aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c14_8aaa_cond,
MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue,
MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse,
MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output);

-- MUX_uxn_opcodes_h_l2866_c8_0aae
MUX_uxn_opcodes_h_l2866_c8_0aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2866_c8_0aae_cond,
MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue,
MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse,
MUX_uxn_opcodes_h_l2866_c8_0aae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec
opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec
is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond,
is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue,
is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse,
is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output);

-- brk_uxn_opcodes_h_l2872_c48_1c01
brk_uxn_opcodes_h_l2872_c48_1c01 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2872_c48_1c01_phase,
brk_uxn_opcodes_h_l2872_c48_1c01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_799a
opc_result_MUX_uxn_opcodes_h_l2873_c7_799a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output);

-- jci_uxn_opcodes_h_l2873_c40_a850
jci_uxn_opcodes_h_l2873_c40_a850 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2873_c40_a850_phase,
jci_uxn_opcodes_h_l2873_c40_a850_pc,
jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read,
jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read,
jci_uxn_opcodes_h_l2873_c40_a850_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_853f
opc_result_MUX_uxn_opcodes_h_l2874_c7_853f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output);

-- jmi_uxn_opcodes_h_l2874_c40_5153
jmi_uxn_opcodes_h_l2874_c40_5153 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2874_c40_5153_phase,
jmi_uxn_opcodes_h_l2874_c40_5153_pc,
jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read,
jmi_uxn_opcodes_h_l2874_c40_5153_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_9394
opc_result_MUX_uxn_opcodes_h_l2875_c7_9394 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output);

-- jsi_uxn_opcodes_h_l2875_c40_23f0
jsi_uxn_opcodes_h_l2875_c40_23f0 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2875_c40_23f0_phase,
jsi_uxn_opcodes_h_l2875_c40_23f0_pc,
jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read,
jsi_uxn_opcodes_h_l2875_c40_23f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da
opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output);

-- lit_uxn_opcodes_h_l2876_c40_36d0
lit_uxn_opcodes_h_l2876_c40_36d0 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2876_c40_36d0_phase,
lit_uxn_opcodes_h_l2876_c40_36d0_pc,
lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read,
lit_uxn_opcodes_h_l2876_c40_36d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3
opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output);

-- lit2_uxn_opcodes_h_l2877_c40_d94a
lit2_uxn_opcodes_h_l2877_c40_d94a : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2877_c40_d94a_phase,
lit2_uxn_opcodes_h_l2877_c40_d94a_pc,
lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read,
lit2_uxn_opcodes_h_l2877_c40_d94a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_638f
opc_result_MUX_uxn_opcodes_h_l2878_c7_638f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output);

-- lit_uxn_opcodes_h_l2878_c40_8098
lit_uxn_opcodes_h_l2878_c40_8098 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2878_c40_8098_phase,
lit_uxn_opcodes_h_l2878_c40_8098_pc,
lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read,
lit_uxn_opcodes_h_l2878_c40_8098_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d
opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output);

-- lit2_uxn_opcodes_h_l2879_c40_a734
lit2_uxn_opcodes_h_l2879_c40_a734 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2879_c40_a734_phase,
lit2_uxn_opcodes_h_l2879_c40_a734_pc,
lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read,
lit2_uxn_opcodes_h_l2879_c40_a734_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b
opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output);

-- inc_uxn_opcodes_h_l2880_c40_a430
inc_uxn_opcodes_h_l2880_c40_a430 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2880_c40_a430_phase,
inc_uxn_opcodes_h_l2880_c40_a430_ins,
inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read,
inc_uxn_opcodes_h_l2880_c40_a430_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_9514
opc_result_MUX_uxn_opcodes_h_l2881_c7_9514 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output);

-- inc2_uxn_opcodes_h_l2881_c40_b02f
inc2_uxn_opcodes_h_l2881_c40_b02f : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2881_c40_b02f_phase,
inc2_uxn_opcodes_h_l2881_c40_b02f_ins,
inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read,
inc2_uxn_opcodes_h_l2881_c40_b02f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7
opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output);

-- pop_uxn_opcodes_h_l2882_c40_d09a
pop_uxn_opcodes_h_l2882_c40_d09a : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2882_c40_d09a_phase,
pop_uxn_opcodes_h_l2882_c40_d09a_ins,
pop_uxn_opcodes_h_l2882_c40_d09a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_6647
opc_result_MUX_uxn_opcodes_h_l2883_c7_6647 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output);

-- pop2_uxn_opcodes_h_l2883_c40_223d
pop2_uxn_opcodes_h_l2883_c40_223d : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2883_c40_223d_phase,
pop2_uxn_opcodes_h_l2883_c40_223d_ins,
pop2_uxn_opcodes_h_l2883_c40_223d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb
opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output);

-- nip_uxn_opcodes_h_l2884_c40_4213
nip_uxn_opcodes_h_l2884_c40_4213 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2884_c40_4213_phase,
nip_uxn_opcodes_h_l2884_c40_4213_ins,
nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read,
nip_uxn_opcodes_h_l2884_c40_4213_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88
opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output);

-- nip2_uxn_opcodes_h_l2885_c40_df9c
nip2_uxn_opcodes_h_l2885_c40_df9c : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2885_c40_df9c_phase,
nip2_uxn_opcodes_h_l2885_c40_df9c_ins,
nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read,
nip2_uxn_opcodes_h_l2885_c40_df9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46
opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output);

-- swp_uxn_opcodes_h_l2886_c40_1ea8
swp_uxn_opcodes_h_l2886_c40_1ea8 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2886_c40_1ea8_phase,
swp_uxn_opcodes_h_l2886_c40_1ea8_ins,
swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read,
swp_uxn_opcodes_h_l2886_c40_1ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4
opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output);

-- swp2_uxn_opcodes_h_l2887_c40_08bf
swp2_uxn_opcodes_h_l2887_c40_08bf : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2887_c40_08bf_phase,
swp2_uxn_opcodes_h_l2887_c40_08bf_ins,
swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read,
swp2_uxn_opcodes_h_l2887_c40_08bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1
opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output);

-- rot_uxn_opcodes_h_l2888_c40_299b
rot_uxn_opcodes_h_l2888_c40_299b : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2888_c40_299b_phase,
rot_uxn_opcodes_h_l2888_c40_299b_ins,
rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read,
rot_uxn_opcodes_h_l2888_c40_299b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_375c
opc_result_MUX_uxn_opcodes_h_l2889_c7_375c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output);

-- rot2_uxn_opcodes_h_l2889_c40_1d4a
rot2_uxn_opcodes_h_l2889_c40_1d4a : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2889_c40_1d4a_phase,
rot2_uxn_opcodes_h_l2889_c40_1d4a_ins,
rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read,
rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e
opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output);

-- dup_uxn_opcodes_h_l2890_c40_931d
dup_uxn_opcodes_h_l2890_c40_931d : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2890_c40_931d_phase,
dup_uxn_opcodes_h_l2890_c40_931d_ins,
dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read,
dup_uxn_opcodes_h_l2890_c40_931d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7
opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output);

-- dup2_uxn_opcodes_h_l2891_c40_9f79
dup2_uxn_opcodes_h_l2891_c40_9f79 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2891_c40_9f79_phase,
dup2_uxn_opcodes_h_l2891_c40_9f79_ins,
dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read,
dup2_uxn_opcodes_h_l2891_c40_9f79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba
opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output);

-- ovr_uxn_opcodes_h_l2892_c40_690d
ovr_uxn_opcodes_h_l2892_c40_690d : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2892_c40_690d_phase,
ovr_uxn_opcodes_h_l2892_c40_690d_ins,
ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read,
ovr_uxn_opcodes_h_l2892_c40_690d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c
opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output);

-- ovr2_uxn_opcodes_h_l2893_c40_927d
ovr2_uxn_opcodes_h_l2893_c40_927d : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2893_c40_927d_phase,
ovr2_uxn_opcodes_h_l2893_c40_927d_ins,
ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read,
ovr2_uxn_opcodes_h_l2893_c40_927d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b
opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output);

-- equ_uxn_opcodes_h_l2894_c40_12c7
equ_uxn_opcodes_h_l2894_c40_12c7 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2894_c40_12c7_phase,
equ_uxn_opcodes_h_l2894_c40_12c7_ins,
equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read,
equ_uxn_opcodes_h_l2894_c40_12c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f
opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output);

-- equ2_uxn_opcodes_h_l2895_c40_1527
equ2_uxn_opcodes_h_l2895_c40_1527 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2895_c40_1527_phase,
equ2_uxn_opcodes_h_l2895_c40_1527_ins,
equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read,
equ2_uxn_opcodes_h_l2895_c40_1527_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd
opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output);

-- neq_uxn_opcodes_h_l2896_c40_36c6
neq_uxn_opcodes_h_l2896_c40_36c6 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2896_c40_36c6_phase,
neq_uxn_opcodes_h_l2896_c40_36c6_ins,
neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read,
neq_uxn_opcodes_h_l2896_c40_36c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_7314
opc_result_MUX_uxn_opcodes_h_l2897_c7_7314 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output);

-- neq2_uxn_opcodes_h_l2897_c40_de30
neq2_uxn_opcodes_h_l2897_c40_de30 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2897_c40_de30_phase,
neq2_uxn_opcodes_h_l2897_c40_de30_ins,
neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read,
neq2_uxn_opcodes_h_l2897_c40_de30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca
opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output);

-- gth_uxn_opcodes_h_l2898_c40_35e0
gth_uxn_opcodes_h_l2898_c40_35e0 : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2898_c40_35e0_phase,
gth_uxn_opcodes_h_l2898_c40_35e0_ins,
gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read,
gth_uxn_opcodes_h_l2898_c40_35e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5
opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output);

-- gth2_uxn_opcodes_h_l2899_c40_390f
gth2_uxn_opcodes_h_l2899_c40_390f : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2899_c40_390f_phase,
gth2_uxn_opcodes_h_l2899_c40_390f_ins,
gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read,
gth2_uxn_opcodes_h_l2899_c40_390f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10
opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output);

-- lth_uxn_opcodes_h_l2900_c40_7435
lth_uxn_opcodes_h_l2900_c40_7435 : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2900_c40_7435_phase,
lth_uxn_opcodes_h_l2900_c40_7435_ins,
lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read,
lth_uxn_opcodes_h_l2900_c40_7435_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2
opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output);

-- lth2_uxn_opcodes_h_l2901_c40_6ede
lth2_uxn_opcodes_h_l2901_c40_6ede : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2901_c40_6ede_phase,
lth2_uxn_opcodes_h_l2901_c40_6ede_ins,
lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read,
lth2_uxn_opcodes_h_l2901_c40_6ede_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_2321
opc_result_MUX_uxn_opcodes_h_l2902_c7_2321 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output);

-- jmp_uxn_opcodes_h_l2902_c40_addc
jmp_uxn_opcodes_h_l2902_c40_addc : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2902_c40_addc_phase,
jmp_uxn_opcodes_h_l2902_c40_addc_ins,
jmp_uxn_opcodes_h_l2902_c40_addc_pc,
jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read,
jmp_uxn_opcodes_h_l2902_c40_addc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09
opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output);

-- jmp2_uxn_opcodes_h_l2903_c40_449f
jmp2_uxn_opcodes_h_l2903_c40_449f : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2903_c40_449f_phase,
jmp2_uxn_opcodes_h_l2903_c40_449f_ins,
jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read,
jmp2_uxn_opcodes_h_l2903_c40_449f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d
opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output);

-- jcn_uxn_opcodes_h_l2904_c40_dcbd
jcn_uxn_opcodes_h_l2904_c40_dcbd : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2904_c40_dcbd_phase,
jcn_uxn_opcodes_h_l2904_c40_dcbd_ins,
jcn_uxn_opcodes_h_l2904_c40_dcbd_pc,
jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read,
jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8
opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output);

-- jcn2_uxn_opcodes_h_l2905_c40_08a8
jcn2_uxn_opcodes_h_l2905_c40_08a8 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2905_c40_08a8_phase,
jcn2_uxn_opcodes_h_l2905_c40_08a8_ins,
jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read,
jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02
opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output);

-- jsr_uxn_opcodes_h_l2906_c40_13d3
jsr_uxn_opcodes_h_l2906_c40_13d3 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2906_c40_13d3_phase,
jsr_uxn_opcodes_h_l2906_c40_13d3_ins,
jsr_uxn_opcodes_h_l2906_c40_13d3_pc,
jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read,
jsr_uxn_opcodes_h_l2906_c40_13d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11
opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output);

-- jsr2_uxn_opcodes_h_l2907_c40_0a83
jsr2_uxn_opcodes_h_l2907_c40_0a83 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2907_c40_0a83_phase,
jsr2_uxn_opcodes_h_l2907_c40_0a83_ins,
jsr2_uxn_opcodes_h_l2907_c40_0a83_pc,
jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read,
jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd
opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output);

-- sth_uxn_opcodes_h_l2908_c40_2c5e
sth_uxn_opcodes_h_l2908_c40_2c5e : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2908_c40_2c5e_phase,
sth_uxn_opcodes_h_l2908_c40_2c5e_ins,
sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read,
sth_uxn_opcodes_h_l2908_c40_2c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_1194
opc_result_MUX_uxn_opcodes_h_l2909_c7_1194 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output);

-- sth2_uxn_opcodes_h_l2909_c40_49ac
sth2_uxn_opcodes_h_l2909_c40_49ac : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2909_c40_49ac_phase,
sth2_uxn_opcodes_h_l2909_c40_49ac_ins,
sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read,
sth2_uxn_opcodes_h_l2909_c40_49ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_021a
opc_result_MUX_uxn_opcodes_h_l2910_c7_021a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output);

-- ldz_uxn_opcodes_h_l2910_c40_3c35
ldz_uxn_opcodes_h_l2910_c40_3c35 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2910_c40_3c35_phase,
ldz_uxn_opcodes_h_l2910_c40_3c35_ins,
ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read,
ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read,
ldz_uxn_opcodes_h_l2910_c40_3c35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a
opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output);

-- ldz2_uxn_opcodes_h_l2911_c40_afd9
ldz2_uxn_opcodes_h_l2911_c40_afd9 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2911_c40_afd9_phase,
ldz2_uxn_opcodes_h_l2911_c40_afd9_ins,
ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read,
ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read,
ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_f685
opc_result_MUX_uxn_opcodes_h_l2912_c7_f685 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output);

-- stz_uxn_opcodes_h_l2912_c40_d3e2
stz_uxn_opcodes_h_l2912_c40_d3e2 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2912_c40_d3e2_phase,
stz_uxn_opcodes_h_l2912_c40_d3e2_ins,
stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read,
stz_uxn_opcodes_h_l2912_c40_d3e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_2225
opc_result_MUX_uxn_opcodes_h_l2913_c7_2225 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output);

-- stz2_uxn_opcodes_h_l2913_c40_ddcd
stz2_uxn_opcodes_h_l2913_c40_ddcd : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2913_c40_ddcd_phase,
stz2_uxn_opcodes_h_l2913_c40_ddcd_ins,
stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read,
stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_424f
opc_result_MUX_uxn_opcodes_h_l2914_c7_424f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output);

-- ldr_uxn_opcodes_h_l2914_c40_73cc
ldr_uxn_opcodes_h_l2914_c40_73cc : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2914_c40_73cc_phase,
ldr_uxn_opcodes_h_l2914_c40_73cc_ins,
ldr_uxn_opcodes_h_l2914_c40_73cc_pc,
ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read,
ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read,
ldr_uxn_opcodes_h_l2914_c40_73cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_f899
opc_result_MUX_uxn_opcodes_h_l2915_c7_f899 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output);

-- ldr2_uxn_opcodes_h_l2915_c40_d5b8
ldr2_uxn_opcodes_h_l2915_c40_d5b8 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read,
ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33
opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output);

-- str1_uxn_opcodes_h_l2916_c40_c015
str1_uxn_opcodes_h_l2916_c40_c015 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2916_c40_c015_phase,
str1_uxn_opcodes_h_l2916_c40_c015_ins,
str1_uxn_opcodes_h_l2916_c40_c015_pc,
str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read,
str1_uxn_opcodes_h_l2916_c40_c015_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b
opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output);

-- str2_uxn_opcodes_h_l2917_c40_176b
str2_uxn_opcodes_h_l2917_c40_176b : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2917_c40_176b_phase,
str2_uxn_opcodes_h_l2917_c40_176b_ins,
str2_uxn_opcodes_h_l2917_c40_176b_pc,
str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read,
str2_uxn_opcodes_h_l2917_c40_176b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3
opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output);

-- lda_uxn_opcodes_h_l2918_c40_4ac1
lda_uxn_opcodes_h_l2918_c40_4ac1 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2918_c40_4ac1_phase,
lda_uxn_opcodes_h_l2918_c40_4ac1_ins,
lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read,
lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read,
lda_uxn_opcodes_h_l2918_c40_4ac1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab
opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output);

-- lda2_uxn_opcodes_h_l2919_c40_0150
lda2_uxn_opcodes_h_l2919_c40_0150 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2919_c40_0150_phase,
lda2_uxn_opcodes_h_l2919_c40_0150_ins,
lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read,
lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read,
lda2_uxn_opcodes_h_l2919_c40_0150_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47
opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output);

-- sta_uxn_opcodes_h_l2920_c40_c9ec
sta_uxn_opcodes_h_l2920_c40_c9ec : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2920_c40_c9ec_phase,
sta_uxn_opcodes_h_l2920_c40_c9ec_ins,
sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read,
sta_uxn_opcodes_h_l2920_c40_c9ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_7498
opc_result_MUX_uxn_opcodes_h_l2921_c7_7498 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output);

-- sta2_uxn_opcodes_h_l2921_c40_6808
sta2_uxn_opcodes_h_l2921_c40_6808 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2921_c40_6808_phase,
sta2_uxn_opcodes_h_l2921_c40_6808_ins,
sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read,
sta2_uxn_opcodes_h_l2921_c40_6808_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_a962
opc_result_MUX_uxn_opcodes_h_l2922_c7_a962 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output);

-- dei_uxn_opcodes_h_l2922_c40_25d5
dei_uxn_opcodes_h_l2922_c40_25d5 : entity work.dei_0CLK_99af4b2a port map (
clk,
dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2922_c40_25d5_phase,
dei_uxn_opcodes_h_l2922_c40_25d5_ins,
dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons,
dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read,
dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read,
dei_uxn_opcodes_h_l2922_c40_25d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d
opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output);

-- dei2_uxn_opcodes_h_l2923_c40_2c9d
dei2_uxn_opcodes_h_l2923_c40_2c9d : entity work.dei2_0CLK_3f571420 port map (
clk,
dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2923_c40_2c9d_phase,
dei2_uxn_opcodes_h_l2923_c40_2c9d_ins,
dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons,
dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read,
dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read,
dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_6077
opc_result_MUX_uxn_opcodes_h_l2924_c7_6077 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output);

-- deo_uxn_opcodes_h_l2924_c40_37b0
deo_uxn_opcodes_h_l2924_c40_37b0 : entity work.deo_0CLK_7fa1ddd4 port map (
clk,
deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2924_c40_37b0_phase,
deo_uxn_opcodes_h_l2924_c40_37b0_ins,
deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read,
deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read,
deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read,
deo_uxn_opcodes_h_l2924_c40_37b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce
opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output);

-- deo2_uxn_opcodes_h_l2925_c40_ddfb
deo2_uxn_opcodes_h_l2925_c40_ddfb : entity work.deo2_0CLK_5550378d port map (
clk,
deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2925_c40_ddfb_phase,
deo2_uxn_opcodes_h_l2925_c40_ddfb_ins,
deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read,
deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read,
deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read,
deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3
opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output);

-- add_uxn_opcodes_h_l2926_c40_f119
add_uxn_opcodes_h_l2926_c40_f119 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE,
add_uxn_opcodes_h_l2926_c40_f119_phase,
add_uxn_opcodes_h_l2926_c40_f119_ins,
add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read,
add_uxn_opcodes_h_l2926_c40_f119_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_6896
opc_result_MUX_uxn_opcodes_h_l2927_c7_6896 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output);

-- add2_uxn_opcodes_h_l2927_c40_b710
add2_uxn_opcodes_h_l2927_c40_b710 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2927_c40_b710_phase,
add2_uxn_opcodes_h_l2927_c40_b710_ins,
add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read,
add2_uxn_opcodes_h_l2927_c40_b710_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad
opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output);

-- sub1_uxn_opcodes_h_l2928_c40_1a41
sub1_uxn_opcodes_h_l2928_c40_1a41 : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2928_c40_1a41_phase,
sub1_uxn_opcodes_h_l2928_c40_1a41_ins,
sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read,
sub1_uxn_opcodes_h_l2928_c40_1a41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d
opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output);

-- sub2_uxn_opcodes_h_l2929_c40_f4c7
sub2_uxn_opcodes_h_l2929_c40_f4c7 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2929_c40_f4c7_phase,
sub2_uxn_opcodes_h_l2929_c40_f4c7_ins,
sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read,
sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3
opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output);

-- mul_uxn_opcodes_h_l2930_c40_1282
mul_uxn_opcodes_h_l2930_c40_1282 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2930_c40_1282_phase,
mul_uxn_opcodes_h_l2930_c40_1282_ins,
mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read,
mul_uxn_opcodes_h_l2930_c40_1282_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_0013
opc_result_MUX_uxn_opcodes_h_l2931_c7_0013 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output);

-- mul2_uxn_opcodes_h_l2931_c40_af50
mul2_uxn_opcodes_h_l2931_c40_af50 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2931_c40_af50_phase,
mul2_uxn_opcodes_h_l2931_c40_af50_ins,
mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read,
mul2_uxn_opcodes_h_l2931_c40_af50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9
opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output);

-- div_uxn_opcodes_h_l2932_c40_3a2f
div_uxn_opcodes_h_l2932_c40_3a2f : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE,
div_uxn_opcodes_h_l2932_c40_3a2f_phase,
div_uxn_opcodes_h_l2932_c40_3a2f_ins,
div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read,
div_uxn_opcodes_h_l2932_c40_3a2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe
opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output);

-- div2_uxn_opcodes_h_l2933_c40_8bd0
div2_uxn_opcodes_h_l2933_c40_8bd0 : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2933_c40_8bd0_phase,
div2_uxn_opcodes_h_l2933_c40_8bd0_ins,
div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read,
div2_uxn_opcodes_h_l2933_c40_8bd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_7129
opc_result_MUX_uxn_opcodes_h_l2934_c7_7129 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output);

-- and_uxn_opcodes_h_l2934_c40_fd28
and_uxn_opcodes_h_l2934_c40_fd28 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE,
and_uxn_opcodes_h_l2934_c40_fd28_phase,
and_uxn_opcodes_h_l2934_c40_fd28_ins,
and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read,
and_uxn_opcodes_h_l2934_c40_fd28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5
opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output);

-- and2_uxn_opcodes_h_l2935_c40_c167
and2_uxn_opcodes_h_l2935_c40_c167 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2935_c40_c167_phase,
and2_uxn_opcodes_h_l2935_c40_c167_ins,
and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read,
and2_uxn_opcodes_h_l2935_c40_c167_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77
opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output);

-- ora_uxn_opcodes_h_l2936_c40_52d3
ora_uxn_opcodes_h_l2936_c40_52d3 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2936_c40_52d3_phase,
ora_uxn_opcodes_h_l2936_c40_52d3_ins,
ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read,
ora_uxn_opcodes_h_l2936_c40_52d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc
opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output);

-- ora2_uxn_opcodes_h_l2937_c40_7bd2
ora2_uxn_opcodes_h_l2937_c40_7bd2 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2937_c40_7bd2_phase,
ora2_uxn_opcodes_h_l2937_c40_7bd2_ins,
ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read,
ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa
opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output);

-- eor_uxn_opcodes_h_l2938_c40_0a62
eor_uxn_opcodes_h_l2938_c40_0a62 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2938_c40_0a62_phase,
eor_uxn_opcodes_h_l2938_c40_0a62_ins,
eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read,
eor_uxn_opcodes_h_l2938_c40_0a62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output);

-- eor2_uxn_opcodes_h_l2939_c40_9be0
eor2_uxn_opcodes_h_l2939_c40_9be0 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2939_c40_9be0_phase,
eor2_uxn_opcodes_h_l2939_c40_9be0_ins,
eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read,
eor2_uxn_opcodes_h_l2939_c40_9be0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7
opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output);

-- sft_uxn_opcodes_h_l2940_c40_2b03
sft_uxn_opcodes_h_l2940_c40_2b03 : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2940_c40_2b03_phase,
sft_uxn_opcodes_h_l2940_c40_2b03_ins,
sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read,
sft_uxn_opcodes_h_l2940_c40_2b03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d
opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output);

-- sft2_uxn_opcodes_h_l2941_c40_207e
sft2_uxn_opcodes_h_l2941_c40_207e : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2941_c40_207e_phase,
sft2_uxn_opcodes_h_l2941_c40_207e_ins,
sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read,
sft2_uxn_opcodes_h_l2941_c40_207e_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81
CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x,
CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output);

-- sp1_MUX_uxn_opcodes_h_l2946_c2_53a6
sp1_MUX_uxn_opcodes_h_l2946_c2_53a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond,
sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue,
sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse,
sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output);

-- sp0_MUX_uxn_opcodes_h_l2946_c2_53a6
sp0_MUX_uxn_opcodes_h_l2946_c2_53a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond,
sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue,
sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse,
sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output);

-- MUX_uxn_opcodes_h_l2952_c29_4da6
MUX_uxn_opcodes_h_l2952_c29_4da6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c29_4da6_cond,
MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue,
MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse,
MUX_uxn_opcodes_h_l2952_c29_4da6_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output);

-- MUX_uxn_opcodes_h_l2953_c20_492a
MUX_uxn_opcodes_h_l2953_c20_492a : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c20_492a_cond,
MUX_uxn_opcodes_h_l2953_c20_492a_iftrue,
MUX_uxn_opcodes_h_l2953_c20_492a_iffalse,
MUX_uxn_opcodes_h_l2953_c20_492a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output);

-- stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address,
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value,
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable,
stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output,
 MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output,
 MUX_uxn_opcodes_h_l2866_c8_0aae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output,
 is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output,
 brk_uxn_opcodes_h_l2872_c48_1c01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output,
 jci_uxn_opcodes_h_l2873_c40_a850_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output,
 jmi_uxn_opcodes_h_l2874_c40_5153_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output,
 jsi_uxn_opcodes_h_l2875_c40_23f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output,
 lit_uxn_opcodes_h_l2876_c40_36d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output,
 lit2_uxn_opcodes_h_l2877_c40_d94a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output,
 lit_uxn_opcodes_h_l2878_c40_8098_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output,
 lit2_uxn_opcodes_h_l2879_c40_a734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output,
 inc_uxn_opcodes_h_l2880_c40_a430_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output,
 inc2_uxn_opcodes_h_l2881_c40_b02f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output,
 pop_uxn_opcodes_h_l2882_c40_d09a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output,
 pop2_uxn_opcodes_h_l2883_c40_223d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output,
 nip_uxn_opcodes_h_l2884_c40_4213_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output,
 nip2_uxn_opcodes_h_l2885_c40_df9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output,
 swp_uxn_opcodes_h_l2886_c40_1ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output,
 swp2_uxn_opcodes_h_l2887_c40_08bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output,
 rot_uxn_opcodes_h_l2888_c40_299b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output,
 rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output,
 dup_uxn_opcodes_h_l2890_c40_931d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output,
 dup2_uxn_opcodes_h_l2891_c40_9f79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output,
 ovr_uxn_opcodes_h_l2892_c40_690d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output,
 ovr2_uxn_opcodes_h_l2893_c40_927d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output,
 equ_uxn_opcodes_h_l2894_c40_12c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output,
 equ2_uxn_opcodes_h_l2895_c40_1527_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output,
 neq_uxn_opcodes_h_l2896_c40_36c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output,
 neq2_uxn_opcodes_h_l2897_c40_de30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output,
 gth_uxn_opcodes_h_l2898_c40_35e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output,
 gth2_uxn_opcodes_h_l2899_c40_390f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output,
 lth_uxn_opcodes_h_l2900_c40_7435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output,
 lth2_uxn_opcodes_h_l2901_c40_6ede_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output,
 jmp_uxn_opcodes_h_l2902_c40_addc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output,
 jmp2_uxn_opcodes_h_l2903_c40_449f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output,
 jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output,
 jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output,
 jsr_uxn_opcodes_h_l2906_c40_13d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output,
 jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output,
 sth_uxn_opcodes_h_l2908_c40_2c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output,
 sth2_uxn_opcodes_h_l2909_c40_49ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output,
 ldz_uxn_opcodes_h_l2910_c40_3c35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output,
 ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output,
 stz_uxn_opcodes_h_l2912_c40_d3e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output,
 stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output,
 ldr_uxn_opcodes_h_l2914_c40_73cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output,
 ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output,
 str1_uxn_opcodes_h_l2916_c40_c015_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output,
 str2_uxn_opcodes_h_l2917_c40_176b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output,
 lda_uxn_opcodes_h_l2918_c40_4ac1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output,
 lda2_uxn_opcodes_h_l2919_c40_0150_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output,
 sta_uxn_opcodes_h_l2920_c40_c9ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output,
 sta2_uxn_opcodes_h_l2921_c40_6808_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output,
 dei_uxn_opcodes_h_l2922_c40_25d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output,
 dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output,
 deo_uxn_opcodes_h_l2924_c40_37b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output,
 deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output,
 add_uxn_opcodes_h_l2926_c40_f119_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output,
 add2_uxn_opcodes_h_l2927_c40_b710_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output,
 sub1_uxn_opcodes_h_l2928_c40_1a41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output,
 sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output,
 mul_uxn_opcodes_h_l2930_c40_1282_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output,
 mul2_uxn_opcodes_h_l2931_c40_af50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output,
 div_uxn_opcodes_h_l2932_c40_3a2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output,
 div2_uxn_opcodes_h_l2933_c40_8bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output,
 and_uxn_opcodes_h_l2934_c40_fd28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output,
 and2_uxn_opcodes_h_l2935_c40_c167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output,
 ora_uxn_opcodes_h_l2936_c40_52d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output,
 ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output,
 eor_uxn_opcodes_h_l2938_c40_0a62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output,
 eor2_uxn_opcodes_h_l2939_c40_9be0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output,
 sft_uxn_opcodes_h_l2940_c40_2b03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output,
 sft2_uxn_opcodes_h_l2941_c40_207e_return_output,
 CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output,
 sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output,
 sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output,
 MUX_uxn_opcodes_h_l2952_c29_4da6_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output,
 MUX_uxn_opcodes_h_l2953_c20_492a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output,
 stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output)
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
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_1c01_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_1c01_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_a850_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_5153_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_5153_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_5153_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_36d0_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_36d0_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_36d0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_8098_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_8098_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_8098_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_a734_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_a734_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_a734_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_a430_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_a430_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_a430_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_d09a_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_d09a_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_d09a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_223d_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_223d_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_223d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_4213_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_4213_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_4213_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_299b_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_299b_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_299b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_931d_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_931d_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_931d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_690d_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_690d_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_690d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_12c7_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_12c7_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_12c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1527_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1527_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_1527_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_36c6_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_36c6_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_36c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_de30_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_de30_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_de30_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_35e0_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_35e0_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_35e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_390f_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_390f_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_390f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_7435_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_7435_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_7435_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_addc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_c015_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_176b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_0150_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_6808_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_6808_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_6808_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_25d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_37b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_f119_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_f119_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_f119_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_b710_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_b710_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_b710_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_1282_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_1282_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_1282_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_af50_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_af50_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_af50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_3a2f_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_3a2f_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_3a2f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_fd28_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_fd28_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_fd28_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_c167_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_c167_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_c167_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_52d3_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_52d3_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_52d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_0a62_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_0a62_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_0a62_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_2b03_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_2b03_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_2b03_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_207e_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_207e_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_207e_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2943_c2_f2a3 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_a599_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2947_c3_3400 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2949_c3_7bd5 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_c444_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_2809_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_36d1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_492a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_492a_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_d97b_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_1ed4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_df9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_32c4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_e4cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_60ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_b96e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_2df2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_904c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_0411_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_9354_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_4774_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_1a74_return_output : eval_opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right := to_unsigned(54, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right := to_unsigned(52, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right := to_unsigned(9, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right := to_unsigned(36, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right := to_unsigned(17, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right := to_unsigned(29, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right := to_unsigned(53, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right := to_unsigned(27, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right := to_unsigned(160, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right := to_unsigned(20, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right := to_unsigned(30, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right := to_unsigned(43, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right := to_unsigned(38, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right := to_unsigned(28, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right := to_unsigned(22, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right := to_unsigned(7, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right := to_unsigned(14, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right := to_unsigned(51, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right := to_unsigned(50, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right := to_unsigned(26, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right := to_unsigned(35, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right := to_unsigned(25, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right := to_unsigned(128, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2927_c40_b710_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2926_c40_f119_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2935_c40_c167_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2934_c40_fd28_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2932_c40_3a2f_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2890_c40_931d_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2938_c40_0a62_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1527_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2894_c40_12c7_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2899_c40_390f_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2898_c40_35e0_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2880_c40_a430_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2900_c40_7435_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2931_c40_af50_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2930_c40_1282_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2897_c40_de30_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2896_c40_36c6_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2884_c40_4213_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2936_c40_52d3_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2892_c40_690d_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2883_c40_223d_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2882_c40_d09a_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2888_c40_299b_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2941_c40_207e_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2940_c40_2b03_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2921_c40_6808_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2874_c40_5153_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2879_c40_a734_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2876_c40_36d0_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2878_c40_8098_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2927_c40_b710_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2926_c40_f119_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2935_c40_c167_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2934_c40_fd28_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2872_c48_1c01_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2932_c40_3a2f_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2890_c40_931d_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2938_c40_0a62_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2895_c40_1527_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2894_c40_12c7_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2899_c40_390f_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2898_c40_35e0_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2880_c40_a430_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2874_c40_5153_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2879_c40_a734_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2876_c40_36d0_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2878_c40_8098_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2900_c40_7435_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2931_c40_af50_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2930_c40_1282_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2897_c40_de30_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2896_c40_36c6_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2884_c40_4213_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2936_c40_52d3_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2892_c40_690d_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2883_c40_223d_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2882_c40_d09a_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2888_c40_299b_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2941_c40_207e_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2940_c40_2b03_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2921_c40_6808_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2872_c48_1c01] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2872_c48_1c01_phase <= VAR_brk_uxn_opcodes_h_l2872_c48_1c01_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2872_c48_1c01_return_output := brk_uxn_opcodes_h_l2872_c48_1c01_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2864_c14_8132] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_left;
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output := BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2943_c16_dd81] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output := CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output;
     VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_8132_return_output;
     VAR_stack_index_uxn_opcodes_h_l2943_c2_f2a3 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_dd81_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue := VAR_brk_uxn_opcodes_h_l2872_c48_1c01_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left := VAR_stack_index_uxn_opcodes_h_l2943_c2_f2a3;
     -- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_5b9b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_left;
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output := BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_5b9b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2865_c14_78b6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_left;
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output := BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_78b6_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_6f9a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_6f9a_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_5a76] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_5a76_return_output;
     -- MUX[uxn_opcodes_h_l2865_c14_8aaa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c14_8aaa_cond <= VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_cond;
     MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iftrue;
     MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output := MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_cond := VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2865_c14_8aaa_return_output;
     -- MUX[uxn_opcodes_h_l2866_c8_0aae] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2866_c8_0aae_cond <= VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_cond;
     MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue <= VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iftrue;
     MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse <= VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output := MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2866_c8_0aae_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_acde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_d9b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_fa49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_2d37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_d152] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ac3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_8240] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_0ed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_c1c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_f0ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_7d92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_5324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_6a1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_e112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_65f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_6fd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7a47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_b9cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_dc65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_1b8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_6c8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c621] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_b231] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_fdfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_43d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_a830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_e770] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_2199] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_8b1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_32d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_12c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_4ca8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_a4ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_1189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_1d08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_7e4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_fb0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_31ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_ba74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_29f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_241b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_89f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_9160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1b30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_43ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_f3a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_9fa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_d842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_3f24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_9593] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_1392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c7b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_0b10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_9a28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_3384] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_0623] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_8703] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_a8c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_0332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_b333] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_3848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_855b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_0591] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_ff0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_764e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_365c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1dcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b68a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_9e3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_764e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_241b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_9160_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1b30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_0332_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_0591_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_fb0b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a4ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9a28_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_32d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_f3a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_2d37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_29f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_7e4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_1189_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_3f24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9e3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_2199_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_3384_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7a47_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d152_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6c8e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_855b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_31ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_65f3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_e770_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8250_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1dcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_1392_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_d842_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f0ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_dc65_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_43d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_ba74_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_6a1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_6fd2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_1d08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8703_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_acde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_4ca8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ac3a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_9fa2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_7d92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_d9b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_a830_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_3848_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b68a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_b231_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_8240_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_b333_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_1b8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0b10_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_12c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_b9cf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_fa49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_e112_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_c1c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c621_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5324_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_365c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_fdfe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8b1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_0ed0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_0623_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_43ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a8c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_9593_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_89f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ff0f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_799a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2872_c2_5eec] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_cond;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output := is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_799a_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_853f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_f253] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_853f_return_output;
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_f253_return_output;
     -- jci[uxn_opcodes_h_l2873_c40_a850] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2873_c40_a850_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2873_c40_a850_phase <= VAR_jci_uxn_opcodes_h_l2873_c40_a850_phase;
     jci_uxn_opcodes_h_l2873_c40_a850_pc <= VAR_jci_uxn_opcodes_h_l2873_c40_a850_pc;
     jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_stack_read;
     jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2873_c40_a850_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2873_c40_a850_return_output := jci_uxn_opcodes_h_l2873_c40_a850_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_9394] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_d0ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_9394_return_output;
     VAR_jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d0ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue := VAR_jci_uxn_opcodes_h_l2873_c40_a850_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_e0da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output;

     -- jmi[uxn_opcodes_h_l2874_c40_5153] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2874_c40_5153_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2874_c40_5153_phase <= VAR_jmi_uxn_opcodes_h_l2874_c40_5153_phase;
     jmi_uxn_opcodes_h_l2874_c40_5153_pc <= VAR_jmi_uxn_opcodes_h_l2874_c40_5153_pc;
     jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2874_c40_5153_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2874_c40_5153_return_output := jmi_uxn_opcodes_h_l2874_c40_5153_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_a70a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output;
     VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_a70a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue := VAR_jmi_uxn_opcodes_h_l2874_c40_5153_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_cdbf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_dea3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output;

     -- jsi[uxn_opcodes_h_l2875_c40_23f0] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2875_c40_23f0_phase <= VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_phase;
     jsi_uxn_opcodes_h_l2875_c40_23f0_pc <= VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_pc;
     jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_return_output := jsi_uxn_opcodes_h_l2875_c40_23f0_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output;
     VAR_lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_cdbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue := VAR_jsi_uxn_opcodes_h_l2875_c40_23f0_return_output;
     -- lit[uxn_opcodes_h_l2876_c40_36d0] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2876_c40_36d0_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2876_c40_36d0_phase <= VAR_lit_uxn_opcodes_h_l2876_c40_36d0_phase;
     lit_uxn_opcodes_h_l2876_c40_36d0_pc <= VAR_lit_uxn_opcodes_h_l2876_c40_36d0_pc;
     lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2876_c40_36d0_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2876_c40_36d0_return_output := lit_uxn_opcodes_h_l2876_c40_36d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_2929] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_638f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_638f_return_output;
     VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_2929_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue := VAR_lit_uxn_opcodes_h_l2876_c40_36d0_return_output;
     -- lit2[uxn_opcodes_h_l2877_c40_d94a] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2877_c40_d94a_phase <= VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_phase;
     lit2_uxn_opcodes_h_l2877_c40_d94a_pc <= VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_pc;
     lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_return_output := lit2_uxn_opcodes_h_l2877_c40_d94a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_e899] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_2b3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output;
     VAR_lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e899_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue := VAR_lit2_uxn_opcodes_h_l2877_c40_d94a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_d92b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output;

     -- lit[uxn_opcodes_h_l2878_c40_8098] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2878_c40_8098_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2878_c40_8098_phase <= VAR_lit_uxn_opcodes_h_l2878_c40_8098_phase;
     lit_uxn_opcodes_h_l2878_c40_8098_pc <= VAR_lit_uxn_opcodes_h_l2878_c40_8098_pc;
     lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2878_c40_8098_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2878_c40_8098_return_output := lit_uxn_opcodes_h_l2878_c40_8098_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_9f20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output;
     VAR_lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_9f20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue := VAR_lit_uxn_opcodes_h_l2878_c40_8098_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_9514] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_80d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output;

     -- lit2[uxn_opcodes_h_l2879_c40_a734] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2879_c40_a734_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2879_c40_a734_phase <= VAR_lit2_uxn_opcodes_h_l2879_c40_a734_phase;
     lit2_uxn_opcodes_h_l2879_c40_a734_pc <= VAR_lit2_uxn_opcodes_h_l2879_c40_a734_pc;
     lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2879_c40_a734_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2879_c40_a734_return_output := lit2_uxn_opcodes_h_l2879_c40_a734_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_9514_return_output;
     VAR_inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_80d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue := VAR_lit2_uxn_opcodes_h_l2879_c40_a734_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_0fc6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_20d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output;

     -- inc[uxn_opcodes_h_l2880_c40_a430] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2880_c40_a430_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2880_c40_a430_phase <= VAR_inc_uxn_opcodes_h_l2880_c40_a430_phase;
     inc_uxn_opcodes_h_l2880_c40_a430_ins <= VAR_inc_uxn_opcodes_h_l2880_c40_a430_ins;
     inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2880_c40_a430_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2880_c40_a430_return_output := inc_uxn_opcodes_h_l2880_c40_a430_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output;
     VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_0fc6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue := VAR_inc_uxn_opcodes_h_l2880_c40_a430_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_a341] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_6647] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output;

     -- inc2[uxn_opcodes_h_l2881_c40_b02f] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2881_c40_b02f_phase <= VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_phase;
     inc2_uxn_opcodes_h_l2881_c40_b02f_ins <= VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_ins;
     inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_return_output := inc2_uxn_opcodes_h_l2881_c40_b02f_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6647_return_output;
     VAR_pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a341_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue := VAR_inc2_uxn_opcodes_h_l2881_c40_b02f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_3dbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_3fcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output;

     -- pop[uxn_opcodes_h_l2882_c40_d09a] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2882_c40_d09a_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2882_c40_d09a_phase <= VAR_pop_uxn_opcodes_h_l2882_c40_d09a_phase;
     pop_uxn_opcodes_h_l2882_c40_d09a_ins <= VAR_pop_uxn_opcodes_h_l2882_c40_d09a_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2882_c40_d09a_return_output := pop_uxn_opcodes_h_l2882_c40_d09a_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output;
     VAR_pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_3fcd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue := VAR_pop_uxn_opcodes_h_l2882_c40_d09a_return_output;
     -- pop2[uxn_opcodes_h_l2883_c40_223d] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2883_c40_223d_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2883_c40_223d_phase <= VAR_pop2_uxn_opcodes_h_l2883_c40_223d_phase;
     pop2_uxn_opcodes_h_l2883_c40_223d_ins <= VAR_pop2_uxn_opcodes_h_l2883_c40_223d_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2883_c40_223d_return_output := pop2_uxn_opcodes_h_l2883_c40_223d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_5f88] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_8c12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output;
     VAR_nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_8c12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue := VAR_pop2_uxn_opcodes_h_l2883_c40_223d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_3c46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output;

     -- nip[uxn_opcodes_h_l2884_c40_4213] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2884_c40_4213_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2884_c40_4213_phase <= VAR_nip_uxn_opcodes_h_l2884_c40_4213_phase;
     nip_uxn_opcodes_h_l2884_c40_4213_ins <= VAR_nip_uxn_opcodes_h_l2884_c40_4213_ins;
     nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2884_c40_4213_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2884_c40_4213_return_output := nip_uxn_opcodes_h_l2884_c40_4213_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_f0a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output;
     VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_f0a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue := VAR_nip_uxn_opcodes_h_l2884_c40_4213_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_f48c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_22e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output;

     -- nip2[uxn_opcodes_h_l2885_c40_df9c] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2885_c40_df9c_phase <= VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_phase;
     nip2_uxn_opcodes_h_l2885_c40_df9c_ins <= VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_ins;
     nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_return_output := nip2_uxn_opcodes_h_l2885_c40_df9c_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output;
     VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_f48c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue := VAR_nip2_uxn_opcodes_h_l2885_c40_df9c_return_output;
     -- swp[uxn_opcodes_h_l2886_c40_1ea8] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2886_c40_1ea8_phase <= VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_phase;
     swp_uxn_opcodes_h_l2886_c40_1ea8_ins <= VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_ins;
     swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_return_output := swp_uxn_opcodes_h_l2886_c40_1ea8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_68d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_bdb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output;
     VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_bdb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue := VAR_swp_uxn_opcodes_h_l2886_c40_1ea8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_630c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output;

     -- swp2[uxn_opcodes_h_l2887_c40_08bf] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2887_c40_08bf_phase <= VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_phase;
     swp2_uxn_opcodes_h_l2887_c40_08bf_ins <= VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_ins;
     swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_return_output := swp2_uxn_opcodes_h_l2887_c40_08bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_375c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_375c_return_output;
     VAR_rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_630c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue := VAR_swp2_uxn_opcodes_h_l2887_c40_08bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_f72e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_e8dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output;

     -- rot[uxn_opcodes_h_l2888_c40_299b] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2888_c40_299b_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2888_c40_299b_phase <= VAR_rot_uxn_opcodes_h_l2888_c40_299b_phase;
     rot_uxn_opcodes_h_l2888_c40_299b_ins <= VAR_rot_uxn_opcodes_h_l2888_c40_299b_ins;
     rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2888_c40_299b_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2888_c40_299b_return_output := rot_uxn_opcodes_h_l2888_c40_299b_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output;
     VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_e8dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue := VAR_rot_uxn_opcodes_h_l2888_c40_299b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_31b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_3b64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output;

     -- rot2[uxn_opcodes_h_l2889_c40_1d4a] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2889_c40_1d4a_phase <= VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_phase;
     rot2_uxn_opcodes_h_l2889_c40_1d4a_ins <= VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_ins;
     rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output := rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output;
     VAR_dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_3b64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue := VAR_rot2_uxn_opcodes_h_l2889_c40_1d4a_return_output;
     -- dup[uxn_opcodes_h_l2890_c40_931d] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2890_c40_931d_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2890_c40_931d_phase <= VAR_dup_uxn_opcodes_h_l2890_c40_931d_phase;
     dup_uxn_opcodes_h_l2890_c40_931d_ins <= VAR_dup_uxn_opcodes_h_l2890_c40_931d_ins;
     dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2890_c40_931d_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2890_c40_931d_return_output := dup_uxn_opcodes_h_l2890_c40_931d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_03ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_d7ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output;
     VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_03ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue := VAR_dup_uxn_opcodes_h_l2890_c40_931d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_0a2c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output;

     -- dup2[uxn_opcodes_h_l2891_c40_9f79] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2891_c40_9f79_phase <= VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_phase;
     dup2_uxn_opcodes_h_l2891_c40_9f79_ins <= VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_ins;
     dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_return_output := dup2_uxn_opcodes_h_l2891_c40_9f79_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_63be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output;
     VAR_ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_63be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue := VAR_dup2_uxn_opcodes_h_l2891_c40_9f79_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_cdb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_ca3b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output;

     -- ovr[uxn_opcodes_h_l2892_c40_690d] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2892_c40_690d_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2892_c40_690d_phase <= VAR_ovr_uxn_opcodes_h_l2892_c40_690d_phase;
     ovr_uxn_opcodes_h_l2892_c40_690d_ins <= VAR_ovr_uxn_opcodes_h_l2892_c40_690d_ins;
     ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2892_c40_690d_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2892_c40_690d_return_output := ovr_uxn_opcodes_h_l2892_c40_690d_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_cdb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue := VAR_ovr_uxn_opcodes_h_l2892_c40_690d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_e68f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_0da5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output;

     -- ovr2[uxn_opcodes_h_l2893_c40_927d] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2893_c40_927d_phase <= VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_phase;
     ovr2_uxn_opcodes_h_l2893_c40_927d_ins <= VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_ins;
     ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_return_output := ovr2_uxn_opcodes_h_l2893_c40_927d_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output;
     VAR_equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_0da5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue := VAR_ovr2_uxn_opcodes_h_l2893_c40_927d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_82fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_7b83] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output;

     -- equ[uxn_opcodes_h_l2894_c40_12c7] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2894_c40_12c7_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2894_c40_12c7_phase <= VAR_equ_uxn_opcodes_h_l2894_c40_12c7_phase;
     equ_uxn_opcodes_h_l2894_c40_12c7_ins <= VAR_equ_uxn_opcodes_h_l2894_c40_12c7_ins;
     equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2894_c40_12c7_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2894_c40_12c7_return_output := equ_uxn_opcodes_h_l2894_c40_12c7_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output;
     VAR_equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_7b83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue := VAR_equ_uxn_opcodes_h_l2894_c40_12c7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3673] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7314] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output;

     -- equ2[uxn_opcodes_h_l2895_c40_1527] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2895_c40_1527_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2895_c40_1527_phase <= VAR_equ2_uxn_opcodes_h_l2895_c40_1527_phase;
     equ2_uxn_opcodes_h_l2895_c40_1527_ins <= VAR_equ2_uxn_opcodes_h_l2895_c40_1527_ins;
     equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2895_c40_1527_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2895_c40_1527_return_output := equ2_uxn_opcodes_h_l2895_c40_1527_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7314_return_output;
     VAR_neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3673_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue := VAR_equ2_uxn_opcodes_h_l2895_c40_1527_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_a693] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_66ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output;

     -- neq[uxn_opcodes_h_l2896_c40_36c6] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2896_c40_36c6_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2896_c40_36c6_phase <= VAR_neq_uxn_opcodes_h_l2896_c40_36c6_phase;
     neq_uxn_opcodes_h_l2896_c40_36c6_ins <= VAR_neq_uxn_opcodes_h_l2896_c40_36c6_ins;
     neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2896_c40_36c6_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2896_c40_36c6_return_output := neq_uxn_opcodes_h_l2896_c40_36c6_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output;
     VAR_neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_a693_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue := VAR_neq_uxn_opcodes_h_l2896_c40_36c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_0bb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output;

     -- neq2[uxn_opcodes_h_l2897_c40_de30] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2897_c40_de30_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2897_c40_de30_phase <= VAR_neq2_uxn_opcodes_h_l2897_c40_de30_phase;
     neq2_uxn_opcodes_h_l2897_c40_de30_ins <= VAR_neq2_uxn_opcodes_h_l2897_c40_de30_ins;
     neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2897_c40_de30_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2897_c40_de30_return_output := neq2_uxn_opcodes_h_l2897_c40_de30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_cda5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output;
     VAR_gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_0bb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue := VAR_neq2_uxn_opcodes_h_l2897_c40_de30_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6f10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output;

     -- gth[uxn_opcodes_h_l2898_c40_35e0] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2898_c40_35e0_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2898_c40_35e0_phase <= VAR_gth_uxn_opcodes_h_l2898_c40_35e0_phase;
     gth_uxn_opcodes_h_l2898_c40_35e0_ins <= VAR_gth_uxn_opcodes_h_l2898_c40_35e0_ins;
     gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2898_c40_35e0_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2898_c40_35e0_return_output := gth_uxn_opcodes_h_l2898_c40_35e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_892a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output;
     VAR_gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_892a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue := VAR_gth_uxn_opcodes_h_l2898_c40_35e0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_d0f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output;

     -- gth2[uxn_opcodes_h_l2899_c40_390f] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2899_c40_390f_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2899_c40_390f_phase <= VAR_gth2_uxn_opcodes_h_l2899_c40_390f_phase;
     gth2_uxn_opcodes_h_l2899_c40_390f_ins <= VAR_gth2_uxn_opcodes_h_l2899_c40_390f_ins;
     gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2899_c40_390f_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2899_c40_390f_return_output := gth2_uxn_opcodes_h_l2899_c40_390f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_d0bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output;
     VAR_lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d0bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue := VAR_gth2_uxn_opcodes_h_l2899_c40_390f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_2321] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output;

     -- lth[uxn_opcodes_h_l2900_c40_7435] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2900_c40_7435_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2900_c40_7435_phase <= VAR_lth_uxn_opcodes_h_l2900_c40_7435_phase;
     lth_uxn_opcodes_h_l2900_c40_7435_ins <= VAR_lth_uxn_opcodes_h_l2900_c40_7435_ins;
     lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2900_c40_7435_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2900_c40_7435_return_output := lth_uxn_opcodes_h_l2900_c40_7435_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_35ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2321_return_output;
     VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_35ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue := VAR_lth_uxn_opcodes_h_l2900_c40_7435_return_output;
     -- lth2[uxn_opcodes_h_l2901_c40_6ede] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2901_c40_6ede_phase <= VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_phase;
     lth2_uxn_opcodes_h_l2901_c40_6ede_ins <= VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_ins;
     lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_return_output := lth2_uxn_opcodes_h_l2901_c40_6ede_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_212f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_0f09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output;
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_212f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue := VAR_lth2_uxn_opcodes_h_l2901_c40_6ede_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_7a6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output;

     -- jmp[uxn_opcodes_h_l2902_c40_addc] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2902_c40_addc_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2902_c40_addc_phase <= VAR_jmp_uxn_opcodes_h_l2902_c40_addc_phase;
     jmp_uxn_opcodes_h_l2902_c40_addc_ins <= VAR_jmp_uxn_opcodes_h_l2902_c40_addc_ins;
     jmp_uxn_opcodes_h_l2902_c40_addc_pc <= VAR_jmp_uxn_opcodes_h_l2902_c40_addc_pc;
     jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2902_c40_addc_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2902_c40_addc_return_output := jmp_uxn_opcodes_h_l2902_c40_addc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_ad6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_ad6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue := VAR_jmp_uxn_opcodes_h_l2902_c40_addc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_15db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_f6e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output;

     -- jmp2[uxn_opcodes_h_l2903_c40_449f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2903_c40_449f_phase <= VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_phase;
     jmp2_uxn_opcodes_h_l2903_c40_449f_ins <= VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_ins;
     jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_return_output := jmp2_uxn_opcodes_h_l2903_c40_449f_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output;
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_15db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue := VAR_jmp2_uxn_opcodes_h_l2903_c40_449f_return_output;
     -- jcn[uxn_opcodes_h_l2904_c40_dcbd] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2904_c40_dcbd_phase <= VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_phase;
     jcn_uxn_opcodes_h_l2904_c40_dcbd_ins <= VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_ins;
     jcn_uxn_opcodes_h_l2904_c40_dcbd_pc <= VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_pc;
     jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output := jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_1b02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_7d3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_7d3e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue := VAR_jcn_uxn_opcodes_h_l2904_c40_dcbd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_5545] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_2e11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output;

     -- jcn2[uxn_opcodes_h_l2905_c40_08a8] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2905_c40_08a8_phase <= VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_phase;
     jcn2_uxn_opcodes_h_l2905_c40_08a8_ins <= VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_ins;
     jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output := jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output;
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_5545_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue := VAR_jcn2_uxn_opcodes_h_l2905_c40_08a8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_067d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output;

     -- jsr[uxn_opcodes_h_l2906_c40_13d3] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2906_c40_13d3_phase <= VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_phase;
     jsr_uxn_opcodes_h_l2906_c40_13d3_ins <= VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_ins;
     jsr_uxn_opcodes_h_l2906_c40_13d3_pc <= VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_pc;
     jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_return_output := jsr_uxn_opcodes_h_l2906_c40_13d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_06cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_067d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue := VAR_jsr_uxn_opcodes_h_l2906_c40_13d3_return_output;
     -- jsr2[uxn_opcodes_h_l2907_c40_0a83] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2907_c40_0a83_phase <= VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_phase;
     jsr2_uxn_opcodes_h_l2907_c40_0a83_ins <= VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_ins;
     jsr2_uxn_opcodes_h_l2907_c40_0a83_pc <= VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_pc;
     jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output := jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_1194] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f819] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1194_return_output;
     VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f819_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue := VAR_jsr2_uxn_opcodes_h_l2907_c40_0a83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_021a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_cf56] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output;

     -- sth[uxn_opcodes_h_l2908_c40_2c5e] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2908_c40_2c5e_phase <= VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_phase;
     sth_uxn_opcodes_h_l2908_c40_2c5e_ins <= VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_ins;
     sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_return_output := sth_uxn_opcodes_h_l2908_c40_2c5e_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_021a_return_output;
     VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_cf56_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue := VAR_sth_uxn_opcodes_h_l2908_c40_2c5e_return_output;
     -- sth2[uxn_opcodes_h_l2909_c40_49ac] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2909_c40_49ac_phase <= VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_phase;
     sth2_uxn_opcodes_h_l2909_c40_49ac_ins <= VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_ins;
     sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_return_output := sth2_uxn_opcodes_h_l2909_c40_49ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0ebf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_5c7a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output;
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0ebf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue := VAR_sth2_uxn_opcodes_h_l2909_c40_49ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_9d34] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_f685] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output;

     -- ldz[uxn_opcodes_h_l2910_c40_3c35] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2910_c40_3c35_phase <= VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_phase;
     ldz_uxn_opcodes_h_l2910_c40_3c35_ins <= VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_ins;
     ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_stack_read;
     ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_return_output := ldz_uxn_opcodes_h_l2910_c40_3c35_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f685_return_output;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_9d34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue := VAR_ldz_uxn_opcodes_h_l2910_c40_3c35_return_output;
     -- ldz2[uxn_opcodes_h_l2911_c40_afd9] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2911_c40_afd9_phase <= VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_phase;
     ldz2_uxn_opcodes_h_l2911_c40_afd9_ins <= VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_ins;
     ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_stack_read;
     ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output := ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_2225] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_c53e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2225_return_output;
     VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_c53e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue := VAR_ldz2_uxn_opcodes_h_l2911_c40_afd9_return_output;
     -- stz[uxn_opcodes_h_l2912_c40_d3e2] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2912_c40_d3e2_phase <= VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_phase;
     stz_uxn_opcodes_h_l2912_c40_d3e2_ins <= VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_ins;
     stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_return_output := stz_uxn_opcodes_h_l2912_c40_d3e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_8f88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_424f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_424f_return_output;
     VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_8f88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue := VAR_stz_uxn_opcodes_h_l2912_c40_d3e2_return_output;
     -- stz2[uxn_opcodes_h_l2913_c40_ddcd] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2913_c40_ddcd_phase <= VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_phase;
     stz2_uxn_opcodes_h_l2913_c40_ddcd_ins <= VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_ins;
     stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output := stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_565a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_f899] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f899_return_output;
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_565a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue := VAR_stz2_uxn_opcodes_h_l2913_c40_ddcd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_bc33] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output;

     -- ldr[uxn_opcodes_h_l2914_c40_73cc] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2914_c40_73cc_phase <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_phase;
     ldr_uxn_opcodes_h_l2914_c40_73cc_ins <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_ins;
     ldr_uxn_opcodes_h_l2914_c40_73cc_pc <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_pc;
     ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_stack_read;
     ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_return_output := ldr_uxn_opcodes_h_l2914_c40_73cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_0f75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_0f75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue := VAR_ldr_uxn_opcodes_h_l2914_c40_73cc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_0e59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output;

     -- ldr2[uxn_opcodes_h_l2915_c40_d5b8] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_phase;
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_ins;
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_pc;
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_stack_read;
     ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output := ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_eb4b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output;
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_0e59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue := VAR_ldr2_uxn_opcodes_h_l2915_c40_d5b8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_85b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output;

     -- str1[uxn_opcodes_h_l2916_c40_c015] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2916_c40_c015_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2916_c40_c015_phase <= VAR_str1_uxn_opcodes_h_l2916_c40_c015_phase;
     str1_uxn_opcodes_h_l2916_c40_c015_ins <= VAR_str1_uxn_opcodes_h_l2916_c40_c015_ins;
     str1_uxn_opcodes_h_l2916_c40_c015_pc <= VAR_str1_uxn_opcodes_h_l2916_c40_c015_pc;
     str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2916_c40_c015_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2916_c40_c015_return_output := str1_uxn_opcodes_h_l2916_c40_c015_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_aec3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output;
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_85b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue := VAR_str1_uxn_opcodes_h_l2916_c40_c015_return_output;
     -- str2[uxn_opcodes_h_l2917_c40_176b] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2917_c40_176b_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2917_c40_176b_phase <= VAR_str2_uxn_opcodes_h_l2917_c40_176b_phase;
     str2_uxn_opcodes_h_l2917_c40_176b_ins <= VAR_str2_uxn_opcodes_h_l2917_c40_176b_ins;
     str2_uxn_opcodes_h_l2917_c40_176b_pc <= VAR_str2_uxn_opcodes_h_l2917_c40_176b_pc;
     str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2917_c40_176b_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2917_c40_176b_return_output := str2_uxn_opcodes_h_l2917_c40_176b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_77ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_d0d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output;
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_d0d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue := VAR_str2_uxn_opcodes_h_l2917_c40_176b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_ea47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output;

     -- lda[uxn_opcodes_h_l2918_c40_4ac1] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2918_c40_4ac1_phase <= VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_phase;
     lda_uxn_opcodes_h_l2918_c40_4ac1_ins <= VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_ins;
     lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_stack_read;
     lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_return_output := lda_uxn_opcodes_h_l2918_c40_4ac1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_2d1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output;
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_2d1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue := VAR_lda_uxn_opcodes_h_l2918_c40_4ac1_return_output;
     -- lda2[uxn_opcodes_h_l2919_c40_0150] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2919_c40_0150_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2919_c40_0150_phase <= VAR_lda2_uxn_opcodes_h_l2919_c40_0150_phase;
     lda2_uxn_opcodes_h_l2919_c40_0150_ins <= VAR_lda2_uxn_opcodes_h_l2919_c40_0150_ins;
     lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_stack_read;
     lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_0150_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2919_c40_0150_return_output := lda2_uxn_opcodes_h_l2919_c40_0150_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_7498] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_c186] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_7498_return_output;
     VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c186_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue := VAR_lda2_uxn_opcodes_h_l2919_c40_0150_return_output;
     -- sta[uxn_opcodes_h_l2920_c40_c9ec] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2920_c40_c9ec_phase <= VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_phase;
     sta_uxn_opcodes_h_l2920_c40_c9ec_ins <= VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_ins;
     sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_return_output := sta_uxn_opcodes_h_l2920_c40_c9ec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_a962] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_37e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_a962_return_output;
     VAR_sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_37e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue := VAR_sta_uxn_opcodes_h_l2920_c40_c9ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_5b1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output;

     -- sta2[uxn_opcodes_h_l2921_c40_6808] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2921_c40_6808_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2921_c40_6808_phase <= VAR_sta2_uxn_opcodes_h_l2921_c40_6808_phase;
     sta2_uxn_opcodes_h_l2921_c40_6808_ins <= VAR_sta2_uxn_opcodes_h_l2921_c40_6808_ins;
     sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2921_c40_6808_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2921_c40_6808_return_output := sta2_uxn_opcodes_h_l2921_c40_6808_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6684] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output;
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6684_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue := VAR_sta2_uxn_opcodes_h_l2921_c40_6808_return_output;
     -- dei[uxn_opcodes_h_l2922_c40_25d5] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2922_c40_25d5_phase <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_phase;
     dei_uxn_opcodes_h_l2922_c40_25d5_ins <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_ins;
     dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_controller0_buttons;
     dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_stack_read;
     dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2922_c40_25d5_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2922_c40_25d5_return_output := dei_uxn_opcodes_h_l2922_c40_25d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_6077] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_721d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_6077_return_output;
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_721d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue := VAR_dei_uxn_opcodes_h_l2922_c40_25d5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_82ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output;

     -- dei2[uxn_opcodes_h_l2923_c40_2c9d] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2923_c40_2c9d_phase <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_phase;
     dei2_uxn_opcodes_h_l2923_c40_2c9d_ins <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_ins;
     dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_controller0_buttons;
     dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_stack_read;
     dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output := dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_e169] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output;
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_e169_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue := VAR_dei2_uxn_opcodes_h_l2923_c40_2c9d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_bad0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_52c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output;

     -- deo[uxn_opcodes_h_l2924_c40_37b0] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2924_c40_37b0_phase <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_phase;
     deo_uxn_opcodes_h_l2924_c40_37b0_ins <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_ins;
     deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_stack_read;
     deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_device_ram_read;
     deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_37b0_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2924_c40_37b0_return_output := deo_uxn_opcodes_h_l2924_c40_37b0_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output;
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_bad0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue := VAR_deo_uxn_opcodes_h_l2924_c40_37b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_645a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output;

     -- deo2[uxn_opcodes_h_l2925_c40_ddfb] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2925_c40_ddfb_phase <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_phase;
     deo2_uxn_opcodes_h_l2925_c40_ddfb_ins <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_ins;
     deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_stack_read;
     deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output := deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_6896] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_6896_return_output;
     VAR_add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_645a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue := VAR_deo2_uxn_opcodes_h_l2925_c40_ddfb_return_output;
     -- add[uxn_opcodes_h_l2926_c40_f119] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2926_c40_f119_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2926_c40_f119_phase <= VAR_add_uxn_opcodes_h_l2926_c40_f119_phase;
     add_uxn_opcodes_h_l2926_c40_f119_ins <= VAR_add_uxn_opcodes_h_l2926_c40_f119_ins;
     add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read <= VAR_add_uxn_opcodes_h_l2926_c40_f119_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2926_c40_f119_return_output := add_uxn_opcodes_h_l2926_c40_f119_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d6cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_26ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output;
     VAR_add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d6cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue := VAR_add_uxn_opcodes_h_l2926_c40_f119_return_output;
     -- add2[uxn_opcodes_h_l2927_c40_b710] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2927_c40_b710_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2927_c40_b710_phase <= VAR_add2_uxn_opcodes_h_l2927_c40_b710_phase;
     add2_uxn_opcodes_h_l2927_c40_b710_ins <= VAR_add2_uxn_opcodes_h_l2927_c40_b710_ins;
     add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2927_c40_b710_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2927_c40_b710_return_output := add2_uxn_opcodes_h_l2927_c40_b710_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_9a3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_0a4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output;
     VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_9a3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue := VAR_add2_uxn_opcodes_h_l2927_c40_b710_return_output;
     -- sub1[uxn_opcodes_h_l2928_c40_1a41] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2928_c40_1a41_phase <= VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_phase;
     sub1_uxn_opcodes_h_l2928_c40_1a41_ins <= VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_ins;
     sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_return_output := sub1_uxn_opcodes_h_l2928_c40_1a41_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_36e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_8fcf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output;
     VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8fcf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue := VAR_sub1_uxn_opcodes_h_l2928_c40_1a41_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_038b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output;

     -- sub2[uxn_opcodes_h_l2929_c40_f4c7] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2929_c40_f4c7_phase <= VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_phase;
     sub2_uxn_opcodes_h_l2929_c40_f4c7_ins <= VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_ins;
     sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output := sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_0013] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_0013_return_output;
     VAR_mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_038b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue := VAR_sub2_uxn_opcodes_h_l2929_c40_f4c7_return_output;
     -- mul[uxn_opcodes_h_l2930_c40_1282] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2930_c40_1282_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2930_c40_1282_phase <= VAR_mul_uxn_opcodes_h_l2930_c40_1282_phase;
     mul_uxn_opcodes_h_l2930_c40_1282_ins <= VAR_mul_uxn_opcodes_h_l2930_c40_1282_ins;
     mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2930_c40_1282_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2930_c40_1282_return_output := mul_uxn_opcodes_h_l2930_c40_1282_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_f06e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_7eb9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output;
     VAR_mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_f06e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue := VAR_mul_uxn_opcodes_h_l2930_c40_1282_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_7850] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_d9fe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output;

     -- mul2[uxn_opcodes_h_l2931_c40_af50] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2931_c40_af50_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2931_c40_af50_phase <= VAR_mul2_uxn_opcodes_h_l2931_c40_af50_phase;
     mul2_uxn_opcodes_h_l2931_c40_af50_ins <= VAR_mul2_uxn_opcodes_h_l2931_c40_af50_ins;
     mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2931_c40_af50_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2931_c40_af50_return_output := mul2_uxn_opcodes_h_l2931_c40_af50_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output;
     VAR_div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7850_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue := VAR_mul2_uxn_opcodes_h_l2931_c40_af50_return_output;
     -- div[uxn_opcodes_h_l2932_c40_3a2f] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2932_c40_3a2f_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2932_c40_3a2f_phase <= VAR_div_uxn_opcodes_h_l2932_c40_3a2f_phase;
     div_uxn_opcodes_h_l2932_c40_3a2f_ins <= VAR_div_uxn_opcodes_h_l2932_c40_3a2f_ins;
     div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read <= VAR_div_uxn_opcodes_h_l2932_c40_3a2f_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2932_c40_3a2f_return_output := div_uxn_opcodes_h_l2932_c40_3a2f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_7129] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_403f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_7129_return_output;
     VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_403f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue := VAR_div_uxn_opcodes_h_l2932_c40_3a2f_return_output;
     -- div2[uxn_opcodes_h_l2933_c40_8bd0] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2933_c40_8bd0_phase <= VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_phase;
     div2_uxn_opcodes_h_l2933_c40_8bd0_ins <= VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_ins;
     div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_return_output := div2_uxn_opcodes_h_l2933_c40_8bd0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_d0b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_46b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output;
     VAR_and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_d0b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue := VAR_div2_uxn_opcodes_h_l2933_c40_8bd0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_1678] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_0c77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output;

     -- and[uxn_opcodes_h_l2934_c40_fd28] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2934_c40_fd28_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2934_c40_fd28_phase <= VAR_and_uxn_opcodes_h_l2934_c40_fd28_phase;
     and_uxn_opcodes_h_l2934_c40_fd28_ins <= VAR_and_uxn_opcodes_h_l2934_c40_fd28_ins;
     and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read <= VAR_and_uxn_opcodes_h_l2934_c40_fd28_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2934_c40_fd28_return_output := and_uxn_opcodes_h_l2934_c40_fd28_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output;
     VAR_and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_1678_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue := VAR_and_uxn_opcodes_h_l2934_c40_fd28_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_3ec5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_b7fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output;

     -- and2[uxn_opcodes_h_l2935_c40_c167] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2935_c40_c167_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2935_c40_c167_phase <= VAR_and2_uxn_opcodes_h_l2935_c40_c167_phase;
     and2_uxn_opcodes_h_l2935_c40_c167_ins <= VAR_and2_uxn_opcodes_h_l2935_c40_c167_ins;
     and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2935_c40_c167_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2935_c40_c167_return_output := and2_uxn_opcodes_h_l2935_c40_c167_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output;
     VAR_ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_3ec5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue := VAR_and2_uxn_opcodes_h_l2935_c40_c167_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_7ffa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_0b09] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output;

     -- ora[uxn_opcodes_h_l2936_c40_52d3] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2936_c40_52d3_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2936_c40_52d3_phase <= VAR_ora_uxn_opcodes_h_l2936_c40_52d3_phase;
     ora_uxn_opcodes_h_l2936_c40_52d3_ins <= VAR_ora_uxn_opcodes_h_l2936_c40_52d3_ins;
     ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2936_c40_52d3_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2936_c40_52d3_return_output := ora_uxn_opcodes_h_l2936_c40_52d3_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_0b09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue := VAR_ora_uxn_opcodes_h_l2936_c40_52d3_return_output;
     -- ora2[uxn_opcodes_h_l2937_c40_7bd2] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2937_c40_7bd2_phase <= VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_phase;
     ora2_uxn_opcodes_h_l2937_c40_7bd2_ins <= VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_ins;
     ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output := ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_7e03] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_9e27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output;
     VAR_eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9e27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue := VAR_ora2_uxn_opcodes_h_l2937_c40_7bd2_return_output;
     -- eor[uxn_opcodes_h_l2938_c40_0a62] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2938_c40_0a62_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2938_c40_0a62_phase <= VAR_eor_uxn_opcodes_h_l2938_c40_0a62_phase;
     eor_uxn_opcodes_h_l2938_c40_0a62_ins <= VAR_eor_uxn_opcodes_h_l2938_c40_0a62_ins;
     eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2938_c40_0a62_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2938_c40_0a62_return_output := eor_uxn_opcodes_h_l2938_c40_0a62_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_51e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_c3e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output;
     VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_c3e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue := VAR_eor_uxn_opcodes_h_l2938_c40_0a62_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_4f96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output;

     -- eor2[uxn_opcodes_h_l2939_c40_9be0] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2939_c40_9be0_phase <= VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_phase;
     eor2_uxn_opcodes_h_l2939_c40_9be0_ins <= VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_ins;
     eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_return_output := eor2_uxn_opcodes_h_l2939_c40_9be0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_2c2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output;
     VAR_sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4f96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue := VAR_eor2_uxn_opcodes_h_l2939_c40_9be0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_2444] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output;

     -- sft[uxn_opcodes_h_l2940_c40_2b03] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2940_c40_2b03_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2940_c40_2b03_phase <= VAR_sft_uxn_opcodes_h_l2940_c40_2b03_phase;
     sft_uxn_opcodes_h_l2940_c40_2b03_ins <= VAR_sft_uxn_opcodes_h_l2940_c40_2b03_ins;
     sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2940_c40_2b03_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2940_c40_2b03_return_output := sft_uxn_opcodes_h_l2940_c40_2b03_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_2444_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue := VAR_sft_uxn_opcodes_h_l2940_c40_2b03_return_output;
     -- sft2[uxn_opcodes_h_l2941_c40_207e] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2941_c40_207e_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2941_c40_207e_phase <= VAR_sft2_uxn_opcodes_h_l2941_c40_207e_phase;
     sft2_uxn_opcodes_h_l2941_c40_207e_ins <= VAR_sft2_uxn_opcodes_h_l2941_c40_207e_ins;
     sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2941_c40_207e_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2941_c40_207e_return_output := sft2_uxn_opcodes_h_l2941_c40_207e_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue := VAR_sft2_uxn_opcodes_h_l2941_c40_207e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_2c2d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_2c2d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_51e7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_51e7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_7e03] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e03_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_7ffa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_7ffa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_b7fc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_b7fc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_0c77] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_0c77_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_46b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_46b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_7129] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_7129_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_d9fe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_d9fe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_7eb9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_7eb9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_0013] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_0013_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_36e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_36e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_0a4d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_0a4d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_26ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_26ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_6896] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_6896_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_52c3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_52c3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_82ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_82ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_6077] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_6077_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_5b1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_5b1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_a962] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_a962_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_7498] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_7498_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_ea47] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_ea47_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_77ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_77ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_aec3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_aec3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_eb4b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_eb4b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_bc33] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_bc33_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_f899] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f899_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_424f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_424f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_2225] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2225_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_f685] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f685_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_5c7a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_5c7a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_021a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_021a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_1194] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1194_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_06cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_06cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_2e11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_2e11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_1b02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_1b02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_f6e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f6e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_7a6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_7a6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_0f09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_0f09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_2321] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2321_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_d0f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_d0f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_6f10] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6f10_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_cda5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_cda5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_66ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_66ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_7314] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7314_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_82fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_82fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_e68f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_e68f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_ca3b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_ca3b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_0a2c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_0a2c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_d7ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_d7ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_31b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_31b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_f72e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_f72e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_375c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_375c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_68d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_68d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_22e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_22e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_3c46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3c46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_5f88] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_5f88_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_3dbb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_3dbb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_6647] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6647_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_20d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_20d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_9514] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_9514_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_d92b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_d92b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_2b3d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_2b3d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_638f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_638f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_dea3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_dea3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_e0da] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_e0da_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_9394] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_9394_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_853f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_853f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_799a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_799a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c2_5eec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2967_c34_b96e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_b96e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_4774 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_4774_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2952_c68_2809] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_2809_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2966_c33_60ee] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_60ee_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2965_c30_e4cb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_e4cb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2963_c40_df9a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_df9a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2958_c3_d97b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_d97b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2944_c17_a599] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_a599_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2962_c39_1ed4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_1ed4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2964_c34_32c4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_32c4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2968_c37_2df2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_2df2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.vram_write_layer;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_0411 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_0411_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2970_c32_904c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_904c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output.is_opc_done;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_a599_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_d97b_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_4774_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_9354 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_9354_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2947_l2949_DUPLICATE_0411_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_1a74 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_1a74_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_5eec_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_1ed4_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_df9a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_32c4_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_e4cb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_60ee_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_b96e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_2df2_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2969_l2957_DUPLICATE_4774_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_904c_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c58_36d1] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_36d1_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_2809_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_13bd] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_left;
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output := BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c20_492a_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_13bd_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_9354_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_9354_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_36d1_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_1a74_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_1a74_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_a615] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_e096] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output;

     -- MUX[uxn_opcodes_h_l2953_c20_492a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c20_492a_cond <= VAR_MUX_uxn_opcodes_h_l2953_c20_492a_cond;
     MUX_uxn_opcodes_h_l2953_c20_492a_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iftrue;
     MUX_uxn_opcodes_h_l2953_c20_492a_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c20_492a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c20_492a_return_output := MUX_uxn_opcodes_h_l2953_c20_492a_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2947_c3_3400 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_e096_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2949_c3_7bd5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_a615_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right := VAR_MUX_uxn_opcodes_h_l2953_c20_492a_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse := VAR_sp0_uxn_opcodes_h_l2949_c3_7bd5;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue := VAR_sp1_uxn_opcodes_h_l2947_c3_3400;
     -- sp0_MUX[uxn_opcodes_h_l2946_c2_53a6] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_cond;
     sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue;
     sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output := sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2946_c2_53a6] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_cond;
     sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iftrue;
     sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output := sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_53a6_return_output;
     -- MUX[uxn_opcodes_h_l2952_c29_4da6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c29_4da6_cond <= VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_cond;
     MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iftrue;
     MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_return_output := MUX_uxn_opcodes_h_l2952_c29_4da6_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c19_c444] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_c444_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2952_c29_4da6_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_c444_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_3da0] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_3da0_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2953_c2_a20d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_left;
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output := BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_a20d_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2955_c24_9c2a] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_stack_address;
     stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_value;
     stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output := stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_9c2a_return_output;
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
