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
entity eval_opcode_phased_0CLK_2b405341 is
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
end eval_opcode_phased_0CLK_2b405341;
architecture arch of eval_opcode_phased_0CLK_2b405341 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2864_c14_bb06]
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_8bdb]
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2865_c14_fc33]
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_49bd]
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_f9d0]
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c14_da06]
signal MUX_uxn_opcodes_h_l2865_c14_da06_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_da06_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_da06_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c14_da06_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2866_c8_aa5c]
signal MUX_uxn_opcodes_h_l2866_c8_aa5c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_09da]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_46e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c2_b67a]
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2872_c2_b67a]
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2872_c48_cd34]
signal brk_uxn_opcodes_h_l2872_c48_cd34_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2872_c48_cd34_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_a795]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_bcfa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_78a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_46e2]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2873_c40_67e7]
signal jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_67e7_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_67e7_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2873_c40_67e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_ae44]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_d2db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_bd83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_78a2]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2874_c40_2629]
signal jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_2629_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_2629_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2874_c40_2629_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1277]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_147a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_3606]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_bd83]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2875_c40_2ed2]
signal jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_2ed2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_2ed2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_592c]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_8b1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_43dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_3606]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2876_c40_9e64]
signal lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_9e64_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_9e64_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2876_c40_9e64_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7102]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c843]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_fb4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_43dd]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2877_c40_91b7]
signal lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_91b7_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_91b7_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2877_c40_91b7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_1d16]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_6f13]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_6a81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_fb4d]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2878_c40_9e9b]
signal lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_9e9b_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_9e9b_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2878_c40_9e9b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_6fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_90dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_bb2b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_6a81]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2879_c40_cae0]
signal lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_cae0_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_cae0_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2879_c40_cae0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_7045]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3a9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_26a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_bb2b]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2880_c40_3177]
signal inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_3177_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_3177_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2880_c40_3177_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_beb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_b0cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_cc62]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_26a4]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2881_c40_2b45]
signal inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_2b45_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_2b45_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2881_c40_2b45_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_b925]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_a374]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_df45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_cc62]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2882_c40_50b2]
signal pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_50b2_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_50b2_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2882_c40_50b2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_8a1c]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_4894]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_8c00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_df45]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2883_c40_b005]
signal pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_b005_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_b005_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2883_c40_b005_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_bd1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_1476]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_c910]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_8c00]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2884_c40_750d]
signal nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_750d_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_750d_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2884_c40_750d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_d987]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_666a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_4a67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_c910]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2885_c40_59dd]
signal nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_59dd_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_59dd_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2885_c40_59dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_ec2c]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_e634]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_b421]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_4a67]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2886_c40_c0e3]
signal swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_c0e3_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_c0e3_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2886_c40_c0e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_46aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_4c94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_89ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_b421]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2887_c40_94a2]
signal swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_94a2_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_94a2_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2887_c40_94a2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_6967]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_092b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_cb21]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_89ab]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2888_c40_4d91]
signal rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_4d91_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_4d91_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2888_c40_4d91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_3e7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_ed6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_218f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_cb21]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2889_c40_5082]
signal rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_5082_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_5082_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2889_c40_5082_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_0ccd]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_b465]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_5622]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_218f]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2890_c40_8a68]
signal dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8a68_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8a68_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2890_c40_8a68_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_5d6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_8bb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_8676]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_5622]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2891_c40_b085]
signal dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_b085_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_b085_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2891_c40_b085_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_85e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_e256]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_3def]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_8676]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2892_c40_11bb]
signal ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_11bb_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_11bb_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2892_c40_11bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_96ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_fadb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_7ec3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_3def]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2893_c40_66e3]
signal ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_66e3_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_66e3_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_e798]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_1229]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_5b9d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_7ec3]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2894_c40_5a33]
signal equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_5a33_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_5a33_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2894_c40_5a33_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_c007]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_ce75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_09fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_5b9d]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2895_c40_df8a]
signal equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_df8a_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_df8a_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2895_c40_df8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_fc7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_61fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7162]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_09fa]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2896_c40_54eb]
signal neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_54eb_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_54eb_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2896_c40_54eb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_3380]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_b30f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_c21d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_7162]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2897_c40_4243]
signal neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_4243_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_4243_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2897_c40_4243_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_1daa]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_8c6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_418c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_c21d]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2898_c40_08ec]
signal gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_08ec_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_08ec_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2898_c40_08ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_a6c4]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_df9a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_bc43]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_418c]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2899_c40_7132]
signal gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7132_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7132_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2899_c40_7132_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_0e19]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_84a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_3c06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_bc43]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2900_c40_ab6f]
signal lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ab6f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ab6f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2900_c40_ab6f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_607d]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_122f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_14b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_3c06]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2901_c40_69f2]
signal lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_69f2_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_69f2_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2901_c40_69f2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ca4]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_3661]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_afea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_14b0]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2902_c40_a31b]
signal jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_a31b_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_a31b_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_a31b_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2902_c40_a31b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2a7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_459b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_94a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_afea]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2903_c40_f835]
signal jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_f835_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_f835_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2903_c40_f835_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_42a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_f82d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_92c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_94a3]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2904_c40_9fbb]
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_d2fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_8492]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_cd9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_92c8]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2905_c40_3825]
signal jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_3825_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_3825_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2905_c40_3825_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fb4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_59a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_cdf5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_cd9b]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2906_c40_c283]
signal jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_c283_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_c283_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_c283_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2906_c40_c283_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_a250]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_af44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_ec0f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_cdf5]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2907_c40_42e3]
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_7ce1]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_d5d5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_5d60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_ec0f]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2908_c40_16ea]
signal sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_16ea_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_16ea_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2908_c40_16ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_96b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_e454]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_9816]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_5d60]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2909_c40_39ad]
signal sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_39ad_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_39ad_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2909_c40_39ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1cce]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_f11c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_8370]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_9816]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2910_c40_a8ac]
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_9741]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_5797]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_f0b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_8370]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2911_c40_a268]
signal ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_a268_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_a268_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2911_c40_a268_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_7391]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_59a9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_4bc6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_f0b1]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2912_c40_ffc7]
signal stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_ffc7_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_ffc7_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2912_c40_ffc7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_33f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0352]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_d786]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_4bc6]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2913_c40_d3a9]
signal stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_d3a9_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_d3a9_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_b418]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_aec1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_2bd4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_d786]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2914_c40_6fc7]
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_eec4]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_e8fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_e5a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_2bd4]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2915_c40_b559]
signal ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2915_c40_b559_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_29e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_56c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_c3b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_e5a0]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2916_c40_5432]
signal str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_5432_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_5432_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_5432_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2916_c40_5432_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_9793]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_2076]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_64c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_c3b0]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2917_c40_6437]
signal str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_6437_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_6437_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_6437_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2917_c40_6437_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_14cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_60a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_9b67]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_64c7]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2918_c40_cdcc]
signal lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_cdcc_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_cdcc_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2918_c40_cdcc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_021b]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4a84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_23e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_9b67]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2919_c40_75db]
signal lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_75db_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_75db_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2919_c40_75db_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_75b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b1e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_06a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_23e0]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2920_c40_0c8c]
signal sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_0c8c_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_0c8c_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2920_c40_0c8c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_d4c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_6de0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_64ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_06a4]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2921_c40_db37]
signal sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_db37_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_db37_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2921_c40_db37_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_2991]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_864f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_d51d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_64ff]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2922_c40_2099]
signal dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2922_c40_2099_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c7e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_4540]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_599e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_d51d]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2923_c40_6439]
signal dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2923_c40_6439_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_ba6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_9544]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_d066]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_599e]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2924_c40_bbb9]
signal deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2924_c40_bbb9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_80e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_6285]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_277b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_d066]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2925_c40_7111]
signal deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2925_c40_7111_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_2af0]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_9786]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_0af6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_277b]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2926_c40_d89a]
signal add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2926_c40_d89a_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_d89a_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2926_c40_d89a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_e205]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_6d84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_b5d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_0af6]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2927_c40_16ea]
signal add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_16ea_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_16ea_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2927_c40_16ea_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_7502]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_d2e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_89bd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_b5d4]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2928_c40_c8c6]
signal sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_c8c6_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_c8c6_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_58ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_36cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_3662]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_89bd]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2929_c40_0b87]
signal sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_0b87_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_0b87_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2929_c40_0b87_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_76a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_6db7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_2405]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_3662]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2930_c40_67d2]
signal mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_67d2_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_67d2_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2930_c40_67d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_da35]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_8945]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_e301]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_2405]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2931_c40_f8ef]
signal mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_f8ef_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_f8ef_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_bea6]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_3cf7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_ac02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_e301]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2932_c40_bb59]
signal div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2932_c40_bb59_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_bb59_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2932_c40_bb59_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f603]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_d6aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_c6ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_ac02]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2933_c40_546b]
signal div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_546b_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_546b_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2933_c40_546b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ac04]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_a266]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_12e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_c6ba]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2934_c40_cec5]
signal and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2934_c40_cec5_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_cec5_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2934_c40_cec5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_4ccd]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_219c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_5732]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_12e2]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2935_c40_5cc9]
signal and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_5cc9_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_5cc9_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2935_c40_5cc9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_fb37]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e2d7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_d898]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_5732]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2936_c40_9df3]
signal ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9df3_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9df3_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2936_c40_9df3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_af27]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_cbc1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_b38c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_d898]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2937_c40_7203]
signal ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7203_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7203_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2937_c40_7203_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ec40]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_e371]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_45d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_b38c]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2938_c40_11a1]
signal eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_11a1_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_11a1_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2938_c40_11a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_db48]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_1563]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_f6a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_45d1]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2939_c40_8df3]
signal eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_8df3_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_8df3_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2939_c40_8df3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_de88]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_77f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_13b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_f6a5]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2940_c40_b800]
signal sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_b800_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_b800_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2940_c40_b800_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_2a07]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_599f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_13b2]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2941_c40_221b]
signal sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_221b_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_221b_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2941_c40_221b_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2943_c16_fae9]
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_9506]
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2946_c2_46b0]
signal sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2946_c2_46b0]
signal sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_d4fe]
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_2c11]
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2952_c29_cf89]
signal MUX_uxn_opcodes_h_l2952_c29_cf89_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2952_c29_cf89_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_48fc]
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2953_c20_ee24]
signal MUX_uxn_opcodes_h_l2953_c20_ee24_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2953_c20_ee24_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2953_c2_66eb]
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2955_c24_4c65]
signal stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06
BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right,
BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right,
BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33
BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right,
BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right,
BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output);

-- MUX_uxn_opcodes_h_l2865_c14_da06
MUX_uxn_opcodes_h_l2865_c14_da06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c14_da06_cond,
MUX_uxn_opcodes_h_l2865_c14_da06_iftrue,
MUX_uxn_opcodes_h_l2865_c14_da06_iffalse,
MUX_uxn_opcodes_h_l2865_c14_da06_return_output);

-- MUX_uxn_opcodes_h_l2866_c8_aa5c
MUX_uxn_opcodes_h_l2866_c8_aa5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2866_c8_aa5c_cond,
MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue,
MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse,
MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a
opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a
is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond,
is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue,
is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse,
is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output);

-- brk_uxn_opcodes_h_l2872_c48_cd34
brk_uxn_opcodes_h_l2872_c48_cd34 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2872_c48_cd34_phase,
brk_uxn_opcodes_h_l2872_c48_cd34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2
opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output);

-- jci_uxn_opcodes_h_l2873_c40_67e7
jci_uxn_opcodes_h_l2873_c40_67e7 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2873_c40_67e7_phase,
jci_uxn_opcodes_h_l2873_c40_67e7_pc,
jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read,
jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read,
jci_uxn_opcodes_h_l2873_c40_67e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2
opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output);

-- jmi_uxn_opcodes_h_l2874_c40_2629
jmi_uxn_opcodes_h_l2874_c40_2629 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2874_c40_2629_phase,
jmi_uxn_opcodes_h_l2874_c40_2629_pc,
jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read,
jmi_uxn_opcodes_h_l2874_c40_2629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83
opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output);

-- jsi_uxn_opcodes_h_l2875_c40_2ed2
jsi_uxn_opcodes_h_l2875_c40_2ed2 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2875_c40_2ed2_phase,
jsi_uxn_opcodes_h_l2875_c40_2ed2_pc,
jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read,
jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_3606
opc_result_MUX_uxn_opcodes_h_l2876_c7_3606 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output);

-- lit_uxn_opcodes_h_l2876_c40_9e64
lit_uxn_opcodes_h_l2876_c40_9e64 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2876_c40_9e64_phase,
lit_uxn_opcodes_h_l2876_c40_9e64_pc,
lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read,
lit_uxn_opcodes_h_l2876_c40_9e64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd
opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output);

-- lit2_uxn_opcodes_h_l2877_c40_91b7
lit2_uxn_opcodes_h_l2877_c40_91b7 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2877_c40_91b7_phase,
lit2_uxn_opcodes_h_l2877_c40_91b7_pc,
lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read,
lit2_uxn_opcodes_h_l2877_c40_91b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d
opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output);

-- lit_uxn_opcodes_h_l2878_c40_9e9b
lit_uxn_opcodes_h_l2878_c40_9e9b : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2878_c40_9e9b_phase,
lit_uxn_opcodes_h_l2878_c40_9e9b_pc,
lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read,
lit_uxn_opcodes_h_l2878_c40_9e9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81
opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output);

-- lit2_uxn_opcodes_h_l2879_c40_cae0
lit2_uxn_opcodes_h_l2879_c40_cae0 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2879_c40_cae0_phase,
lit2_uxn_opcodes_h_l2879_c40_cae0_pc,
lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read,
lit2_uxn_opcodes_h_l2879_c40_cae0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b
opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output);

-- inc_uxn_opcodes_h_l2880_c40_3177
inc_uxn_opcodes_h_l2880_c40_3177 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2880_c40_3177_phase,
inc_uxn_opcodes_h_l2880_c40_3177_ins,
inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read,
inc_uxn_opcodes_h_l2880_c40_3177_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4
opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output);

-- inc2_uxn_opcodes_h_l2881_c40_2b45
inc2_uxn_opcodes_h_l2881_c40_2b45 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2881_c40_2b45_phase,
inc2_uxn_opcodes_h_l2881_c40_2b45_ins,
inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read,
inc2_uxn_opcodes_h_l2881_c40_2b45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62
opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output);

-- pop_uxn_opcodes_h_l2882_c40_50b2
pop_uxn_opcodes_h_l2882_c40_50b2 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2882_c40_50b2_phase,
pop_uxn_opcodes_h_l2882_c40_50b2_ins,
pop_uxn_opcodes_h_l2882_c40_50b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_df45
opc_result_MUX_uxn_opcodes_h_l2883_c7_df45 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output);

-- pop2_uxn_opcodes_h_l2883_c40_b005
pop2_uxn_opcodes_h_l2883_c40_b005 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2883_c40_b005_phase,
pop2_uxn_opcodes_h_l2883_c40_b005_ins,
pop2_uxn_opcodes_h_l2883_c40_b005_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output);

-- nip_uxn_opcodes_h_l2884_c40_750d
nip_uxn_opcodes_h_l2884_c40_750d : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2884_c40_750d_phase,
nip_uxn_opcodes_h_l2884_c40_750d_ins,
nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read,
nip_uxn_opcodes_h_l2884_c40_750d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_c910
opc_result_MUX_uxn_opcodes_h_l2885_c7_c910 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output);

-- nip2_uxn_opcodes_h_l2885_c40_59dd
nip2_uxn_opcodes_h_l2885_c40_59dd : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2885_c40_59dd_phase,
nip2_uxn_opcodes_h_l2885_c40_59dd_ins,
nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read,
nip2_uxn_opcodes_h_l2885_c40_59dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67
opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output);

-- swp_uxn_opcodes_h_l2886_c40_c0e3
swp_uxn_opcodes_h_l2886_c40_c0e3 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2886_c40_c0e3_phase,
swp_uxn_opcodes_h_l2886_c40_c0e3_ins,
swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read,
swp_uxn_opcodes_h_l2886_c40_c0e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_b421
opc_result_MUX_uxn_opcodes_h_l2887_c7_b421 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output);

-- swp2_uxn_opcodes_h_l2887_c40_94a2
swp2_uxn_opcodes_h_l2887_c40_94a2 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2887_c40_94a2_phase,
swp2_uxn_opcodes_h_l2887_c40_94a2_ins,
swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read,
swp2_uxn_opcodes_h_l2887_c40_94a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab
opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output);

-- rot_uxn_opcodes_h_l2888_c40_4d91
rot_uxn_opcodes_h_l2888_c40_4d91 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2888_c40_4d91_phase,
rot_uxn_opcodes_h_l2888_c40_4d91_ins,
rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read,
rot_uxn_opcodes_h_l2888_c40_4d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21
opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output);

-- rot2_uxn_opcodes_h_l2889_c40_5082
rot2_uxn_opcodes_h_l2889_c40_5082 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2889_c40_5082_phase,
rot2_uxn_opcodes_h_l2889_c40_5082_ins,
rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read,
rot2_uxn_opcodes_h_l2889_c40_5082_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_218f
opc_result_MUX_uxn_opcodes_h_l2890_c7_218f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output);

-- dup_uxn_opcodes_h_l2890_c40_8a68
dup_uxn_opcodes_h_l2890_c40_8a68 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2890_c40_8a68_phase,
dup_uxn_opcodes_h_l2890_c40_8a68_ins,
dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read,
dup_uxn_opcodes_h_l2890_c40_8a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_5622
opc_result_MUX_uxn_opcodes_h_l2891_c7_5622 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output);

-- dup2_uxn_opcodes_h_l2891_c40_b085
dup2_uxn_opcodes_h_l2891_c40_b085 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2891_c40_b085_phase,
dup2_uxn_opcodes_h_l2891_c40_b085_ins,
dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read,
dup2_uxn_opcodes_h_l2891_c40_b085_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_8676
opc_result_MUX_uxn_opcodes_h_l2892_c7_8676 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output);

-- ovr_uxn_opcodes_h_l2892_c40_11bb
ovr_uxn_opcodes_h_l2892_c40_11bb : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2892_c40_11bb_phase,
ovr_uxn_opcodes_h_l2892_c40_11bb_ins,
ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read,
ovr_uxn_opcodes_h_l2892_c40_11bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_3def
opc_result_MUX_uxn_opcodes_h_l2893_c7_3def : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output);

-- ovr2_uxn_opcodes_h_l2893_c40_66e3
ovr2_uxn_opcodes_h_l2893_c40_66e3 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2893_c40_66e3_phase,
ovr2_uxn_opcodes_h_l2893_c40_66e3_ins,
ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read,
ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3
opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output);

-- equ_uxn_opcodes_h_l2894_c40_5a33
equ_uxn_opcodes_h_l2894_c40_5a33 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2894_c40_5a33_phase,
equ_uxn_opcodes_h_l2894_c40_5a33_ins,
equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read,
equ_uxn_opcodes_h_l2894_c40_5a33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d
opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output);

-- equ2_uxn_opcodes_h_l2895_c40_df8a
equ2_uxn_opcodes_h_l2895_c40_df8a : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2895_c40_df8a_phase,
equ2_uxn_opcodes_h_l2895_c40_df8a_ins,
equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read,
equ2_uxn_opcodes_h_l2895_c40_df8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa
opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output);

-- neq_uxn_opcodes_h_l2896_c40_54eb
neq_uxn_opcodes_h_l2896_c40_54eb : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2896_c40_54eb_phase,
neq_uxn_opcodes_h_l2896_c40_54eb_ins,
neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read,
neq_uxn_opcodes_h_l2896_c40_54eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_7162
opc_result_MUX_uxn_opcodes_h_l2897_c7_7162 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output);

-- neq2_uxn_opcodes_h_l2897_c40_4243
neq2_uxn_opcodes_h_l2897_c40_4243 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2897_c40_4243_phase,
neq2_uxn_opcodes_h_l2897_c40_4243_ins,
neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read,
neq2_uxn_opcodes_h_l2897_c40_4243_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d
opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output);

-- gth_uxn_opcodes_h_l2898_c40_08ec
gth_uxn_opcodes_h_l2898_c40_08ec : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2898_c40_08ec_phase,
gth_uxn_opcodes_h_l2898_c40_08ec_ins,
gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read,
gth_uxn_opcodes_h_l2898_c40_08ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_418c
opc_result_MUX_uxn_opcodes_h_l2899_c7_418c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output);

-- gth2_uxn_opcodes_h_l2899_c40_7132
gth2_uxn_opcodes_h_l2899_c40_7132 : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2899_c40_7132_phase,
gth2_uxn_opcodes_h_l2899_c40_7132_ins,
gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read,
gth2_uxn_opcodes_h_l2899_c40_7132_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43
opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output);

-- lth_uxn_opcodes_h_l2900_c40_ab6f
lth_uxn_opcodes_h_l2900_c40_ab6f : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2900_c40_ab6f_phase,
lth_uxn_opcodes_h_l2900_c40_ab6f_ins,
lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read,
lth_uxn_opcodes_h_l2900_c40_ab6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06
opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output);

-- lth2_uxn_opcodes_h_l2901_c40_69f2
lth2_uxn_opcodes_h_l2901_c40_69f2 : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2901_c40_69f2_phase,
lth2_uxn_opcodes_h_l2901_c40_69f2_ins,
lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read,
lth2_uxn_opcodes_h_l2901_c40_69f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0
opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output);

-- jmp_uxn_opcodes_h_l2902_c40_a31b
jmp_uxn_opcodes_h_l2902_c40_a31b : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2902_c40_a31b_phase,
jmp_uxn_opcodes_h_l2902_c40_a31b_ins,
jmp_uxn_opcodes_h_l2902_c40_a31b_pc,
jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read,
jmp_uxn_opcodes_h_l2902_c40_a31b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_afea
opc_result_MUX_uxn_opcodes_h_l2903_c7_afea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output);

-- jmp2_uxn_opcodes_h_l2903_c40_f835
jmp2_uxn_opcodes_h_l2903_c40_f835 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2903_c40_f835_phase,
jmp2_uxn_opcodes_h_l2903_c40_f835_ins,
jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read,
jmp2_uxn_opcodes_h_l2903_c40_f835_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3
opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output);

-- jcn_uxn_opcodes_h_l2904_c40_9fbb
jcn_uxn_opcodes_h_l2904_c40_9fbb : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2904_c40_9fbb_phase,
jcn_uxn_opcodes_h_l2904_c40_9fbb_ins,
jcn_uxn_opcodes_h_l2904_c40_9fbb_pc,
jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read,
jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8
opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output);

-- jcn2_uxn_opcodes_h_l2905_c40_3825
jcn2_uxn_opcodes_h_l2905_c40_3825 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2905_c40_3825_phase,
jcn2_uxn_opcodes_h_l2905_c40_3825_ins,
jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read,
jcn2_uxn_opcodes_h_l2905_c40_3825_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b
opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output);

-- jsr_uxn_opcodes_h_l2906_c40_c283
jsr_uxn_opcodes_h_l2906_c40_c283 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2906_c40_c283_phase,
jsr_uxn_opcodes_h_l2906_c40_c283_ins,
jsr_uxn_opcodes_h_l2906_c40_c283_pc,
jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read,
jsr_uxn_opcodes_h_l2906_c40_c283_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5
opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output);

-- jsr2_uxn_opcodes_h_l2907_c40_42e3
jsr2_uxn_opcodes_h_l2907_c40_42e3 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2907_c40_42e3_phase,
jsr2_uxn_opcodes_h_l2907_c40_42e3_ins,
jsr2_uxn_opcodes_h_l2907_c40_42e3_pc,
jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read,
jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f
opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output);

-- sth_uxn_opcodes_h_l2908_c40_16ea
sth_uxn_opcodes_h_l2908_c40_16ea : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2908_c40_16ea_phase,
sth_uxn_opcodes_h_l2908_c40_16ea_ins,
sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read,
sth_uxn_opcodes_h_l2908_c40_16ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60
opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output);

-- sth2_uxn_opcodes_h_l2909_c40_39ad
sth2_uxn_opcodes_h_l2909_c40_39ad : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2909_c40_39ad_phase,
sth2_uxn_opcodes_h_l2909_c40_39ad_ins,
sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read,
sth2_uxn_opcodes_h_l2909_c40_39ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_9816
opc_result_MUX_uxn_opcodes_h_l2910_c7_9816 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output);

-- ldz_uxn_opcodes_h_l2910_c40_a8ac
ldz_uxn_opcodes_h_l2910_c40_a8ac : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2910_c40_a8ac_phase,
ldz_uxn_opcodes_h_l2910_c40_a8ac_ins,
ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read,
ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read,
ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_8370
opc_result_MUX_uxn_opcodes_h_l2911_c7_8370 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output);

-- ldz2_uxn_opcodes_h_l2911_c40_a268
ldz2_uxn_opcodes_h_l2911_c40_a268 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2911_c40_a268_phase,
ldz2_uxn_opcodes_h_l2911_c40_a268_ins,
ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read,
ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read,
ldz2_uxn_opcodes_h_l2911_c40_a268_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1
opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output);

-- stz_uxn_opcodes_h_l2912_c40_ffc7
stz_uxn_opcodes_h_l2912_c40_ffc7 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2912_c40_ffc7_phase,
stz_uxn_opcodes_h_l2912_c40_ffc7_ins,
stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read,
stz_uxn_opcodes_h_l2912_c40_ffc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6
opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output);

-- stz2_uxn_opcodes_h_l2913_c40_d3a9
stz2_uxn_opcodes_h_l2913_c40_d3a9 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2913_c40_d3a9_phase,
stz2_uxn_opcodes_h_l2913_c40_d3a9_ins,
stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read,
stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_d786
opc_result_MUX_uxn_opcodes_h_l2914_c7_d786 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output);

-- ldr_uxn_opcodes_h_l2914_c40_6fc7
ldr_uxn_opcodes_h_l2914_c40_6fc7 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2914_c40_6fc7_phase,
ldr_uxn_opcodes_h_l2914_c40_6fc7_ins,
ldr_uxn_opcodes_h_l2914_c40_6fc7_pc,
ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read,
ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read,
ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4
opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output);

-- ldr2_uxn_opcodes_h_l2915_c40_b559
ldr2_uxn_opcodes_h_l2915_c40_b559 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2915_c40_b559_phase,
ldr2_uxn_opcodes_h_l2915_c40_b559_ins,
ldr2_uxn_opcodes_h_l2915_c40_b559_pc,
ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read,
ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read,
ldr2_uxn_opcodes_h_l2915_c40_b559_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0
opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output);

-- str1_uxn_opcodes_h_l2916_c40_5432
str1_uxn_opcodes_h_l2916_c40_5432 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2916_c40_5432_phase,
str1_uxn_opcodes_h_l2916_c40_5432_ins,
str1_uxn_opcodes_h_l2916_c40_5432_pc,
str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read,
str1_uxn_opcodes_h_l2916_c40_5432_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0
opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output);

-- str2_uxn_opcodes_h_l2917_c40_6437
str2_uxn_opcodes_h_l2917_c40_6437 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2917_c40_6437_phase,
str2_uxn_opcodes_h_l2917_c40_6437_ins,
str2_uxn_opcodes_h_l2917_c40_6437_pc,
str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read,
str2_uxn_opcodes_h_l2917_c40_6437_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7
opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output);

-- lda_uxn_opcodes_h_l2918_c40_cdcc
lda_uxn_opcodes_h_l2918_c40_cdcc : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2918_c40_cdcc_phase,
lda_uxn_opcodes_h_l2918_c40_cdcc_ins,
lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read,
lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read,
lda_uxn_opcodes_h_l2918_c40_cdcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67
opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output);

-- lda2_uxn_opcodes_h_l2919_c40_75db
lda2_uxn_opcodes_h_l2919_c40_75db : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2919_c40_75db_phase,
lda2_uxn_opcodes_h_l2919_c40_75db_ins,
lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read,
lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read,
lda2_uxn_opcodes_h_l2919_c40_75db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0
opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output);

-- sta_uxn_opcodes_h_l2920_c40_0c8c
sta_uxn_opcodes_h_l2920_c40_0c8c : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2920_c40_0c8c_phase,
sta_uxn_opcodes_h_l2920_c40_0c8c_ins,
sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read,
sta_uxn_opcodes_h_l2920_c40_0c8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4
opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output);

-- sta2_uxn_opcodes_h_l2921_c40_db37
sta2_uxn_opcodes_h_l2921_c40_db37 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2921_c40_db37_phase,
sta2_uxn_opcodes_h_l2921_c40_db37_ins,
sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read,
sta2_uxn_opcodes_h_l2921_c40_db37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff
opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output);

-- dei_uxn_opcodes_h_l2922_c40_2099
dei_uxn_opcodes_h_l2922_c40_2099 : entity work.dei_0CLK_b938be89 port map (
clk,
dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2922_c40_2099_phase,
dei_uxn_opcodes_h_l2922_c40_2099_ins,
dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons,
dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read,
dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read,
dei_uxn_opcodes_h_l2922_c40_2099_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d
opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output);

-- dei2_uxn_opcodes_h_l2923_c40_6439
dei2_uxn_opcodes_h_l2923_c40_6439 : entity work.dei2_0CLK_0f8c9c15 port map (
clk,
dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2923_c40_6439_phase,
dei2_uxn_opcodes_h_l2923_c40_6439_ins,
dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons,
dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read,
dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read,
dei2_uxn_opcodes_h_l2923_c40_6439_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_599e
opc_result_MUX_uxn_opcodes_h_l2924_c7_599e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output);

-- deo_uxn_opcodes_h_l2924_c40_bbb9
deo_uxn_opcodes_h_l2924_c40_bbb9 : entity work.deo_0CLK_7fa1ddd4 port map (
clk,
deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2924_c40_bbb9_phase,
deo_uxn_opcodes_h_l2924_c40_bbb9_ins,
deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read,
deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read,
deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read,
deo_uxn_opcodes_h_l2924_c40_bbb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_d066
opc_result_MUX_uxn_opcodes_h_l2925_c7_d066 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output);

-- deo2_uxn_opcodes_h_l2925_c40_7111
deo2_uxn_opcodes_h_l2925_c40_7111 : entity work.deo2_0CLK_5550378d port map (
clk,
deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2925_c40_7111_phase,
deo2_uxn_opcodes_h_l2925_c40_7111_ins,
deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read,
deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read,
deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read,
deo2_uxn_opcodes_h_l2925_c40_7111_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_277b
opc_result_MUX_uxn_opcodes_h_l2926_c7_277b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output);

-- add_uxn_opcodes_h_l2926_c40_d89a
add_uxn_opcodes_h_l2926_c40_d89a : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE,
add_uxn_opcodes_h_l2926_c40_d89a_phase,
add_uxn_opcodes_h_l2926_c40_d89a_ins,
add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read,
add_uxn_opcodes_h_l2926_c40_d89a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6
opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output);

-- add2_uxn_opcodes_h_l2927_c40_16ea
add2_uxn_opcodes_h_l2927_c40_16ea : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2927_c40_16ea_phase,
add2_uxn_opcodes_h_l2927_c40_16ea_ins,
add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read,
add2_uxn_opcodes_h_l2927_c40_16ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4
opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output);

-- sub1_uxn_opcodes_h_l2928_c40_c8c6
sub1_uxn_opcodes_h_l2928_c40_c8c6 : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2928_c40_c8c6_phase,
sub1_uxn_opcodes_h_l2928_c40_c8c6_ins,
sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read,
sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd
opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output);

-- sub2_uxn_opcodes_h_l2929_c40_0b87
sub2_uxn_opcodes_h_l2929_c40_0b87 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2929_c40_0b87_phase,
sub2_uxn_opcodes_h_l2929_c40_0b87_ins,
sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read,
sub2_uxn_opcodes_h_l2929_c40_0b87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_3662
opc_result_MUX_uxn_opcodes_h_l2930_c7_3662 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output);

-- mul_uxn_opcodes_h_l2930_c40_67d2
mul_uxn_opcodes_h_l2930_c40_67d2 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2930_c40_67d2_phase,
mul_uxn_opcodes_h_l2930_c40_67d2_ins,
mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read,
mul_uxn_opcodes_h_l2930_c40_67d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_2405
opc_result_MUX_uxn_opcodes_h_l2931_c7_2405 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output);

-- mul2_uxn_opcodes_h_l2931_c40_f8ef
mul2_uxn_opcodes_h_l2931_c40_f8ef : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2931_c40_f8ef_phase,
mul2_uxn_opcodes_h_l2931_c40_f8ef_ins,
mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read,
mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_e301
opc_result_MUX_uxn_opcodes_h_l2932_c7_e301 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output);

-- div_uxn_opcodes_h_l2932_c40_bb59
div_uxn_opcodes_h_l2932_c40_bb59 : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE,
div_uxn_opcodes_h_l2932_c40_bb59_phase,
div_uxn_opcodes_h_l2932_c40_bb59_ins,
div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read,
div_uxn_opcodes_h_l2932_c40_bb59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02
opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output);

-- div2_uxn_opcodes_h_l2933_c40_546b
div2_uxn_opcodes_h_l2933_c40_546b : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2933_c40_546b_phase,
div2_uxn_opcodes_h_l2933_c40_546b_ins,
div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read,
div2_uxn_opcodes_h_l2933_c40_546b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba
opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output);

-- and_uxn_opcodes_h_l2934_c40_cec5
and_uxn_opcodes_h_l2934_c40_cec5 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE,
and_uxn_opcodes_h_l2934_c40_cec5_phase,
and_uxn_opcodes_h_l2934_c40_cec5_ins,
and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read,
and_uxn_opcodes_h_l2934_c40_cec5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2
opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output);

-- and2_uxn_opcodes_h_l2935_c40_5cc9
and2_uxn_opcodes_h_l2935_c40_5cc9 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2935_c40_5cc9_phase,
and2_uxn_opcodes_h_l2935_c40_5cc9_ins,
and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read,
and2_uxn_opcodes_h_l2935_c40_5cc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_5732
opc_result_MUX_uxn_opcodes_h_l2936_c7_5732 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output);

-- ora_uxn_opcodes_h_l2936_c40_9df3
ora_uxn_opcodes_h_l2936_c40_9df3 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2936_c40_9df3_phase,
ora_uxn_opcodes_h_l2936_c40_9df3_ins,
ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read,
ora_uxn_opcodes_h_l2936_c40_9df3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_d898
opc_result_MUX_uxn_opcodes_h_l2937_c7_d898 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output);

-- ora2_uxn_opcodes_h_l2937_c40_7203
ora2_uxn_opcodes_h_l2937_c40_7203 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2937_c40_7203_phase,
ora2_uxn_opcodes_h_l2937_c40_7203_ins,
ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read,
ora2_uxn_opcodes_h_l2937_c40_7203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c
opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output);

-- eor_uxn_opcodes_h_l2938_c40_11a1
eor_uxn_opcodes_h_l2938_c40_11a1 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2938_c40_11a1_phase,
eor_uxn_opcodes_h_l2938_c40_11a1_ins,
eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read,
eor_uxn_opcodes_h_l2938_c40_11a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1
opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output);

-- eor2_uxn_opcodes_h_l2939_c40_8df3
eor2_uxn_opcodes_h_l2939_c40_8df3 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2939_c40_8df3_phase,
eor2_uxn_opcodes_h_l2939_c40_8df3_ins,
eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read,
eor2_uxn_opcodes_h_l2939_c40_8df3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5
opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output);

-- sft_uxn_opcodes_h_l2940_c40_b800
sft_uxn_opcodes_h_l2940_c40_b800 : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2940_c40_b800_phase,
sft_uxn_opcodes_h_l2940_c40_b800_ins,
sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read,
sft_uxn_opcodes_h_l2940_c40_b800_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2
opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output);

-- sft2_uxn_opcodes_h_l2941_c40_221b
sft2_uxn_opcodes_h_l2941_c40_221b : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2941_c40_221b_phase,
sft2_uxn_opcodes_h_l2941_c40_221b_ins,
sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read,
sft2_uxn_opcodes_h_l2941_c40_221b_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9
CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x,
CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right,
BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output);

-- sp0_MUX_uxn_opcodes_h_l2946_c2_46b0
sp0_MUX_uxn_opcodes_h_l2946_c2_46b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond,
sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue,
sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse,
sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output);

-- sp1_MUX_uxn_opcodes_h_l2946_c2_46b0
sp1_MUX_uxn_opcodes_h_l2946_c2_46b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond,
sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue,
sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse,
sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right,
BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right,
BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output);

-- MUX_uxn_opcodes_h_l2952_c29_cf89
MUX_uxn_opcodes_h_l2952_c29_cf89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c29_cf89_cond,
MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue,
MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse,
MUX_uxn_opcodes_h_l2952_c29_cf89_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right,
BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output);

-- MUX_uxn_opcodes_h_l2953_c20_ee24
MUX_uxn_opcodes_h_l2953_c20_ee24 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c20_ee24_cond,
MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue,
MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse,
MUX_uxn_opcodes_h_l2953_c20_ee24_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb
BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right,
BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output);

-- stack_ram_update_uxn_opcodes_h_l2955_c24_4c65
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address,
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value,
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable,
stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output,
 MUX_uxn_opcodes_h_l2865_c14_da06_return_output,
 MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output,
 is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output,
 brk_uxn_opcodes_h_l2872_c48_cd34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output,
 jci_uxn_opcodes_h_l2873_c40_67e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output,
 jmi_uxn_opcodes_h_l2874_c40_2629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output,
 jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output,
 lit_uxn_opcodes_h_l2876_c40_9e64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output,
 lit2_uxn_opcodes_h_l2877_c40_91b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output,
 lit_uxn_opcodes_h_l2878_c40_9e9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output,
 lit2_uxn_opcodes_h_l2879_c40_cae0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output,
 inc_uxn_opcodes_h_l2880_c40_3177_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output,
 inc2_uxn_opcodes_h_l2881_c40_2b45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output,
 pop_uxn_opcodes_h_l2882_c40_50b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output,
 pop2_uxn_opcodes_h_l2883_c40_b005_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output,
 nip_uxn_opcodes_h_l2884_c40_750d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output,
 nip2_uxn_opcodes_h_l2885_c40_59dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output,
 swp_uxn_opcodes_h_l2886_c40_c0e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output,
 swp2_uxn_opcodes_h_l2887_c40_94a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output,
 rot_uxn_opcodes_h_l2888_c40_4d91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output,
 rot2_uxn_opcodes_h_l2889_c40_5082_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output,
 dup_uxn_opcodes_h_l2890_c40_8a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output,
 dup2_uxn_opcodes_h_l2891_c40_b085_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output,
 ovr_uxn_opcodes_h_l2892_c40_11bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output,
 ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output,
 equ_uxn_opcodes_h_l2894_c40_5a33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output,
 equ2_uxn_opcodes_h_l2895_c40_df8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output,
 neq_uxn_opcodes_h_l2896_c40_54eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output,
 neq2_uxn_opcodes_h_l2897_c40_4243_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output,
 gth_uxn_opcodes_h_l2898_c40_08ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output,
 gth2_uxn_opcodes_h_l2899_c40_7132_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output,
 lth_uxn_opcodes_h_l2900_c40_ab6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output,
 lth2_uxn_opcodes_h_l2901_c40_69f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output,
 jmp_uxn_opcodes_h_l2902_c40_a31b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output,
 jmp2_uxn_opcodes_h_l2903_c40_f835_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output,
 jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output,
 jcn2_uxn_opcodes_h_l2905_c40_3825_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output,
 jsr_uxn_opcodes_h_l2906_c40_c283_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output,
 jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output,
 sth_uxn_opcodes_h_l2908_c40_16ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output,
 sth2_uxn_opcodes_h_l2909_c40_39ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output,
 ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output,
 ldz2_uxn_opcodes_h_l2911_c40_a268_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output,
 stz_uxn_opcodes_h_l2912_c40_ffc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output,
 stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output,
 ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output,
 ldr2_uxn_opcodes_h_l2915_c40_b559_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output,
 str1_uxn_opcodes_h_l2916_c40_5432_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output,
 str2_uxn_opcodes_h_l2917_c40_6437_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output,
 lda_uxn_opcodes_h_l2918_c40_cdcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output,
 lda2_uxn_opcodes_h_l2919_c40_75db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output,
 sta_uxn_opcodes_h_l2920_c40_0c8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output,
 sta2_uxn_opcodes_h_l2921_c40_db37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output,
 dei_uxn_opcodes_h_l2922_c40_2099_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output,
 dei2_uxn_opcodes_h_l2923_c40_6439_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output,
 deo_uxn_opcodes_h_l2924_c40_bbb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output,
 deo2_uxn_opcodes_h_l2925_c40_7111_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output,
 add_uxn_opcodes_h_l2926_c40_d89a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output,
 add2_uxn_opcodes_h_l2927_c40_16ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output,
 sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output,
 sub2_uxn_opcodes_h_l2929_c40_0b87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output,
 mul_uxn_opcodes_h_l2930_c40_67d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output,
 mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output,
 div_uxn_opcodes_h_l2932_c40_bb59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output,
 div2_uxn_opcodes_h_l2933_c40_546b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output,
 and_uxn_opcodes_h_l2934_c40_cec5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output,
 and2_uxn_opcodes_h_l2935_c40_5cc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output,
 ora_uxn_opcodes_h_l2936_c40_9df3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output,
 ora2_uxn_opcodes_h_l2937_c40_7203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output,
 eor_uxn_opcodes_h_l2938_c40_11a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output,
 eor2_uxn_opcodes_h_l2939_c40_8df3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output,
 sft_uxn_opcodes_h_l2940_c40_b800_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output,
 sft2_uxn_opcodes_h_l2941_c40_221b_return_output,
 CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output,
 sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output,
 sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output,
 MUX_uxn_opcodes_h_l2952_c29_cf89_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output,
 MUX_uxn_opcodes_h_l2953_c20_ee24_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output,
 stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output)
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
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_da06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c14_da06_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_cd34_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2872_c48_cd34_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2873_c40_67e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_2629_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_2629_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2874_c40_2629_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_9e64_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_9e64_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2876_c40_9e64_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_3177_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_3177_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2880_c40_3177_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_50b2_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_50b2_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2882_c40_50b2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_b005_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_b005_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2883_c40_b005_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_750d_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_750d_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2884_c40_750d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_4d91_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_4d91_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2888_c40_4d91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_5082_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_5082_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2889_c40_5082_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8a68_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8a68_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2890_c40_8a68_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_b085_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_b085_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2891_c40_b085_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_5a33_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_5a33_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2894_c40_5a33_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_54eb_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_54eb_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2896_c40_54eb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_4243_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_4243_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2897_c40_4243_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_08ec_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_08ec_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2898_c40_08ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7132_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7132_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2899_c40_7132_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2906_c40_c283_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_16ea_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_16ea_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2908_c40_16ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2916_c40_5432_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2917_c40_6437_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2919_c40_75db_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_db37_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_db37_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2921_c40_db37_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2922_c40_2099_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2923_c40_6439_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2925_c40_7111_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_d89a_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_d89a_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2926_c40_d89a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_16ea_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_16ea_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2927_c40_16ea_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_67d2_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_67d2_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2930_c40_67d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_bb59_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_bb59_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2932_c40_bb59_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_546b_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_546b_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2933_c40_546b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_cec5_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_cec5_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2934_c40_cec5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9df3_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9df3_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2936_c40_9df3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7203_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7203_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2937_c40_7203_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_11a1_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_11a1_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2938_c40_11a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_b800_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_b800_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2940_c40_b800_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_221b_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_221b_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2941_c40_221b_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2943_c2_d14b : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_1934_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2949_c3_b83e : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2947_c3_2c52 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_4cc6_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a44c_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_0a44_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_e865_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_7be6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_c9f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_448d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_432f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_f3a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_fe71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_9bda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_cad9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2947_DUPLICATE_8187_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_2faf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_f97a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_2a9f_return_output : eval_opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right := to_unsigned(30, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right := to_unsigned(14, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right := to_unsigned(17, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right := to_unsigned(31, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right := to_unsigned(0, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right := to_unsigned(58, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right := to_unsigned(27, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right := to_unsigned(57, 8);
     VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right := to_unsigned(224, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right := to_unsigned(22, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right := to_unsigned(1, 8);
     VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right := to_unsigned(54, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right := to_unsigned(6, 8);
     VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right := to_unsigned(20, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right := to_unsigned(18, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right := to_unsigned(25, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right := to_unsigned(15, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right := to_unsigned(29, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2927_c40_16ea_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2926_c40_d89a_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2934_c40_cec5_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2933_c40_546b_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2932_c40_bb59_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2891_c40_b085_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2890_c40_8a68_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2938_c40_11a1_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2894_c40_5a33_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7132_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2898_c40_08ec_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2880_c40_3177_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2930_c40_67d2_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2897_c40_4243_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2896_c40_54eb_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2884_c40_750d_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7203_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2936_c40_9df3_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2883_c40_b005_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2882_c40_50b2_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2889_c40_5082_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2888_c40_4d91_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2941_c40_221b_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2940_c40_b800_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2921_c40_db37_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2908_c40_16ea_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2874_c40_2629_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2876_c40_9e64_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2927_c40_16ea_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2926_c40_d89a_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2934_c40_cec5_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2872_c48_cd34_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2933_c40_546b_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2932_c40_bb59_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2891_c40_b085_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2890_c40_8a68_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2938_c40_11a1_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2894_c40_5a33_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2899_c40_7132_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2898_c40_08ec_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2880_c40_3177_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2874_c40_2629_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2876_c40_9e64_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2930_c40_67d2_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2897_c40_4243_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2896_c40_54eb_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2884_c40_750d_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2937_c40_7203_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2936_c40_9df3_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2883_c40_b005_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2882_c40_50b2_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2889_c40_5082_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2888_c40_4d91_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2941_c40_221b_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2940_c40_b800_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2921_c40_db37_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2908_c40_16ea_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2864_c14_bb06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_left;
     BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output := BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output;

     -- brk[uxn_opcodes_h_l2872_c48_cd34] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2872_c48_cd34_phase <= VAR_brk_uxn_opcodes_h_l2872_c48_cd34_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2872_c48_cd34_return_output := brk_uxn_opcodes_h_l2872_c48_cd34_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2943_c16_fae9] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output := CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output;
     VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2864_c14_bb06_return_output;
     VAR_stack_index_uxn_opcodes_h_l2943_c2_d14b := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2943_c16_fae9_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue := VAR_brk_uxn_opcodes_h_l2872_c48_cd34_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left := VAR_stack_index_uxn_opcodes_h_l2943_c2_d14b;
     -- BIN_OP_XOR[uxn_opcodes_h_l2865_c14_8bdb] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_left;
     BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output := BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2865_c14_8bdb_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2865_c14_fc33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_left;
     BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output := BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2865_c14_fc33_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2865_c14_49bd] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2865_c14_49bd_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2865_c14_f9d0] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2865_c14_da06_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2865_c14_f9d0_return_output;
     -- MUX[uxn_opcodes_h_l2865_c14_da06] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c14_da06_cond <= VAR_MUX_uxn_opcodes_h_l2865_c14_da06_cond;
     MUX_uxn_opcodes_h_l2865_c14_da06_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iftrue;
     MUX_uxn_opcodes_h_l2865_c14_da06_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c14_da06_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c14_da06_return_output := MUX_uxn_opcodes_h_l2865_c14_da06_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_cond := VAR_MUX_uxn_opcodes_h_l2865_c14_da06_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2865_c14_da06_return_output;
     -- MUX[uxn_opcodes_h_l2866_c8_aa5c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2866_c8_aa5c_cond <= VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_cond;
     MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue <= VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iftrue;
     MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse <= VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output := MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2866_c8_aa5c_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_14cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_1d16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_42a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_29e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_a250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_da35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_fc7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_beb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_0e19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_a795] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_0ccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_4ccd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_2991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_2a07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_85e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_5d6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_b418] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_7ce1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_6967] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c6_09da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_e798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_ac04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_ae44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_1277] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_2a7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_8a1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f603] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_db48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_ba6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_bd1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_75b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_3e7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_76a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_de88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1cce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_96ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_80e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_eec4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_d4c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_021b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_2af0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_6fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_3380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c7e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_fb37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_7391] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_d2fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_96b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_1daa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_46aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_7502] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_c007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_7045] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_9741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_33f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_b925] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_9793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ca4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_e205] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_607d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_bea6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_ec2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_592c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_af27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_a6c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_d987] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_fb4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ec40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7102] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_58ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c6_09da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_a795_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_ae44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_1277_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_592c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7102_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_1d16_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_6fb7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_7045_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_beb7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_b925_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_8a1c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_bd1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_d987_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ec2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_46aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_6967_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3e7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_0ccd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_5d6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_85e9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_96ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_e798_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c007_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_fc7f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_3380_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_1daa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_a6c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_0e19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_607d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ca4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_2a7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_42a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_d2fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_fb4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a250_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_7ce1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_96b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1cce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9741_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_7391_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_33f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b418_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_eec4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_29e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_9793_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_14cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_021b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_75b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4c0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_2991_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c7e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ba6c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_80e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_2af0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_e205_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_7502_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_58ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_76a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_da35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bea6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f603_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_ac04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_4ccd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_fb37_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_af27_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ec40_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_db48_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_de88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_2a07_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_46e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2872_c2_b67a] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_cond;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output := is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_bcfa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_78a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output;
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_bcfa_return_output;
     -- jci[uxn_opcodes_h_l2873_c40_67e7] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2873_c40_67e7_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2873_c40_67e7_phase <= VAR_jci_uxn_opcodes_h_l2873_c40_67e7_phase;
     jci_uxn_opcodes_h_l2873_c40_67e7_pc <= VAR_jci_uxn_opcodes_h_l2873_c40_67e7_pc;
     jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_stack_read;
     jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2873_c40_67e7_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2873_c40_67e7_return_output := jci_uxn_opcodes_h_l2873_c40_67e7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_d2db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_bd83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output;
     VAR_jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_d2db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue := VAR_jci_uxn_opcodes_h_l2873_c40_67e7_return_output;
     -- jmi[uxn_opcodes_h_l2874_c40_2629] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2874_c40_2629_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2874_c40_2629_phase <= VAR_jmi_uxn_opcodes_h_l2874_c40_2629_phase;
     jmi_uxn_opcodes_h_l2874_c40_2629_pc <= VAR_jmi_uxn_opcodes_h_l2874_c40_2629_pc;
     jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2874_c40_2629_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2874_c40_2629_return_output := jmi_uxn_opcodes_h_l2874_c40_2629_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_3606] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_147a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_3606_return_output;
     VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_147a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue := VAR_jmi_uxn_opcodes_h_l2874_c40_2629_return_output;
     -- jsi[uxn_opcodes_h_l2875_c40_2ed2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2875_c40_2ed2_phase <= VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_phase;
     jsi_uxn_opcodes_h_l2875_c40_2ed2_pc <= VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_pc;
     jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output := jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_8b1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_43dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output;
     VAR_lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_8b1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue := VAR_jsi_uxn_opcodes_h_l2875_c40_2ed2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c843] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_fb4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output;

     -- lit[uxn_opcodes_h_l2876_c40_9e64] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2876_c40_9e64_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2876_c40_9e64_phase <= VAR_lit_uxn_opcodes_h_l2876_c40_9e64_phase;
     lit_uxn_opcodes_h_l2876_c40_9e64_pc <= VAR_lit_uxn_opcodes_h_l2876_c40_9e64_pc;
     lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2876_c40_9e64_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2876_c40_9e64_return_output := lit_uxn_opcodes_h_l2876_c40_9e64_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output;
     VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c843_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue := VAR_lit_uxn_opcodes_h_l2876_c40_9e64_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_6a81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output;

     -- lit2[uxn_opcodes_h_l2877_c40_91b7] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2877_c40_91b7_phase <= VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_phase;
     lit2_uxn_opcodes_h_l2877_c40_91b7_pc <= VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_pc;
     lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_return_output := lit2_uxn_opcodes_h_l2877_c40_91b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_6f13] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output;
     VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_6f13_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue := VAR_lit2_uxn_opcodes_h_l2877_c40_91b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_90dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_bb2b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output;

     -- lit[uxn_opcodes_h_l2878_c40_9e9b] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2878_c40_9e9b_phase <= VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_phase;
     lit_uxn_opcodes_h_l2878_c40_9e9b_pc <= VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_pc;
     lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_return_output := lit_uxn_opcodes_h_l2878_c40_9e9b_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output;
     VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_90dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue := VAR_lit_uxn_opcodes_h_l2878_c40_9e9b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_26a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output;

     -- lit2[uxn_opcodes_h_l2879_c40_cae0] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2879_c40_cae0_phase <= VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_phase;
     lit2_uxn_opcodes_h_l2879_c40_cae0_pc <= VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_pc;
     lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_return_output := lit2_uxn_opcodes_h_l2879_c40_cae0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3a9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output;
     VAR_inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue := VAR_lit2_uxn_opcodes_h_l2879_c40_cae0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_b0cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output;

     -- inc[uxn_opcodes_h_l2880_c40_3177] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2880_c40_3177_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2880_c40_3177_phase <= VAR_inc_uxn_opcodes_h_l2880_c40_3177_phase;
     inc_uxn_opcodes_h_l2880_c40_3177_ins <= VAR_inc_uxn_opcodes_h_l2880_c40_3177_ins;
     inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2880_c40_3177_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2880_c40_3177_return_output := inc_uxn_opcodes_h_l2880_c40_3177_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_cc62] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output;
     VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_b0cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue := VAR_inc_uxn_opcodes_h_l2880_c40_3177_return_output;
     -- inc2[uxn_opcodes_h_l2881_c40_2b45] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2881_c40_2b45_phase <= VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_phase;
     inc2_uxn_opcodes_h_l2881_c40_2b45_ins <= VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_ins;
     inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_return_output := inc2_uxn_opcodes_h_l2881_c40_2b45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_a374] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_df45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_df45_return_output;
     VAR_pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_a374_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue := VAR_inc2_uxn_opcodes_h_l2881_c40_2b45_return_output;
     -- pop[uxn_opcodes_h_l2882_c40_50b2] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2882_c40_50b2_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2882_c40_50b2_phase <= VAR_pop_uxn_opcodes_h_l2882_c40_50b2_phase;
     pop_uxn_opcodes_h_l2882_c40_50b2_ins <= VAR_pop_uxn_opcodes_h_l2882_c40_50b2_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2882_c40_50b2_return_output := pop_uxn_opcodes_h_l2882_c40_50b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_8c00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_4894] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output;
     VAR_pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_4894_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue := VAR_pop_uxn_opcodes_h_l2882_c40_50b2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_1476] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_c910] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output;

     -- pop2[uxn_opcodes_h_l2883_c40_b005] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2883_c40_b005_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2883_c40_b005_phase <= VAR_pop2_uxn_opcodes_h_l2883_c40_b005_phase;
     pop2_uxn_opcodes_h_l2883_c40_b005_ins <= VAR_pop2_uxn_opcodes_h_l2883_c40_b005_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2883_c40_b005_return_output := pop2_uxn_opcodes_h_l2883_c40_b005_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_c910_return_output;
     VAR_nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_1476_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue := VAR_pop2_uxn_opcodes_h_l2883_c40_b005_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_4a67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_666a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output;

     -- nip[uxn_opcodes_h_l2884_c40_750d] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2884_c40_750d_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2884_c40_750d_phase <= VAR_nip_uxn_opcodes_h_l2884_c40_750d_phase;
     nip_uxn_opcodes_h_l2884_c40_750d_ins <= VAR_nip_uxn_opcodes_h_l2884_c40_750d_ins;
     nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2884_c40_750d_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2884_c40_750d_return_output := nip_uxn_opcodes_h_l2884_c40_750d_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output;
     VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_666a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue := VAR_nip_uxn_opcodes_h_l2884_c40_750d_return_output;
     -- nip2[uxn_opcodes_h_l2885_c40_59dd] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2885_c40_59dd_phase <= VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_phase;
     nip2_uxn_opcodes_h_l2885_c40_59dd_ins <= VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_ins;
     nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_return_output := nip2_uxn_opcodes_h_l2885_c40_59dd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_b421] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_e634] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_b421_return_output;
     VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_e634_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue := VAR_nip2_uxn_opcodes_h_l2885_c40_59dd_return_output;
     -- swp[uxn_opcodes_h_l2886_c40_c0e3] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2886_c40_c0e3_phase <= VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_phase;
     swp_uxn_opcodes_h_l2886_c40_c0e3_ins <= VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_ins;
     swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_return_output := swp_uxn_opcodes_h_l2886_c40_c0e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_89ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_4c94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output;
     VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_4c94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue := VAR_swp_uxn_opcodes_h_l2886_c40_c0e3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_cb21] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_092b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output;

     -- swp2[uxn_opcodes_h_l2887_c40_94a2] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2887_c40_94a2_phase <= VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_phase;
     swp2_uxn_opcodes_h_l2887_c40_94a2_ins <= VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_ins;
     swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_return_output := swp2_uxn_opcodes_h_l2887_c40_94a2_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output;
     VAR_rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_092b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue := VAR_swp2_uxn_opcodes_h_l2887_c40_94a2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_ed6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_218f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output;

     -- rot[uxn_opcodes_h_l2888_c40_4d91] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2888_c40_4d91_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2888_c40_4d91_phase <= VAR_rot_uxn_opcodes_h_l2888_c40_4d91_phase;
     rot_uxn_opcodes_h_l2888_c40_4d91_ins <= VAR_rot_uxn_opcodes_h_l2888_c40_4d91_ins;
     rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2888_c40_4d91_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2888_c40_4d91_return_output := rot_uxn_opcodes_h_l2888_c40_4d91_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_218f_return_output;
     VAR_rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_ed6b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue := VAR_rot_uxn_opcodes_h_l2888_c40_4d91_return_output;
     -- rot2[uxn_opcodes_h_l2889_c40_5082] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2889_c40_5082_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2889_c40_5082_phase <= VAR_rot2_uxn_opcodes_h_l2889_c40_5082_phase;
     rot2_uxn_opcodes_h_l2889_c40_5082_ins <= VAR_rot2_uxn_opcodes_h_l2889_c40_5082_ins;
     rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2889_c40_5082_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2889_c40_5082_return_output := rot2_uxn_opcodes_h_l2889_c40_5082_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_5622] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_b465] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_5622_return_output;
     VAR_dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_b465_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue := VAR_rot2_uxn_opcodes_h_l2889_c40_5082_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_8676] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_8bb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output;

     -- dup[uxn_opcodes_h_l2890_c40_8a68] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2890_c40_8a68_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2890_c40_8a68_phase <= VAR_dup_uxn_opcodes_h_l2890_c40_8a68_phase;
     dup_uxn_opcodes_h_l2890_c40_8a68_ins <= VAR_dup_uxn_opcodes_h_l2890_c40_8a68_ins;
     dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2890_c40_8a68_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2890_c40_8a68_return_output := dup_uxn_opcodes_h_l2890_c40_8a68_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8676_return_output;
     VAR_dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8bb9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue := VAR_dup_uxn_opcodes_h_l2890_c40_8a68_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_e256] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output;

     -- dup2[uxn_opcodes_h_l2891_c40_b085] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2891_c40_b085_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2891_c40_b085_phase <= VAR_dup2_uxn_opcodes_h_l2891_c40_b085_phase;
     dup2_uxn_opcodes_h_l2891_c40_b085_ins <= VAR_dup2_uxn_opcodes_h_l2891_c40_b085_ins;
     dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2891_c40_b085_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2891_c40_b085_return_output := dup2_uxn_opcodes_h_l2891_c40_b085_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_3def] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_3def_return_output;
     VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_e256_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue := VAR_dup2_uxn_opcodes_h_l2891_c40_b085_return_output;
     -- ovr[uxn_opcodes_h_l2892_c40_11bb] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2892_c40_11bb_phase <= VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_phase;
     ovr_uxn_opcodes_h_l2892_c40_11bb_ins <= VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_ins;
     ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_return_output := ovr_uxn_opcodes_h_l2892_c40_11bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_fadb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_7ec3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output;
     VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_fadb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue := VAR_ovr_uxn_opcodes_h_l2892_c40_11bb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_1229] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_5b9d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output;

     -- ovr2[uxn_opcodes_h_l2893_c40_66e3] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2893_c40_66e3_phase <= VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_phase;
     ovr2_uxn_opcodes_h_l2893_c40_66e3_ins <= VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_ins;
     ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output := ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output;
     VAR_equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_1229_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue := VAR_ovr2_uxn_opcodes_h_l2893_c40_66e3_return_output;
     -- equ[uxn_opcodes_h_l2894_c40_5a33] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2894_c40_5a33_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2894_c40_5a33_phase <= VAR_equ_uxn_opcodes_h_l2894_c40_5a33_phase;
     equ_uxn_opcodes_h_l2894_c40_5a33_ins <= VAR_equ_uxn_opcodes_h_l2894_c40_5a33_ins;
     equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2894_c40_5a33_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2894_c40_5a33_return_output := equ_uxn_opcodes_h_l2894_c40_5a33_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_09fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_ce75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output;
     VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_ce75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue := VAR_equ_uxn_opcodes_h_l2894_c40_5a33_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_7162] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output;

     -- equ2[uxn_opcodes_h_l2895_c40_df8a] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2895_c40_df8a_phase <= VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_phase;
     equ2_uxn_opcodes_h_l2895_c40_df8a_ins <= VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_ins;
     equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_return_output := equ2_uxn_opcodes_h_l2895_c40_df8a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_61fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_7162_return_output;
     VAR_neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_61fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue := VAR_equ2_uxn_opcodes_h_l2895_c40_df8a_return_output;
     -- neq[uxn_opcodes_h_l2896_c40_54eb] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2896_c40_54eb_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2896_c40_54eb_phase <= VAR_neq_uxn_opcodes_h_l2896_c40_54eb_phase;
     neq_uxn_opcodes_h_l2896_c40_54eb_ins <= VAR_neq_uxn_opcodes_h_l2896_c40_54eb_ins;
     neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2896_c40_54eb_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2896_c40_54eb_return_output := neq_uxn_opcodes_h_l2896_c40_54eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_c21d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_b30f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output;
     VAR_neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_b30f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue := VAR_neq_uxn_opcodes_h_l2896_c40_54eb_return_output;
     -- neq2[uxn_opcodes_h_l2897_c40_4243] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2897_c40_4243_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2897_c40_4243_phase <= VAR_neq2_uxn_opcodes_h_l2897_c40_4243_phase;
     neq2_uxn_opcodes_h_l2897_c40_4243_ins <= VAR_neq2_uxn_opcodes_h_l2897_c40_4243_ins;
     neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2897_c40_4243_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2897_c40_4243_return_output := neq2_uxn_opcodes_h_l2897_c40_4243_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_418c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_8c6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_418c_return_output;
     VAR_gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8c6b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue := VAR_neq2_uxn_opcodes_h_l2897_c40_4243_return_output;
     -- gth[uxn_opcodes_h_l2898_c40_08ec] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2898_c40_08ec_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2898_c40_08ec_phase <= VAR_gth_uxn_opcodes_h_l2898_c40_08ec_phase;
     gth_uxn_opcodes_h_l2898_c40_08ec_ins <= VAR_gth_uxn_opcodes_h_l2898_c40_08ec_ins;
     gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2898_c40_08ec_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2898_c40_08ec_return_output := gth_uxn_opcodes_h_l2898_c40_08ec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_df9a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_bc43] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output;
     VAR_gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_df9a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue := VAR_gth_uxn_opcodes_h_l2898_c40_08ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_3c06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_84a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output;

     -- gth2[uxn_opcodes_h_l2899_c40_7132] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2899_c40_7132_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2899_c40_7132_phase <= VAR_gth2_uxn_opcodes_h_l2899_c40_7132_phase;
     gth2_uxn_opcodes_h_l2899_c40_7132_ins <= VAR_gth2_uxn_opcodes_h_l2899_c40_7132_ins;
     gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2899_c40_7132_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2899_c40_7132_return_output := gth2_uxn_opcodes_h_l2899_c40_7132_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output;
     VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_84a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue := VAR_gth2_uxn_opcodes_h_l2899_c40_7132_return_output;
     -- lth[uxn_opcodes_h_l2900_c40_ab6f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2900_c40_ab6f_phase <= VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_phase;
     lth_uxn_opcodes_h_l2900_c40_ab6f_ins <= VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_ins;
     lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_return_output := lth_uxn_opcodes_h_l2900_c40_ab6f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_122f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_14b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output;
     VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_122f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue := VAR_lth_uxn_opcodes_h_l2900_c40_ab6f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_afea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output;

     -- lth2[uxn_opcodes_h_l2901_c40_69f2] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2901_c40_69f2_phase <= VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_phase;
     lth2_uxn_opcodes_h_l2901_c40_69f2_ins <= VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_ins;
     lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_return_output := lth2_uxn_opcodes_h_l2901_c40_69f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_3661] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_afea_return_output;
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3661_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue := VAR_lth2_uxn_opcodes_h_l2901_c40_69f2_return_output;
     -- jmp[uxn_opcodes_h_l2902_c40_a31b] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2902_c40_a31b_phase <= VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_phase;
     jmp_uxn_opcodes_h_l2902_c40_a31b_ins <= VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_ins;
     jmp_uxn_opcodes_h_l2902_c40_a31b_pc <= VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_pc;
     jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_return_output := jmp_uxn_opcodes_h_l2902_c40_a31b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_459b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_94a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output;
     VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_459b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue := VAR_jmp_uxn_opcodes_h_l2902_c40_a31b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_f82d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output;

     -- jmp2[uxn_opcodes_h_l2903_c40_f835] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2903_c40_f835_phase <= VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_phase;
     jmp2_uxn_opcodes_h_l2903_c40_f835_ins <= VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_ins;
     jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_return_output := jmp2_uxn_opcodes_h_l2903_c40_f835_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_92c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output;
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f82d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue := VAR_jmp2_uxn_opcodes_h_l2903_c40_f835_return_output;
     -- jcn[uxn_opcodes_h_l2904_c40_9fbb] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2904_c40_9fbb_phase <= VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_phase;
     jcn_uxn_opcodes_h_l2904_c40_9fbb_ins <= VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_ins;
     jcn_uxn_opcodes_h_l2904_c40_9fbb_pc <= VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_pc;
     jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output := jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_cd9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_8492] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output;
     VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_8492_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue := VAR_jcn_uxn_opcodes_h_l2904_c40_9fbb_return_output;
     -- jcn2[uxn_opcodes_h_l2905_c40_3825] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2905_c40_3825_phase <= VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_phase;
     jcn2_uxn_opcodes_h_l2905_c40_3825_ins <= VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_ins;
     jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_return_output := jcn2_uxn_opcodes_h_l2905_c40_3825_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_cdf5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_59a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output;
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_59a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue := VAR_jcn2_uxn_opcodes_h_l2905_c40_3825_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_af44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output;

     -- jsr[uxn_opcodes_h_l2906_c40_c283] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2906_c40_c283_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2906_c40_c283_phase <= VAR_jsr_uxn_opcodes_h_l2906_c40_c283_phase;
     jsr_uxn_opcodes_h_l2906_c40_c283_ins <= VAR_jsr_uxn_opcodes_h_l2906_c40_c283_ins;
     jsr_uxn_opcodes_h_l2906_c40_c283_pc <= VAR_jsr_uxn_opcodes_h_l2906_c40_c283_pc;
     jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2906_c40_c283_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2906_c40_c283_return_output := jsr_uxn_opcodes_h_l2906_c40_c283_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_ec0f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output;
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_af44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue := VAR_jsr_uxn_opcodes_h_l2906_c40_c283_return_output;
     -- jsr2[uxn_opcodes_h_l2907_c40_42e3] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2907_c40_42e3_phase <= VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_phase;
     jsr2_uxn_opcodes_h_l2907_c40_42e3_ins <= VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_ins;
     jsr2_uxn_opcodes_h_l2907_c40_42e3_pc <= VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_pc;
     jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output := jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_d5d5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_5d60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output;
     VAR_sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_d5d5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue := VAR_jsr2_uxn_opcodes_h_l2907_c40_42e3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_9816] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_e454] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output;

     -- sth[uxn_opcodes_h_l2908_c40_16ea] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2908_c40_16ea_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2908_c40_16ea_phase <= VAR_sth_uxn_opcodes_h_l2908_c40_16ea_phase;
     sth_uxn_opcodes_h_l2908_c40_16ea_ins <= VAR_sth_uxn_opcodes_h_l2908_c40_16ea_ins;
     sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2908_c40_16ea_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2908_c40_16ea_return_output := sth_uxn_opcodes_h_l2908_c40_16ea_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9816_return_output;
     VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_e454_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue := VAR_sth_uxn_opcodes_h_l2908_c40_16ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_f11c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_8370] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output;

     -- sth2[uxn_opcodes_h_l2909_c40_39ad] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2909_c40_39ad_phase <= VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_phase;
     sth2_uxn_opcodes_h_l2909_c40_39ad_ins <= VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_ins;
     sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_return_output := sth2_uxn_opcodes_h_l2909_c40_39ad_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_8370_return_output;
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_f11c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue := VAR_sth2_uxn_opcodes_h_l2909_c40_39ad_return_output;
     -- ldz[uxn_opcodes_h_l2910_c40_a8ac] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2910_c40_a8ac_phase <= VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_phase;
     ldz_uxn_opcodes_h_l2910_c40_a8ac_ins <= VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_ins;
     ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_stack_read;
     ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output := ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_5797] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_f0b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output;
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5797_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue := VAR_ldz_uxn_opcodes_h_l2910_c40_a8ac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_4bc6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_59a9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output;

     -- ldz2[uxn_opcodes_h_l2911_c40_a268] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2911_c40_a268_phase <= VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_phase;
     ldz2_uxn_opcodes_h_l2911_c40_a268_ins <= VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_ins;
     ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_stack_read;
     ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_return_output := ldz2_uxn_opcodes_h_l2911_c40_a268_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output;
     VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_59a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue := VAR_ldz2_uxn_opcodes_h_l2911_c40_a268_return_output;
     -- stz[uxn_opcodes_h_l2912_c40_ffc7] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2912_c40_ffc7_phase <= VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_phase;
     stz_uxn_opcodes_h_l2912_c40_ffc7_ins <= VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_ins;
     stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_return_output := stz_uxn_opcodes_h_l2912_c40_ffc7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_0352] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_d786] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_d786_return_output;
     VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_0352_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue := VAR_stz_uxn_opcodes_h_l2912_c40_ffc7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_aec1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output;

     -- stz2[uxn_opcodes_h_l2913_c40_d3a9] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2913_c40_d3a9_phase <= VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_phase;
     stz2_uxn_opcodes_h_l2913_c40_d3a9_ins <= VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_ins;
     stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output := stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_2bd4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output;
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_aec1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue := VAR_stz2_uxn_opcodes_h_l2913_c40_d3a9_return_output;
     -- ldr[uxn_opcodes_h_l2914_c40_6fc7] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2914_c40_6fc7_phase <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_phase;
     ldr_uxn_opcodes_h_l2914_c40_6fc7_ins <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_ins;
     ldr_uxn_opcodes_h_l2914_c40_6fc7_pc <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_pc;
     ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_stack_read;
     ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output := ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_e5a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_e8fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output;
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_e8fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue := VAR_ldr_uxn_opcodes_h_l2914_c40_6fc7_return_output;
     -- ldr2[uxn_opcodes_h_l2915_c40_b559] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2915_c40_b559_phase <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_phase;
     ldr2_uxn_opcodes_h_l2915_c40_b559_ins <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_ins;
     ldr2_uxn_opcodes_h_l2915_c40_b559_pc <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_pc;
     ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_stack_read;
     ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_return_output := ldr2_uxn_opcodes_h_l2915_c40_b559_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_c3b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_56c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output;
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_56c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue := VAR_ldr2_uxn_opcodes_h_l2915_c40_b559_return_output;
     -- str1[uxn_opcodes_h_l2916_c40_5432] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2916_c40_5432_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2916_c40_5432_phase <= VAR_str1_uxn_opcodes_h_l2916_c40_5432_phase;
     str1_uxn_opcodes_h_l2916_c40_5432_ins <= VAR_str1_uxn_opcodes_h_l2916_c40_5432_ins;
     str1_uxn_opcodes_h_l2916_c40_5432_pc <= VAR_str1_uxn_opcodes_h_l2916_c40_5432_pc;
     str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2916_c40_5432_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2916_c40_5432_return_output := str1_uxn_opcodes_h_l2916_c40_5432_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_64c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_2076] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output;
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_2076_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue := VAR_str1_uxn_opcodes_h_l2916_c40_5432_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_9b67] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_60a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output;

     -- str2[uxn_opcodes_h_l2917_c40_6437] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2917_c40_6437_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2917_c40_6437_phase <= VAR_str2_uxn_opcodes_h_l2917_c40_6437_phase;
     str2_uxn_opcodes_h_l2917_c40_6437_ins <= VAR_str2_uxn_opcodes_h_l2917_c40_6437_ins;
     str2_uxn_opcodes_h_l2917_c40_6437_pc <= VAR_str2_uxn_opcodes_h_l2917_c40_6437_pc;
     str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2917_c40_6437_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2917_c40_6437_return_output := str2_uxn_opcodes_h_l2917_c40_6437_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output;
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_60a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue := VAR_str2_uxn_opcodes_h_l2917_c40_6437_return_output;
     -- lda[uxn_opcodes_h_l2918_c40_cdcc] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2918_c40_cdcc_phase <= VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_phase;
     lda_uxn_opcodes_h_l2918_c40_cdcc_ins <= VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_ins;
     lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_stack_read;
     lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_return_output := lda_uxn_opcodes_h_l2918_c40_cdcc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_23e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_4a84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output;
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_4a84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue := VAR_lda_uxn_opcodes_h_l2918_c40_cdcc_return_output;
     -- lda2[uxn_opcodes_h_l2919_c40_75db] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2919_c40_75db_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2919_c40_75db_phase <= VAR_lda2_uxn_opcodes_h_l2919_c40_75db_phase;
     lda2_uxn_opcodes_h_l2919_c40_75db_ins <= VAR_lda2_uxn_opcodes_h_l2919_c40_75db_ins;
     lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_stack_read;
     lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2919_c40_75db_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2919_c40_75db_return_output := lda2_uxn_opcodes_h_l2919_c40_75db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b1e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_06a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output;
     VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b1e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue := VAR_lda2_uxn_opcodes_h_l2919_c40_75db_return_output;
     -- sta[uxn_opcodes_h_l2920_c40_0c8c] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2920_c40_0c8c_phase <= VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_phase;
     sta_uxn_opcodes_h_l2920_c40_0c8c_ins <= VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_ins;
     sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_return_output := sta_uxn_opcodes_h_l2920_c40_0c8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_64ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_6de0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output;
     VAR_sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_6de0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue := VAR_sta_uxn_opcodes_h_l2920_c40_0c8c_return_output;
     -- sta2[uxn_opcodes_h_l2921_c40_db37] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2921_c40_db37_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2921_c40_db37_phase <= VAR_sta2_uxn_opcodes_h_l2921_c40_db37_phase;
     sta2_uxn_opcodes_h_l2921_c40_db37_ins <= VAR_sta2_uxn_opcodes_h_l2921_c40_db37_ins;
     sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2921_c40_db37_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2921_c40_db37_return_output := sta2_uxn_opcodes_h_l2921_c40_db37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_d51d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_864f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output;
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_864f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue := VAR_sta2_uxn_opcodes_h_l2921_c40_db37_return_output;
     -- dei[uxn_opcodes_h_l2922_c40_2099] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2922_c40_2099_phase <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_phase;
     dei_uxn_opcodes_h_l2922_c40_2099_ins <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_ins;
     dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_controller0_buttons;
     dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_stack_read;
     dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2922_c40_2099_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2922_c40_2099_return_output := dei_uxn_opcodes_h_l2922_c40_2099_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_599e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_4540] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_599e_return_output;
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_4540_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue := VAR_dei_uxn_opcodes_h_l2922_c40_2099_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_d066] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output;

     -- dei2[uxn_opcodes_h_l2923_c40_6439] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2923_c40_6439_phase <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_phase;
     dei2_uxn_opcodes_h_l2923_c40_6439_ins <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_ins;
     dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_controller0_buttons;
     dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_stack_read;
     dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2923_c40_6439_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2923_c40_6439_return_output := dei2_uxn_opcodes_h_l2923_c40_6439_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_9544] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d066_return_output;
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9544_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue := VAR_dei2_uxn_opcodes_h_l2923_c40_6439_return_output;
     -- deo[uxn_opcodes_h_l2924_c40_bbb9] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2924_c40_bbb9_phase <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_phase;
     deo_uxn_opcodes_h_l2924_c40_bbb9_ins <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_ins;
     deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_stack_read;
     deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_device_ram_read;
     deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_return_output := deo_uxn_opcodes_h_l2924_c40_bbb9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_6285] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_277b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_277b_return_output;
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_6285_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue := VAR_deo_uxn_opcodes_h_l2924_c40_bbb9_return_output;
     -- deo2[uxn_opcodes_h_l2925_c40_7111] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2925_c40_7111_phase <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_phase;
     deo2_uxn_opcodes_h_l2925_c40_7111_ins <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_ins;
     deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_stack_read;
     deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2925_c40_7111_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2925_c40_7111_return_output := deo2_uxn_opcodes_h_l2925_c40_7111_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_0af6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_9786] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output;
     VAR_add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9786_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue := VAR_deo2_uxn_opcodes_h_l2925_c40_7111_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_6d84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_b5d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output;

     -- add[uxn_opcodes_h_l2926_c40_d89a] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2926_c40_d89a_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2926_c40_d89a_phase <= VAR_add_uxn_opcodes_h_l2926_c40_d89a_phase;
     add_uxn_opcodes_h_l2926_c40_d89a_ins <= VAR_add_uxn_opcodes_h_l2926_c40_d89a_ins;
     add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read <= VAR_add_uxn_opcodes_h_l2926_c40_d89a_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2926_c40_d89a_return_output := add_uxn_opcodes_h_l2926_c40_d89a_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output;
     VAR_add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6d84_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue := VAR_add_uxn_opcodes_h_l2926_c40_d89a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_d2e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_89bd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output;

     -- add2[uxn_opcodes_h_l2927_c40_16ea] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2927_c40_16ea_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2927_c40_16ea_phase <= VAR_add2_uxn_opcodes_h_l2927_c40_16ea_phase;
     add2_uxn_opcodes_h_l2927_c40_16ea_ins <= VAR_add2_uxn_opcodes_h_l2927_c40_16ea_ins;
     add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2927_c40_16ea_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2927_c40_16ea_return_output := add2_uxn_opcodes_h_l2927_c40_16ea_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output;
     VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_d2e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue := VAR_add2_uxn_opcodes_h_l2927_c40_16ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_36cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output;

     -- sub1[uxn_opcodes_h_l2928_c40_c8c6] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2928_c40_c8c6_phase <= VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_phase;
     sub1_uxn_opcodes_h_l2928_c40_c8c6_ins <= VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_ins;
     sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output := sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_3662] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_3662_return_output;
     VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_36cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue := VAR_sub1_uxn_opcodes_h_l2928_c40_c8c6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_2405] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output;

     -- sub2[uxn_opcodes_h_l2929_c40_0b87] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2929_c40_0b87_phase <= VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_phase;
     sub2_uxn_opcodes_h_l2929_c40_0b87_ins <= VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_ins;
     sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_return_output := sub2_uxn_opcodes_h_l2929_c40_0b87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_6db7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_2405_return_output;
     VAR_mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_6db7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue := VAR_sub2_uxn_opcodes_h_l2929_c40_0b87_return_output;
     -- mul[uxn_opcodes_h_l2930_c40_67d2] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2930_c40_67d2_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2930_c40_67d2_phase <= VAR_mul_uxn_opcodes_h_l2930_c40_67d2_phase;
     mul_uxn_opcodes_h_l2930_c40_67d2_ins <= VAR_mul_uxn_opcodes_h_l2930_c40_67d2_ins;
     mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2930_c40_67d2_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2930_c40_67d2_return_output := mul_uxn_opcodes_h_l2930_c40_67d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_8945] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_e301] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_e301_return_output;
     VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_8945_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue := VAR_mul_uxn_opcodes_h_l2930_c40_67d2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_3cf7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output;

     -- mul2[uxn_opcodes_h_l2931_c40_f8ef] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2931_c40_f8ef_phase <= VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_phase;
     mul2_uxn_opcodes_h_l2931_c40_f8ef_ins <= VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_ins;
     mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output := mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_ac02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output;
     VAR_div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_3cf7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue := VAR_mul2_uxn_opcodes_h_l2931_c40_f8ef_return_output;
     -- div[uxn_opcodes_h_l2932_c40_bb59] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2932_c40_bb59_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2932_c40_bb59_phase <= VAR_div_uxn_opcodes_h_l2932_c40_bb59_phase;
     div_uxn_opcodes_h_l2932_c40_bb59_ins <= VAR_div_uxn_opcodes_h_l2932_c40_bb59_ins;
     div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read <= VAR_div_uxn_opcodes_h_l2932_c40_bb59_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2932_c40_bb59_return_output := div_uxn_opcodes_h_l2932_c40_bb59_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_d6aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_c6ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output;
     VAR_div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d6aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue := VAR_div_uxn_opcodes_h_l2932_c40_bb59_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_a266] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_12e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output;

     -- div2[uxn_opcodes_h_l2933_c40_546b] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2933_c40_546b_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2933_c40_546b_phase <= VAR_div2_uxn_opcodes_h_l2933_c40_546b_phase;
     div2_uxn_opcodes_h_l2933_c40_546b_ins <= VAR_div2_uxn_opcodes_h_l2933_c40_546b_ins;
     div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2933_c40_546b_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2933_c40_546b_return_output := div2_uxn_opcodes_h_l2933_c40_546b_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output;
     VAR_and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_a266_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue := VAR_div2_uxn_opcodes_h_l2933_c40_546b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_219c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_5732] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output;

     -- and[uxn_opcodes_h_l2934_c40_cec5] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2934_c40_cec5_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2934_c40_cec5_phase <= VAR_and_uxn_opcodes_h_l2934_c40_cec5_phase;
     and_uxn_opcodes_h_l2934_c40_cec5_ins <= VAR_and_uxn_opcodes_h_l2934_c40_cec5_ins;
     and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read <= VAR_and_uxn_opcodes_h_l2934_c40_cec5_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2934_c40_cec5_return_output := and_uxn_opcodes_h_l2934_c40_cec5_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_5732_return_output;
     VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_219c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue := VAR_and_uxn_opcodes_h_l2934_c40_cec5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_d898] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_e2d7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output;

     -- and2[uxn_opcodes_h_l2935_c40_5cc9] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2935_c40_5cc9_phase <= VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_phase;
     and2_uxn_opcodes_h_l2935_c40_5cc9_ins <= VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_ins;
     and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_return_output := and2_uxn_opcodes_h_l2935_c40_5cc9_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d898_return_output;
     VAR_ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_e2d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue := VAR_and2_uxn_opcodes_h_l2935_c40_5cc9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_b38c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_cbc1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output;

     -- ora[uxn_opcodes_h_l2936_c40_9df3] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2936_c40_9df3_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2936_c40_9df3_phase <= VAR_ora_uxn_opcodes_h_l2936_c40_9df3_phase;
     ora_uxn_opcodes_h_l2936_c40_9df3_ins <= VAR_ora_uxn_opcodes_h_l2936_c40_9df3_ins;
     ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2936_c40_9df3_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2936_c40_9df3_return_output := ora_uxn_opcodes_h_l2936_c40_9df3_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output;
     VAR_ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_cbc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue := VAR_ora_uxn_opcodes_h_l2936_c40_9df3_return_output;
     -- ora2[uxn_opcodes_h_l2937_c40_7203] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2937_c40_7203_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2937_c40_7203_phase <= VAR_ora2_uxn_opcodes_h_l2937_c40_7203_phase;
     ora2_uxn_opcodes_h_l2937_c40_7203_ins <= VAR_ora2_uxn_opcodes_h_l2937_c40_7203_ins;
     ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2937_c40_7203_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2937_c40_7203_return_output := ora2_uxn_opcodes_h_l2937_c40_7203_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_e371] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_45d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output;
     VAR_eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_e371_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue := VAR_ora2_uxn_opcodes_h_l2937_c40_7203_return_output;
     -- eor[uxn_opcodes_h_l2938_c40_11a1] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2938_c40_11a1_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2938_c40_11a1_phase <= VAR_eor_uxn_opcodes_h_l2938_c40_11a1_phase;
     eor_uxn_opcodes_h_l2938_c40_11a1_ins <= VAR_eor_uxn_opcodes_h_l2938_c40_11a1_ins;
     eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2938_c40_11a1_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2938_c40_11a1_return_output := eor_uxn_opcodes_h_l2938_c40_11a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_1563] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_f6a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output;
     VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_1563_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue := VAR_eor_uxn_opcodes_h_l2938_c40_11a1_return_output;
     -- eor2[uxn_opcodes_h_l2939_c40_8df3] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2939_c40_8df3_phase <= VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_phase;
     eor2_uxn_opcodes_h_l2939_c40_8df3_ins <= VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_ins;
     eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_return_output := eor2_uxn_opcodes_h_l2939_c40_8df3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_77f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_13b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output;
     VAR_sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_77f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue := VAR_eor2_uxn_opcodes_h_l2939_c40_8df3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_599f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output;

     -- sft[uxn_opcodes_h_l2940_c40_b800] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2940_c40_b800_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2940_c40_b800_phase <= VAR_sft_uxn_opcodes_h_l2940_c40_b800_phase;
     sft_uxn_opcodes_h_l2940_c40_b800_ins <= VAR_sft_uxn_opcodes_h_l2940_c40_b800_ins;
     sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2940_c40_b800_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2940_c40_b800_return_output := sft_uxn_opcodes_h_l2940_c40_b800_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_599f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue := VAR_sft_uxn_opcodes_h_l2940_c40_b800_return_output;
     -- sft2[uxn_opcodes_h_l2941_c40_221b] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2941_c40_221b_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2941_c40_221b_phase <= VAR_sft2_uxn_opcodes_h_l2941_c40_221b_phase;
     sft2_uxn_opcodes_h_l2941_c40_221b_ins <= VAR_sft2_uxn_opcodes_h_l2941_c40_221b_ins;
     sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2941_c40_221b_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2941_c40_221b_return_output := sft2_uxn_opcodes_h_l2941_c40_221b_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue := VAR_sft2_uxn_opcodes_h_l2941_c40_221b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_13b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_13b2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_f6a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_f6a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_45d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_45d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_b38c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_b38c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_d898] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d898_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_5732] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_5732_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_12e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_12e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_c6ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_c6ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_ac02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_ac02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_e301] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_e301_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_2405] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_2405_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_3662] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_3662_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_89bd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_89bd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_b5d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_b5d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_0af6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_0af6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_277b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_277b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_d066] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d066_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_599e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_599e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_d51d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_d51d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_64ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_64ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_06a4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_06a4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_23e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_23e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_9b67] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_9b67_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_64c7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_64c7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_c3b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_c3b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_e5a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e5a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_2bd4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_2bd4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_d786] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_d786_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_4bc6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_4bc6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_f0b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_f0b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_8370] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_8370_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_9816] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9816_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_5d60] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_5d60_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_ec0f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_ec0f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_cdf5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_cdf5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_cd9b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_cd9b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_92c8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_92c8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_94a3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_94a3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_afea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_afea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_14b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_14b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_3c06] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3c06_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_bc43] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_bc43_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_418c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_418c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_c21d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_c21d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_7162] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_7162_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_09fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_09fa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_5b9d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5b9d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_7ec3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_7ec3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_3def] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_3def_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_8676] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8676_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_5622] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_5622_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_218f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_218f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_cb21] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_cb21_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_89ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_89ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_b421] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_b421_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_4a67] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_4a67_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_c910] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_c910_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_8c00] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_8c00_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_df45] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_df45_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_cc62] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_cc62_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_26a4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_26a4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_bb2b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_bb2b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_6a81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6a81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_fb4d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_fb4d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_43dd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_43dd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_3606] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_3606_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_bd83] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_bd83_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_78a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_78a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_46e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_46e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c2_b67a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2944_c17_1934] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_1934_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2965_c30_432f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_432f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2970_c32_cad9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_cad9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2952_c68_a44c] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a44c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2958_c3_e865] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_e865_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_f97a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_f97a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2966_c33_f3a4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_f3a4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2962_c39_7be6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_7be6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2968_c37_9bda] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_9bda_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2963_c40_c9f3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_c9f3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2967_c34_fe71] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_fe71_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2947_DUPLICATE_8187 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2947_DUPLICATE_8187_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2964_c34_448d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_448d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output.is_pc_updated;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2944_c17_1934_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2958_c3_e865_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_f97a_return_output;
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c58_0a44] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_0a44_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2952_c68_a44c_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2944_c2_9506] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_left;
     BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output := BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_2faf LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_2faf_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2949_l2947_DUPLICATE_8187_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_2a9f LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_2a9f_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2872_c2_b67a_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2962_c39_7be6_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2963_c40_c9f3_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2964_c34_448d_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2965_c30_432f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2966_c33_f3a4_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2967_c34_fe71_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2968_c37_9bda_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2957_l2969_DUPLICATE_f97a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2970_c32_cad9_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2944_c2_9506_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_2faf_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2947_l2949_DUPLICATE_2faf_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c58_0a44_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_2a9f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2972_l2848_DUPLICATE_2a9f_return_output;
     -- MUX[uxn_opcodes_h_l2953_c20_ee24] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c20_ee24_cond <= VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_cond;
     MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iftrue;
     MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_return_output := MUX_uxn_opcodes_h_l2953_c20_ee24_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2949_c3_2c11] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2947_c3_d4fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2947_c3_2c52 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2947_c3_d4fe_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2949_c3_b83e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2949_c3_2c11_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right := VAR_MUX_uxn_opcodes_h_l2953_c20_ee24_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse := VAR_sp0_uxn_opcodes_h_l2949_c3_b83e;
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue := VAR_sp1_uxn_opcodes_h_l2947_c3_2c52;
     -- sp1_MUX[uxn_opcodes_h_l2946_c2_46b0] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_cond;
     sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue;
     sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output := sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2946_c2_46b0] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_cond;
     sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iftrue;
     sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output := sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2946_c2_46b0_return_output;
     -- MUX[uxn_opcodes_h_l2952_c29_cf89] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c29_cf89_cond <= VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_cond;
     MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iftrue;
     MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_return_output := MUX_uxn_opcodes_h_l2952_c29_cf89_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2952_c19_4cc6] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_4cc6_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2952_c29_cf89_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2952_c19_4cc6_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2952_c19_48fc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2952_c19_48fc_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2953_c2_66eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_left;
     BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output := BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2953_c2_66eb_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2955_c24_4c65] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_stack_address;
     stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_value;
     stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output := stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2955_c24_4c65_return_output;
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
