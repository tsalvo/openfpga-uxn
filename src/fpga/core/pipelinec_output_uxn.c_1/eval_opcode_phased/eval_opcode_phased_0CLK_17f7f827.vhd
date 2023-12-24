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
entity eval_opcode_phased_0CLK_17f7f827 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_17f7f827;
architecture arch of eval_opcode_phased_0CLK_17f7f827 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2863_c14_cc55]
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_f92b]
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2864_c14_d053]
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_1c5d]
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_9cde]
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2864_c14_0404]
signal MUX_uxn_opcodes_h_l2864_c14_0404_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_0404_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_0404_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_0404_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c8_354f]
signal MUX_uxn_opcodes_h_l2865_c8_354f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_354f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_354f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_354f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_f37a]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_b68b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c2_147f]
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2871_c2_147f]
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output : unsigned(0 downto 0);

-- brk[uxn_opcodes_h_l2871_c48_ece9]
signal brk_uxn_opcodes_h_l2871_c48_ece9_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2871_c48_ece9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_7520]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_a48d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_0bb5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_b68b]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2872_c40_4ffa]
signal jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_4ffa_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_4ffa_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_4ffa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_ebb3]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_0db2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_ef80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_0bb5]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2873_c40_b0d6]
signal jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_b0d6_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_b0d6_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_7fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_5690]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_be19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_ef80]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2874_c40_0e01]
signal jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_0e01_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_0e01_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_0e01_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_aaf8]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_4937]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_5501]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_be19]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2875_c40_46eb]
signal lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_46eb_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_46eb_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_46eb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_e786]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_08e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_1635]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_5501]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2876_c40_923d]
signal lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_923d_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_923d_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_923d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_8ab1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_6a10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_1635]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_738f]
signal lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_738f_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_738f_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_738f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_42a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5ac6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_1608]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_6a10]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_ebff]
signal lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ebff_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ebff_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_ebff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_4948]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_b349]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_a90c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_1608]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2879_c40_0113]
signal inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_0113_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_0113_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_0113_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_921c]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3514]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_bd91]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_a90c]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2880_c40_fda2]
signal inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_fda2_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_fda2_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_fda2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_3238]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_76f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_d1c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_bd91]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2881_c40_abec]
signal pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_abec_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_abec_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_abec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_0b98]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_cc65]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_305d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_d1c5]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2882_c40_9567]
signal pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_9567_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_9567_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_9567_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_5de7]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_81cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_f1d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_305d]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2883_c40_f03e]
signal nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_f03e_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_f03e_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_f03e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_2e88]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a252]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_d553]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_f1d4]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2884_c40_8cae]
signal nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_8cae_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_8cae_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_8cae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_962c]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_88d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_d86a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_d553]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2885_c40_bdee]
signal swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_bdee_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_bdee_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_bdee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_a787]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_3fad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_2fb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_d86a]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2886_c40_4626]
signal swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4626_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4626_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4626_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_ceee]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_0f81]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_63c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_2fb0]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2887_c40_cfff]
signal rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_cfff_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_cfff_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_cfff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_f726]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_4fba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_4a1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_63c9]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2888_c40_320b]
signal rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_320b_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_320b_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_320b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d207]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_17e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_ffad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_4a1a]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2889_c40_2551]
signal dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_2551_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_2551_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_2551_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_8a6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_80a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_eb30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_ffad]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2890_c40_1e67]
signal dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_1e67_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_1e67_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_1e67_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7b0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_73eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_8649]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_eb30]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2891_c40_1911]
signal ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_1911_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_1911_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_1911_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_7dcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_5de1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_b006]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_8649]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2892_c40_8e48]
signal ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_8e48_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_8e48_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_fcde]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_f727]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_79ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_b006]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2893_c40_f107]
signal equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_f107_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_f107_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_f107_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_6dd4]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_d8c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_9701]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_79ec]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2894_c40_a424]
signal equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_a424_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_a424_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_a424_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_62df]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_e6f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_5303]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_9701]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2895_c40_e302]
signal neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_e302_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_e302_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_e302_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_a74c]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3725]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_73e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_5303]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2896_c40_536c]
signal neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_536c_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_536c_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_536c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_8ef8]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_4051]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_dabc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_73e3]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2897_c40_e249]
signal gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_e249_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_e249_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_e249_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_f441]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_8446]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_0994]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_dabc]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2898_c40_1326]
signal gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_1326_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_1326_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_1326_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_eba3]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_94c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_08b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_0994]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2899_c40_d47c]
signal lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d47c_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d47c_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_d47c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_d561]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_5095]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_9392]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_08b0]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2900_c40_6cf1]
signal lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_6cf1_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_6cf1_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_825d]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f0c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_d382]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_9392]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2901_c40_122c]
signal jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_122c_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_122c_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_122c_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_122c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_d0a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_3fa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_5f85]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_d382]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2902_c40_8ac2]
signal jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_f321]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_0be2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_a31e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_5f85]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2903_c40_9f86]
signal jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_9f86_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_9f86_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_9f86_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_9f86_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_f0b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_8af8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_c109]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_a31e]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2904_c40_f826]
signal jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_f826_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_f826_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_f826_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_c6a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_c135]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a2dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_c109]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2905_c40_ae9f]
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_9d01]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_b0a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d2c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_a2dd]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2906_c40_7ae1]
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_27e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_431f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_93bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_d2c1]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2907_c40_1199]
signal sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_1199_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_1199_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_1199_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_bc7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_2568]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_ff8f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_93bb]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2908_c40_eac8]
signal sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_eac8_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_eac8_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_eac8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_0cc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_6513]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_9fcc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_ff8f]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2909_c40_2bcd]
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_45ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0bed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_02ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_9fcc]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2910_c40_9cb4]
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_9ba5]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_5b89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_2571]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_02ea]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2911_c40_f364]
signal stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_f364_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_f364_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_f364_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_56c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_942c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_2050]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_2571]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2912_c40_28b7]
signal stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_28b7_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_28b7_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_28b7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_91ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_4058]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_e7c9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_2050]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2913_c40_e156]
signal ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_e156_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2986]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_d511]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_da5a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_e7c9]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2914_c40_2c4b]
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_ee7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_19c1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_0d7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_da5a]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2915_c40_01ba]
signal str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_01ba_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_01ba_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_01ba_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_01ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_d624]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_9918]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_212e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_0d7f]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2916_c40_8555]
signal str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_8555_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_8555_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_8555_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_8555_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_ed1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_8831]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_7096]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_212e]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2917_c40_5420]
signal lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_5420_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_5420_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_5420_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_2067]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_75b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_0a94]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_7096]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2918_c40_1389]
signal lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_1389_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_1389_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_1389_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_eed8]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_7317]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_d70b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_0a94]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2919_c40_f889]
signal sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_f889_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_f889_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_f889_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3e58]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_f4fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_79bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_d70b]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2920_c40_9394]
signal sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_9394_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_9394_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_9394_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_0986]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f83a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_3985]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_79bb]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2921_c40_3ec8]
signal dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_3ec8_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_3ec8_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_3ec8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3fbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_d3c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_b1f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_3985]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2922_c40_bdff]
signal dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_bdff_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_bdff_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_bdff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_f699]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_453e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_1218]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_b1f1]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2923_c40_c98d]
signal deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_c98d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_ffda]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_9228]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_c79c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_1218]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2924_c40_17fd]
signal deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_17fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_70de]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_b740]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_0a26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_c79c]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2925_c40_adec]
signal add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2925_c40_adec_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_adec_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_adec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_bca6]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_6223]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_02bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_0a26]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2926_c40_f1f6]
signal add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f1f6_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f1f6_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f1f6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_7522]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_6ed8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_c700]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_02bf]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2927_c40_4f42]
signal sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_4f42_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_4f42_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_4f42_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_a358]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_924c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_4df9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_c700]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2928_c40_5546]
signal sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_5546_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_5546_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_5546_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_eaf3]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_5965]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_ba7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_4df9]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2929_c40_1558]
signal mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_1558_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_1558_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_1558_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_41fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_ea33]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_d48a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_ba7f]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2930_c40_9fad]
signal mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_9fad_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_9fad_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_9fad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_5aea]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_3d4a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_222c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_d48a]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2931_c40_d3df]
signal div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2931_c40_d3df_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_d3df_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_d3df_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_0c23]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_1965]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_9917]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_222c]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2932_c40_33d7]
signal div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_33d7_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_33d7_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_33d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_c456]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_d0f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_035d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_9917]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2933_c40_6fa1]
signal and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2933_c40_6fa1_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_6fa1_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_6fa1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_349a]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_0877]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_8824]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_035d]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2934_c40_8f1f]
signal and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_8f1f_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_8f1f_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_8f1f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_9431]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_c653]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_727e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_8824]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2935_c40_d00c]
signal ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_d00c_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_d00c_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_d00c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_b269]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6a87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_3676]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_727e]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2936_c40_76e2]
signal ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_76e2_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_76e2_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_76e2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c194]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_b818]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_57ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_3676]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2937_c40_8d13]
signal eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8d13_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8d13_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_8d13_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_e366]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_7815]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_30f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_57ab]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2938_c40_304f]
signal eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_304f_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_304f_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_304f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_1e54]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_0df0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_9132]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_30f3]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2939_c40_9876]
signal sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_9876_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_9876_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_9876_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_174a]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_4bb9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_9132]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2940_c40_2bc2]
signal sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_2bc2_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_2bc2_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2942_c16_14a7]
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_360e]
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2945_c2_e003]
signal sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2945_c2_e003]
signal sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_73c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_cbec]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2951_c29_ba8d]
signal MUX_uxn_opcodes_h_l2951_c29_ba8d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_0843]
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2952_c20_3c46]
signal MUX_uxn_opcodes_h_l2952_c20_3c46_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_3c46_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_060c]
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2954_c24_b2c4]
signal stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55
BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053
BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output);

-- MUX_uxn_opcodes_h_l2864_c14_0404
MUX_uxn_opcodes_h_l2864_c14_0404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2864_c14_0404_cond,
MUX_uxn_opcodes_h_l2864_c14_0404_iftrue,
MUX_uxn_opcodes_h_l2864_c14_0404_iffalse,
MUX_uxn_opcodes_h_l2864_c14_0404_return_output);

-- MUX_uxn_opcodes_h_l2865_c8_354f
MUX_uxn_opcodes_h_l2865_c8_354f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c8_354f_cond,
MUX_uxn_opcodes_h_l2865_c8_354f_iftrue,
MUX_uxn_opcodes_h_l2865_c8_354f_iffalse,
MUX_uxn_opcodes_h_l2865_c8_354f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c2_147f
opc_result_MUX_uxn_opcodes_h_l2871_c2_147f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2871_c2_147f
is_wait_MUX_uxn_opcodes_h_l2871_c2_147f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond,
is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue,
is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse,
is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output);

-- brk_uxn_opcodes_h_l2871_c48_ece9
brk_uxn_opcodes_h_l2871_c48_ece9 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2871_c48_ece9_phase,
brk_uxn_opcodes_h_l2871_c48_ece9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b
opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output);

-- jci_uxn_opcodes_h_l2872_c40_4ffa
jci_uxn_opcodes_h_l2872_c40_4ffa : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2872_c40_4ffa_phase,
jci_uxn_opcodes_h_l2872_c40_4ffa_pc,
jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read,
jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read,
jci_uxn_opcodes_h_l2872_c40_4ffa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5
opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output);

-- jmi_uxn_opcodes_h_l2873_c40_b0d6
jmi_uxn_opcodes_h_l2873_c40_b0d6 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2873_c40_b0d6_phase,
jmi_uxn_opcodes_h_l2873_c40_b0d6_pc,
jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read,
jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80
opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output);

-- jsi_uxn_opcodes_h_l2874_c40_0e01
jsi_uxn_opcodes_h_l2874_c40_0e01 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2874_c40_0e01_phase,
jsi_uxn_opcodes_h_l2874_c40_0e01_pc,
jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read,
jsi_uxn_opcodes_h_l2874_c40_0e01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_be19
opc_result_MUX_uxn_opcodes_h_l2875_c7_be19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output);

-- lit_uxn_opcodes_h_l2875_c40_46eb
lit_uxn_opcodes_h_l2875_c40_46eb : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2875_c40_46eb_phase,
lit_uxn_opcodes_h_l2875_c40_46eb_pc,
lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read,
lit_uxn_opcodes_h_l2875_c40_46eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_5501
opc_result_MUX_uxn_opcodes_h_l2876_c7_5501 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output);

-- lit2_uxn_opcodes_h_l2876_c40_923d
lit2_uxn_opcodes_h_l2876_c40_923d : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2876_c40_923d_phase,
lit2_uxn_opcodes_h_l2876_c40_923d_pc,
lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read,
lit2_uxn_opcodes_h_l2876_c40_923d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_1635
opc_result_MUX_uxn_opcodes_h_l2877_c7_1635 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output);

-- lit_uxn_opcodes_h_l2877_c40_738f
lit_uxn_opcodes_h_l2877_c40_738f : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_738f_phase,
lit_uxn_opcodes_h_l2877_c40_738f_pc,
lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_738f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10
opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_ebff
lit2_uxn_opcodes_h_l2878_c40_ebff : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_ebff_phase,
lit2_uxn_opcodes_h_l2878_c40_ebff_pc,
lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_ebff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_1608
opc_result_MUX_uxn_opcodes_h_l2879_c7_1608 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output);

-- inc_uxn_opcodes_h_l2879_c40_0113
inc_uxn_opcodes_h_l2879_c40_0113 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2879_c40_0113_phase,
inc_uxn_opcodes_h_l2879_c40_0113_ins,
inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read,
inc_uxn_opcodes_h_l2879_c40_0113_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c
opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output);

-- inc2_uxn_opcodes_h_l2880_c40_fda2
inc2_uxn_opcodes_h_l2880_c40_fda2 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2880_c40_fda2_phase,
inc2_uxn_opcodes_h_l2880_c40_fda2_ins,
inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read,
inc2_uxn_opcodes_h_l2880_c40_fda2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91
opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output);

-- pop_uxn_opcodes_h_l2881_c40_abec
pop_uxn_opcodes_h_l2881_c40_abec : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2881_c40_abec_phase,
pop_uxn_opcodes_h_l2881_c40_abec_ins,
pop_uxn_opcodes_h_l2881_c40_abec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5
opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output);

-- pop2_uxn_opcodes_h_l2882_c40_9567
pop2_uxn_opcodes_h_l2882_c40_9567 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2882_c40_9567_phase,
pop2_uxn_opcodes_h_l2882_c40_9567_ins,
pop2_uxn_opcodes_h_l2882_c40_9567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_305d
opc_result_MUX_uxn_opcodes_h_l2883_c7_305d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output);

-- nip_uxn_opcodes_h_l2883_c40_f03e
nip_uxn_opcodes_h_l2883_c40_f03e : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2883_c40_f03e_phase,
nip_uxn_opcodes_h_l2883_c40_f03e_ins,
nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read,
nip_uxn_opcodes_h_l2883_c40_f03e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4
opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output);

-- nip2_uxn_opcodes_h_l2884_c40_8cae
nip2_uxn_opcodes_h_l2884_c40_8cae : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2884_c40_8cae_phase,
nip2_uxn_opcodes_h_l2884_c40_8cae_ins,
nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read,
nip2_uxn_opcodes_h_l2884_c40_8cae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_d553
opc_result_MUX_uxn_opcodes_h_l2885_c7_d553 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output);

-- swp_uxn_opcodes_h_l2885_c40_bdee
swp_uxn_opcodes_h_l2885_c40_bdee : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2885_c40_bdee_phase,
swp_uxn_opcodes_h_l2885_c40_bdee_ins,
swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read,
swp_uxn_opcodes_h_l2885_c40_bdee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a
opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output);

-- swp2_uxn_opcodes_h_l2886_c40_4626
swp2_uxn_opcodes_h_l2886_c40_4626 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2886_c40_4626_phase,
swp2_uxn_opcodes_h_l2886_c40_4626_ins,
swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read,
swp2_uxn_opcodes_h_l2886_c40_4626_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0
opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output);

-- rot_uxn_opcodes_h_l2887_c40_cfff
rot_uxn_opcodes_h_l2887_c40_cfff : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2887_c40_cfff_phase,
rot_uxn_opcodes_h_l2887_c40_cfff_ins,
rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read,
rot_uxn_opcodes_h_l2887_c40_cfff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9
opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output);

-- rot2_uxn_opcodes_h_l2888_c40_320b
rot2_uxn_opcodes_h_l2888_c40_320b : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2888_c40_320b_phase,
rot2_uxn_opcodes_h_l2888_c40_320b_ins,
rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read,
rot2_uxn_opcodes_h_l2888_c40_320b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a
opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output);

-- dup_uxn_opcodes_h_l2889_c40_2551
dup_uxn_opcodes_h_l2889_c40_2551 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2889_c40_2551_phase,
dup_uxn_opcodes_h_l2889_c40_2551_ins,
dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read,
dup_uxn_opcodes_h_l2889_c40_2551_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad
opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output);

-- dup2_uxn_opcodes_h_l2890_c40_1e67
dup2_uxn_opcodes_h_l2890_c40_1e67 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2890_c40_1e67_phase,
dup2_uxn_opcodes_h_l2890_c40_1e67_ins,
dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read,
dup2_uxn_opcodes_h_l2890_c40_1e67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30
opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output);

-- ovr_uxn_opcodes_h_l2891_c40_1911
ovr_uxn_opcodes_h_l2891_c40_1911 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2891_c40_1911_phase,
ovr_uxn_opcodes_h_l2891_c40_1911_ins,
ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read,
ovr_uxn_opcodes_h_l2891_c40_1911_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_8649
opc_result_MUX_uxn_opcodes_h_l2892_c7_8649 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output);

-- ovr2_uxn_opcodes_h_l2892_c40_8e48
ovr2_uxn_opcodes_h_l2892_c40_8e48 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2892_c40_8e48_phase,
ovr2_uxn_opcodes_h_l2892_c40_8e48_ins,
ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read,
ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_b006
opc_result_MUX_uxn_opcodes_h_l2893_c7_b006 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output);

-- equ_uxn_opcodes_h_l2893_c40_f107
equ_uxn_opcodes_h_l2893_c40_f107 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2893_c40_f107_phase,
equ_uxn_opcodes_h_l2893_c40_f107_ins,
equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read,
equ_uxn_opcodes_h_l2893_c40_f107_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec
opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output);

-- equ2_uxn_opcodes_h_l2894_c40_a424
equ2_uxn_opcodes_h_l2894_c40_a424 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2894_c40_a424_phase,
equ2_uxn_opcodes_h_l2894_c40_a424_ins,
equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read,
equ2_uxn_opcodes_h_l2894_c40_a424_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_9701
opc_result_MUX_uxn_opcodes_h_l2895_c7_9701 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output);

-- neq_uxn_opcodes_h_l2895_c40_e302
neq_uxn_opcodes_h_l2895_c40_e302 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2895_c40_e302_phase,
neq_uxn_opcodes_h_l2895_c40_e302_ins,
neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read,
neq_uxn_opcodes_h_l2895_c40_e302_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_5303
opc_result_MUX_uxn_opcodes_h_l2896_c7_5303 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output);

-- neq2_uxn_opcodes_h_l2896_c40_536c
neq2_uxn_opcodes_h_l2896_c40_536c : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2896_c40_536c_phase,
neq2_uxn_opcodes_h_l2896_c40_536c_ins,
neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read,
neq2_uxn_opcodes_h_l2896_c40_536c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3
opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output);

-- gth_uxn_opcodes_h_l2897_c40_e249
gth_uxn_opcodes_h_l2897_c40_e249 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2897_c40_e249_phase,
gth_uxn_opcodes_h_l2897_c40_e249_ins,
gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read,
gth_uxn_opcodes_h_l2897_c40_e249_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc
opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output);

-- gth2_uxn_opcodes_h_l2898_c40_1326
gth2_uxn_opcodes_h_l2898_c40_1326 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2898_c40_1326_phase,
gth2_uxn_opcodes_h_l2898_c40_1326_ins,
gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read,
gth2_uxn_opcodes_h_l2898_c40_1326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_0994
opc_result_MUX_uxn_opcodes_h_l2899_c7_0994 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output);

-- lth_uxn_opcodes_h_l2899_c40_d47c
lth_uxn_opcodes_h_l2899_c40_d47c : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2899_c40_d47c_phase,
lth_uxn_opcodes_h_l2899_c40_d47c_ins,
lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read,
lth_uxn_opcodes_h_l2899_c40_d47c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0
opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output);

-- lth2_uxn_opcodes_h_l2900_c40_6cf1
lth2_uxn_opcodes_h_l2900_c40_6cf1 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2900_c40_6cf1_phase,
lth2_uxn_opcodes_h_l2900_c40_6cf1_ins,
lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read,
lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_9392
opc_result_MUX_uxn_opcodes_h_l2901_c7_9392 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output);

-- jmp_uxn_opcodes_h_l2901_c40_122c
jmp_uxn_opcodes_h_l2901_c40_122c : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2901_c40_122c_phase,
jmp_uxn_opcodes_h_l2901_c40_122c_ins,
jmp_uxn_opcodes_h_l2901_c40_122c_pc,
jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read,
jmp_uxn_opcodes_h_l2901_c40_122c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_d382
opc_result_MUX_uxn_opcodes_h_l2902_c7_d382 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output);

-- jmp2_uxn_opcodes_h_l2902_c40_8ac2
jmp2_uxn_opcodes_h_l2902_c40_8ac2 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase,
jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins,
jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read,
jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85
opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output);

-- jcn_uxn_opcodes_h_l2903_c40_9f86
jcn_uxn_opcodes_h_l2903_c40_9f86 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2903_c40_9f86_phase,
jcn_uxn_opcodes_h_l2903_c40_9f86_ins,
jcn_uxn_opcodes_h_l2903_c40_9f86_pc,
jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read,
jcn_uxn_opcodes_h_l2903_c40_9f86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e
opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output);

-- jcn2_uxn_opcodes_h_l2904_c40_f826
jcn2_uxn_opcodes_h_l2904_c40_f826 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2904_c40_f826_phase,
jcn2_uxn_opcodes_h_l2904_c40_f826_ins,
jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read,
jcn2_uxn_opcodes_h_l2904_c40_f826_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_c109
opc_result_MUX_uxn_opcodes_h_l2905_c7_c109 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output);

-- jsr_uxn_opcodes_h_l2905_c40_ae9f
jsr_uxn_opcodes_h_l2905_c40_ae9f : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2905_c40_ae9f_phase,
jsr_uxn_opcodes_h_l2905_c40_ae9f_ins,
jsr_uxn_opcodes_h_l2905_c40_ae9f_pc,
jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read,
jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd
opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output);

-- jsr2_uxn_opcodes_h_l2906_c40_7ae1
jsr2_uxn_opcodes_h_l2906_c40_7ae1 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read,
jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1
opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output);

-- sth_uxn_opcodes_h_l2907_c40_1199
sth_uxn_opcodes_h_l2907_c40_1199 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2907_c40_1199_phase,
sth_uxn_opcodes_h_l2907_c40_1199_ins,
sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read,
sth_uxn_opcodes_h_l2907_c40_1199_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb
opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output);

-- sth2_uxn_opcodes_h_l2908_c40_eac8
sth2_uxn_opcodes_h_l2908_c40_eac8 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2908_c40_eac8_phase,
sth2_uxn_opcodes_h_l2908_c40_eac8_ins,
sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read,
sth2_uxn_opcodes_h_l2908_c40_eac8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f
opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output);

-- ldz_uxn_opcodes_h_l2909_c40_2bcd
ldz_uxn_opcodes_h_l2909_c40_2bcd : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2909_c40_2bcd_phase,
ldz_uxn_opcodes_h_l2909_c40_2bcd_ins,
ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read,
ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read,
ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc
opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output);

-- ldz2_uxn_opcodes_h_l2910_c40_9cb4
ldz2_uxn_opcodes_h_l2910_c40_9cb4 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read,
ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea
opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output);

-- stz_uxn_opcodes_h_l2911_c40_f364
stz_uxn_opcodes_h_l2911_c40_f364 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2911_c40_f364_phase,
stz_uxn_opcodes_h_l2911_c40_f364_ins,
stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read,
stz_uxn_opcodes_h_l2911_c40_f364_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_2571
opc_result_MUX_uxn_opcodes_h_l2912_c7_2571 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output);

-- stz2_uxn_opcodes_h_l2912_c40_28b7
stz2_uxn_opcodes_h_l2912_c40_28b7 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2912_c40_28b7_phase,
stz2_uxn_opcodes_h_l2912_c40_28b7_ins,
stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read,
stz2_uxn_opcodes_h_l2912_c40_28b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_2050
opc_result_MUX_uxn_opcodes_h_l2913_c7_2050 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output);

-- ldr_uxn_opcodes_h_l2913_c40_e156
ldr_uxn_opcodes_h_l2913_c40_e156 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2913_c40_e156_phase,
ldr_uxn_opcodes_h_l2913_c40_e156_ins,
ldr_uxn_opcodes_h_l2913_c40_e156_pc,
ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read,
ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read,
ldr_uxn_opcodes_h_l2913_c40_e156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9
opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output);

-- ldr2_uxn_opcodes_h_l2914_c40_2c4b
ldr2_uxn_opcodes_h_l2914_c40_2c4b : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read,
ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a
opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output);

-- str1_uxn_opcodes_h_l2915_c40_01ba
str1_uxn_opcodes_h_l2915_c40_01ba : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2915_c40_01ba_phase,
str1_uxn_opcodes_h_l2915_c40_01ba_ins,
str1_uxn_opcodes_h_l2915_c40_01ba_pc,
str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read,
str1_uxn_opcodes_h_l2915_c40_01ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f
opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output);

-- str2_uxn_opcodes_h_l2916_c40_8555
str2_uxn_opcodes_h_l2916_c40_8555 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2916_c40_8555_phase,
str2_uxn_opcodes_h_l2916_c40_8555_ins,
str2_uxn_opcodes_h_l2916_c40_8555_pc,
str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read,
str2_uxn_opcodes_h_l2916_c40_8555_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_212e
opc_result_MUX_uxn_opcodes_h_l2917_c7_212e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output);

-- lda_uxn_opcodes_h_l2917_c40_5420
lda_uxn_opcodes_h_l2917_c40_5420 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2917_c40_5420_phase,
lda_uxn_opcodes_h_l2917_c40_5420_ins,
lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read,
lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read,
lda_uxn_opcodes_h_l2917_c40_5420_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_7096
opc_result_MUX_uxn_opcodes_h_l2918_c7_7096 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output);

-- lda2_uxn_opcodes_h_l2918_c40_1389
lda2_uxn_opcodes_h_l2918_c40_1389 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2918_c40_1389_phase,
lda2_uxn_opcodes_h_l2918_c40_1389_ins,
lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read,
lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read,
lda2_uxn_opcodes_h_l2918_c40_1389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94
opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output);

-- sta_uxn_opcodes_h_l2919_c40_f889
sta_uxn_opcodes_h_l2919_c40_f889 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2919_c40_f889_phase,
sta_uxn_opcodes_h_l2919_c40_f889_ins,
sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read,
sta_uxn_opcodes_h_l2919_c40_f889_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b
opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output);

-- sta2_uxn_opcodes_h_l2920_c40_9394
sta2_uxn_opcodes_h_l2920_c40_9394 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2920_c40_9394_phase,
sta2_uxn_opcodes_h_l2920_c40_9394_ins,
sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read,
sta2_uxn_opcodes_h_l2920_c40_9394_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb
opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output);

-- dei_uxn_opcodes_h_l2921_c40_3ec8
dei_uxn_opcodes_h_l2921_c40_3ec8 : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2921_c40_3ec8_phase,
dei_uxn_opcodes_h_l2921_c40_3ec8_ins,
dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read,
dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read,
dei_uxn_opcodes_h_l2921_c40_3ec8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_3985
opc_result_MUX_uxn_opcodes_h_l2922_c7_3985 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output);

-- dei2_uxn_opcodes_h_l2922_c40_bdff
dei2_uxn_opcodes_h_l2922_c40_bdff : entity work.dei2_0CLK_919eceda port map (
clk,
dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2922_c40_bdff_phase,
dei2_uxn_opcodes_h_l2922_c40_bdff_ins,
dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read,
dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read,
dei2_uxn_opcodes_h_l2922_c40_bdff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1
opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output);

-- deo_uxn_opcodes_h_l2923_c40_c98d
deo_uxn_opcodes_h_l2923_c40_c98d : entity work.deo_0CLK_ebde644c port map (
clk,
deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2923_c40_c98d_phase,
deo_uxn_opcodes_h_l2923_c40_c98d_ins,
deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read,
deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read,
deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read,
deo_uxn_opcodes_h_l2923_c40_c98d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_1218
opc_result_MUX_uxn_opcodes_h_l2924_c7_1218 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output);

-- deo2_uxn_opcodes_h_l2924_c40_17fd
deo2_uxn_opcodes_h_l2924_c40_17fd : entity work.deo2_0CLK_5952a5d7 port map (
clk,
deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2924_c40_17fd_phase,
deo2_uxn_opcodes_h_l2924_c40_17fd_ins,
deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read,
deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read,
deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read,
deo2_uxn_opcodes_h_l2924_c40_17fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c
opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output);

-- add_uxn_opcodes_h_l2925_c40_adec
add_uxn_opcodes_h_l2925_c40_adec : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE,
add_uxn_opcodes_h_l2925_c40_adec_phase,
add_uxn_opcodes_h_l2925_c40_adec_ins,
add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read,
add_uxn_opcodes_h_l2925_c40_adec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26
opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output);

-- add2_uxn_opcodes_h_l2926_c40_f1f6
add2_uxn_opcodes_h_l2926_c40_f1f6 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2926_c40_f1f6_phase,
add2_uxn_opcodes_h_l2926_c40_f1f6_ins,
add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read,
add2_uxn_opcodes_h_l2926_c40_f1f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf
opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output);

-- sub_uxn_opcodes_h_l2927_c40_4f42
sub_uxn_opcodes_h_l2927_c40_4f42 : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2927_c40_4f42_phase,
sub_uxn_opcodes_h_l2927_c40_4f42_ins,
sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read,
sub_uxn_opcodes_h_l2927_c40_4f42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_c700
opc_result_MUX_uxn_opcodes_h_l2928_c7_c700 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output);

-- sub2_uxn_opcodes_h_l2928_c40_5546
sub2_uxn_opcodes_h_l2928_c40_5546 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2928_c40_5546_phase,
sub2_uxn_opcodes_h_l2928_c40_5546_ins,
sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read,
sub2_uxn_opcodes_h_l2928_c40_5546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9
opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output);

-- mul_uxn_opcodes_h_l2929_c40_1558
mul_uxn_opcodes_h_l2929_c40_1558 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2929_c40_1558_phase,
mul_uxn_opcodes_h_l2929_c40_1558_ins,
mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read,
mul_uxn_opcodes_h_l2929_c40_1558_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f
opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output);

-- mul2_uxn_opcodes_h_l2930_c40_9fad
mul2_uxn_opcodes_h_l2930_c40_9fad : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2930_c40_9fad_phase,
mul2_uxn_opcodes_h_l2930_c40_9fad_ins,
mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read,
mul2_uxn_opcodes_h_l2930_c40_9fad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a
opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output);

-- div_uxn_opcodes_h_l2931_c40_d3df
div_uxn_opcodes_h_l2931_c40_d3df : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE,
div_uxn_opcodes_h_l2931_c40_d3df_phase,
div_uxn_opcodes_h_l2931_c40_d3df_ins,
div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read,
div_uxn_opcodes_h_l2931_c40_d3df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_222c
opc_result_MUX_uxn_opcodes_h_l2932_c7_222c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output);

-- div2_uxn_opcodes_h_l2932_c40_33d7
div2_uxn_opcodes_h_l2932_c40_33d7 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2932_c40_33d7_phase,
div2_uxn_opcodes_h_l2932_c40_33d7_ins,
div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read,
div2_uxn_opcodes_h_l2932_c40_33d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_9917
opc_result_MUX_uxn_opcodes_h_l2933_c7_9917 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output);

-- and_uxn_opcodes_h_l2933_c40_6fa1
and_uxn_opcodes_h_l2933_c40_6fa1 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE,
and_uxn_opcodes_h_l2933_c40_6fa1_phase,
and_uxn_opcodes_h_l2933_c40_6fa1_ins,
and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read,
and_uxn_opcodes_h_l2933_c40_6fa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_035d
opc_result_MUX_uxn_opcodes_h_l2934_c7_035d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output);

-- and2_uxn_opcodes_h_l2934_c40_8f1f
and2_uxn_opcodes_h_l2934_c40_8f1f : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2934_c40_8f1f_phase,
and2_uxn_opcodes_h_l2934_c40_8f1f_ins,
and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read,
and2_uxn_opcodes_h_l2934_c40_8f1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_8824
opc_result_MUX_uxn_opcodes_h_l2935_c7_8824 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output);

-- ora_uxn_opcodes_h_l2935_c40_d00c
ora_uxn_opcodes_h_l2935_c40_d00c : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2935_c40_d00c_phase,
ora_uxn_opcodes_h_l2935_c40_d00c_ins,
ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read,
ora_uxn_opcodes_h_l2935_c40_d00c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_727e
opc_result_MUX_uxn_opcodes_h_l2936_c7_727e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output);

-- ora2_uxn_opcodes_h_l2936_c40_76e2
ora2_uxn_opcodes_h_l2936_c40_76e2 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2936_c40_76e2_phase,
ora2_uxn_opcodes_h_l2936_c40_76e2_ins,
ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read,
ora2_uxn_opcodes_h_l2936_c40_76e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_3676
opc_result_MUX_uxn_opcodes_h_l2937_c7_3676 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output);

-- eor_uxn_opcodes_h_l2937_c40_8d13
eor_uxn_opcodes_h_l2937_c40_8d13 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2937_c40_8d13_phase,
eor_uxn_opcodes_h_l2937_c40_8d13_ins,
eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read,
eor_uxn_opcodes_h_l2937_c40_8d13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab
opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output);

-- eor2_uxn_opcodes_h_l2938_c40_304f
eor2_uxn_opcodes_h_l2938_c40_304f : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2938_c40_304f_phase,
eor2_uxn_opcodes_h_l2938_c40_304f_ins,
eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read,
eor2_uxn_opcodes_h_l2938_c40_304f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3
opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output);

-- sft_uxn_opcodes_h_l2939_c40_9876
sft_uxn_opcodes_h_l2939_c40_9876 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2939_c40_9876_phase,
sft_uxn_opcodes_h_l2939_c40_9876_ins,
sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read,
sft_uxn_opcodes_h_l2939_c40_9876_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_9132
opc_result_MUX_uxn_opcodes_h_l2940_c7_9132 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output);

-- sft2_uxn_opcodes_h_l2940_c40_2bc2
sft2_uxn_opcodes_h_l2940_c40_2bc2 : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2940_c40_2bc2_phase,
sft2_uxn_opcodes_h_l2940_c40_2bc2_ins,
sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read,
sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7
CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x,
CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output);

-- sp1_MUX_uxn_opcodes_h_l2945_c2_e003
sp1_MUX_uxn_opcodes_h_l2945_c2_e003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond,
sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue,
sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse,
sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output);

-- sp0_MUX_uxn_opcodes_h_l2945_c2_e003
sp0_MUX_uxn_opcodes_h_l2945_c2_e003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond,
sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue,
sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse,
sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output);

-- MUX_uxn_opcodes_h_l2951_c29_ba8d
MUX_uxn_opcodes_h_l2951_c29_ba8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2951_c29_ba8d_cond,
MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue,
MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse,
MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output);

-- MUX_uxn_opcodes_h_l2952_c20_3c46
MUX_uxn_opcodes_h_l2952_c20_3c46 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c20_3c46_cond,
MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue,
MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse,
MUX_uxn_opcodes_h_l2952_c20_3c46_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output);

-- stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address,
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value,
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable,
stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output,
 MUX_uxn_opcodes_h_l2864_c14_0404_return_output,
 MUX_uxn_opcodes_h_l2865_c8_354f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output,
 is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output,
 brk_uxn_opcodes_h_l2871_c48_ece9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output,
 jci_uxn_opcodes_h_l2872_c40_4ffa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output,
 jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output,
 jsi_uxn_opcodes_h_l2874_c40_0e01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output,
 lit_uxn_opcodes_h_l2875_c40_46eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output,
 lit2_uxn_opcodes_h_l2876_c40_923d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output,
 lit_uxn_opcodes_h_l2877_c40_738f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output,
 lit2_uxn_opcodes_h_l2878_c40_ebff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output,
 inc_uxn_opcodes_h_l2879_c40_0113_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output,
 inc2_uxn_opcodes_h_l2880_c40_fda2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output,
 pop_uxn_opcodes_h_l2881_c40_abec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output,
 pop2_uxn_opcodes_h_l2882_c40_9567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output,
 nip_uxn_opcodes_h_l2883_c40_f03e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output,
 nip2_uxn_opcodes_h_l2884_c40_8cae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output,
 swp_uxn_opcodes_h_l2885_c40_bdee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output,
 swp2_uxn_opcodes_h_l2886_c40_4626_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output,
 rot_uxn_opcodes_h_l2887_c40_cfff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output,
 rot2_uxn_opcodes_h_l2888_c40_320b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output,
 dup_uxn_opcodes_h_l2889_c40_2551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output,
 dup2_uxn_opcodes_h_l2890_c40_1e67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output,
 ovr_uxn_opcodes_h_l2891_c40_1911_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output,
 ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output,
 equ_uxn_opcodes_h_l2893_c40_f107_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output,
 equ2_uxn_opcodes_h_l2894_c40_a424_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output,
 neq_uxn_opcodes_h_l2895_c40_e302_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output,
 neq2_uxn_opcodes_h_l2896_c40_536c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output,
 gth_uxn_opcodes_h_l2897_c40_e249_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output,
 gth2_uxn_opcodes_h_l2898_c40_1326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output,
 lth_uxn_opcodes_h_l2899_c40_d47c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output,
 lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output,
 jmp_uxn_opcodes_h_l2901_c40_122c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output,
 jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output,
 jcn_uxn_opcodes_h_l2903_c40_9f86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output,
 jcn2_uxn_opcodes_h_l2904_c40_f826_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output,
 jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output,
 jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output,
 sth_uxn_opcodes_h_l2907_c40_1199_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output,
 sth2_uxn_opcodes_h_l2908_c40_eac8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output,
 ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output,
 ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output,
 stz_uxn_opcodes_h_l2911_c40_f364_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output,
 stz2_uxn_opcodes_h_l2912_c40_28b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output,
 ldr_uxn_opcodes_h_l2913_c40_e156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output,
 ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output,
 str1_uxn_opcodes_h_l2915_c40_01ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output,
 str2_uxn_opcodes_h_l2916_c40_8555_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output,
 lda_uxn_opcodes_h_l2917_c40_5420_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output,
 lda2_uxn_opcodes_h_l2918_c40_1389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output,
 sta_uxn_opcodes_h_l2919_c40_f889_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output,
 sta2_uxn_opcodes_h_l2920_c40_9394_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output,
 dei_uxn_opcodes_h_l2921_c40_3ec8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output,
 dei2_uxn_opcodes_h_l2922_c40_bdff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output,
 deo_uxn_opcodes_h_l2923_c40_c98d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output,
 deo2_uxn_opcodes_h_l2924_c40_17fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output,
 add_uxn_opcodes_h_l2925_c40_adec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output,
 add2_uxn_opcodes_h_l2926_c40_f1f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output,
 sub_uxn_opcodes_h_l2927_c40_4f42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output,
 sub2_uxn_opcodes_h_l2928_c40_5546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output,
 mul_uxn_opcodes_h_l2929_c40_1558_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output,
 mul2_uxn_opcodes_h_l2930_c40_9fad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output,
 div_uxn_opcodes_h_l2931_c40_d3df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output,
 div2_uxn_opcodes_h_l2932_c40_33d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output,
 and_uxn_opcodes_h_l2933_c40_6fa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output,
 and2_uxn_opcodes_h_l2934_c40_8f1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output,
 ora_uxn_opcodes_h_l2935_c40_d00c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output,
 ora2_uxn_opcodes_h_l2936_c40_76e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output,
 eor_uxn_opcodes_h_l2937_c40_8d13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output,
 eor2_uxn_opcodes_h_l2938_c40_304f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output,
 sft_uxn_opcodes_h_l2939_c40_9876_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output,
 sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output,
 CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output,
 sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output,
 sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output,
 MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output,
 MUX_uxn_opcodes_h_l2952_c20_3c46_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output,
 stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_0404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_0404_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_354f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_ece9_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_ece9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_46eb_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_46eb_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_46eb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_923d_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_923d_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_923d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_738f_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_738f_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_738f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_0113_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_0113_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_0113_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_abec_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_abec_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_abec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_9567_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_9567_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_9567_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_f03e_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_f03e_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_f03e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_bdee_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_bdee_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_bdee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4626_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4626_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4626_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_cfff_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_cfff_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_cfff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_320b_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_320b_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_320b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_2551_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_2551_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_2551_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_1911_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_1911_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_1911_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_f107_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_f107_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_f107_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_a424_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_a424_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_a424_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_e302_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_e302_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_e302_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_536c_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_536c_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_536c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_e249_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_e249_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_e249_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_1326_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_1326_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_1326_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d47c_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d47c_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_d47c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_122c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_1199_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_1199_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_1199_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_f364_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_f364_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_f364_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_e156_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_01ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_8555_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_5420_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_1389_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_f889_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_f889_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_f889_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_9394_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_9394_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_9394_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_c98d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_adec_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_adec_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_adec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_4f42_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_4f42_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_4f42_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_5546_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_5546_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_5546_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_1558_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_1558_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_1558_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_d3df_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_d3df_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_d3df_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_33d7_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_33d7_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_33d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_6fa1_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_6fa1_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_6fa1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_d00c_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_d00c_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_d00c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8d13_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8d13_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_8d13_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_304f_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_304f_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_304f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_9876_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_9876_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_9876_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2942_c2_5e6e : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_abcc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2946_c3_e553 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2948_c3_a849 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_e9d8_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_1d8d_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_1d00_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2952_c2_9f6a : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_3ffe_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_985f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_f32d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_b556_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_540f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_6930_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_7378_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_5333_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_b865_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_967e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_f54b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_37bf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_713b_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right := to_unsigned(18, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right := to_unsigned(42, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right := to_unsigned(3, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right := to_unsigned(49, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right := to_unsigned(30, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right := to_unsigned(57, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right := to_unsigned(9, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right := to_unsigned(96, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right := to_unsigned(58, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right := to_unsigned(23, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right := to_unsigned(55, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right := to_unsigned(11, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right := to_unsigned(22, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right := to_unsigned(20, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right := to_unsigned(24, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right := to_unsigned(48, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right := to_unsigned(61, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right := to_unsigned(223, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right := to_unsigned(46, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right := to_unsigned(7, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2925_c40_adec_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2933_c40_6fa1_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2932_c40_33d7_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2931_c40_d3df_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2889_c40_2551_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2938_c40_304f_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2937_c40_8d13_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2894_c40_a424_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2893_c40_f107_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2898_c40_1326_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2897_c40_e249_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2879_c40_0113_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2899_c40_d47c_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2929_c40_1558_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2896_c40_536c_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2895_c40_e302_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2883_c40_f03e_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2935_c40_d00c_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2891_c40_1911_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2882_c40_9567_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2881_c40_abec_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2888_c40_320b_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2887_c40_cfff_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2939_c40_9876_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2920_c40_9394_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2919_c40_f889_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2907_c40_1199_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2911_c40_f364_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2928_c40_5546_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2927_c40_4f42_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4626_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2885_c40_bdee_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2876_c40_923d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2875_c40_46eb_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_738f_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2925_c40_adec_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2933_c40_6fa1_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2871_c48_ece9_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2932_c40_33d7_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2931_c40_d3df_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2889_c40_2551_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2938_c40_304f_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2937_c40_8d13_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2894_c40_a424_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2893_c40_f107_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2898_c40_1326_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2897_c40_e249_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2879_c40_0113_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2876_c40_923d_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2875_c40_46eb_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2877_c40_738f_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2899_c40_d47c_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2929_c40_1558_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2896_c40_536c_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2895_c40_e302_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2883_c40_f03e_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2935_c40_d00c_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2891_c40_1911_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2882_c40_9567_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2881_c40_abec_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2888_c40_320b_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2887_c40_cfff_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2939_c40_9876_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2920_c40_9394_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2919_c40_f889_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2907_c40_1199_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2911_c40_f364_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2928_c40_5546_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2927_c40_4f42_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4626_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2885_c40_bdee_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2871_c48_ece9] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2871_c48_ece9_phase <= VAR_brk_uxn_opcodes_h_l2871_c48_ece9_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2871_c48_ece9_return_output := brk_uxn_opcodes_h_l2871_c48_ece9_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2942_c16_14a7] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output := CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2863_c14_cc55] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_left;
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output := BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output;
     VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_cc55_return_output;
     VAR_stack_index_uxn_opcodes_h_l2942_c2_5e6e := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_14a7_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue := VAR_brk_uxn_opcodes_h_l2871_c48_ece9_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left := VAR_stack_index_uxn_opcodes_h_l2942_c2_5e6e;
     -- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_f92b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_left;
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output := BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_f92b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2864_c14_d053] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_left;
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output := BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_d053_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_1c5d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_1c5d_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_9cde] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2864_c14_0404_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_9cde_return_output;
     -- MUX[uxn_opcodes_h_l2864_c14_0404] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2864_c14_0404_cond <= VAR_MUX_uxn_opcodes_h_l2864_c14_0404_cond;
     MUX_uxn_opcodes_h_l2864_c14_0404_iftrue <= VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iftrue;
     MUX_uxn_opcodes_h_l2864_c14_0404_iffalse <= VAR_MUX_uxn_opcodes_h_l2864_c14_0404_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2864_c14_0404_return_output := MUX_uxn_opcodes_h_l2864_c14_0404_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2865_c8_354f_cond := VAR_MUX_uxn_opcodes_h_l2864_c14_0404_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2864_c14_0404_return_output;
     -- MUX[uxn_opcodes_h_l2865_c8_354f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c8_354f_cond <= VAR_MUX_uxn_opcodes_h_l2865_c8_354f_cond;
     MUX_uxn_opcodes_h_l2865_c8_354f_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iftrue;
     MUX_uxn_opcodes_h_l2865_c8_354f_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c8_354f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output := MUX_uxn_opcodes_h_l2865_c8_354f_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2865_c8_354f_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_a74c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_ffda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_9ba5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_c456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_0b98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_f699] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_62df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_c6a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_ee7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_70de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_91ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_aaf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_349a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_ceee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_d624] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_b269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_fcde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_e786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_9431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_3238] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_ebb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_eed8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_825d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_bca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_56c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_174a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_5aea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3e58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_7dcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_d561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_4948] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_962c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_41fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_7520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_5de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_bc7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_6dd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_d0a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_7522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_e366] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_f321] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_eba3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_1e54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_f726] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_d207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_0cc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_2067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_0986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_ed1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_45ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_42a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_2e88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_f37a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_f441] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_9d01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c194] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_a358] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_8a6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_7fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_7b0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_27e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_0c23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_921c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_3fbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_eaf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_8ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_f0b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_7f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_a787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f37a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_7520_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_ebb3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_7fb0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_aaf8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_e786_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_7f2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_42a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_4948_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_921c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_3238_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_0b98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_5de7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_2e88_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_962c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_a787_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_ceee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_f726_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_d207_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_8a6c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_7b0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_7dcb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_fcde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_6dd4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_62df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_a74c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_8ef8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_f441_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_eba3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_d561_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_825d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_d0a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_f321_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_f0b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_c6a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_9d01_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_27e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_bc7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0cc8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_45ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_9ba5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_56c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_91ec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2986_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_ee7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_d624_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_ed1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_2067_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_eed8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3e58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0986_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_3fbd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_f699_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_ffda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_70de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_bca6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_7522_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_a358_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_eaf3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_41fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_5aea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_0c23_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_c456_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_349a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_9431_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_b269_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c194_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_e366_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_1e54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_174a_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2871_c2_147f] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_cond;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output := is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_b68b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_a48d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_0bb5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output;
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_a48d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_0db2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_ef80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output;

     -- jci[uxn_opcodes_h_l2872_c40_4ffa] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2872_c40_4ffa_phase <= VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_phase;
     jci_uxn_opcodes_h_l2872_c40_4ffa_pc <= VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_pc;
     jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_stack_read;
     jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_return_output := jci_uxn_opcodes_h_l2872_c40_4ffa_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output;
     VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0db2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue := VAR_jci_uxn_opcodes_h_l2872_c40_4ffa_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_5690] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output;

     -- jmi[uxn_opcodes_h_l2873_c40_b0d6] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2873_c40_b0d6_phase <= VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_phase;
     jmi_uxn_opcodes_h_l2873_c40_b0d6_pc <= VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_pc;
     jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output := jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_be19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_be19_return_output;
     VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_5690_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue := VAR_jmi_uxn_opcodes_h_l2873_c40_b0d6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_4937] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_5501] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output;

     -- jsi[uxn_opcodes_h_l2874_c40_0e01] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2874_c40_0e01_phase <= VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_phase;
     jsi_uxn_opcodes_h_l2874_c40_0e01_pc <= VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_pc;
     jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_return_output := jsi_uxn_opcodes_h_l2874_c40_0e01_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_5501_return_output;
     VAR_lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4937_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue := VAR_jsi_uxn_opcodes_h_l2874_c40_0e01_return_output;
     -- lit[uxn_opcodes_h_l2875_c40_46eb] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2875_c40_46eb_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2875_c40_46eb_phase <= VAR_lit_uxn_opcodes_h_l2875_c40_46eb_phase;
     lit_uxn_opcodes_h_l2875_c40_46eb_pc <= VAR_lit_uxn_opcodes_h_l2875_c40_46eb_pc;
     lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2875_c40_46eb_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2875_c40_46eb_return_output := lit_uxn_opcodes_h_l2875_c40_46eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_08e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_1635] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_1635_return_output;
     VAR_lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_08e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue := VAR_lit_uxn_opcodes_h_l2875_c40_46eb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_6a10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output;

     -- lit2[uxn_opcodes_h_l2876_c40_923d] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2876_c40_923d_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2876_c40_923d_phase <= VAR_lit2_uxn_opcodes_h_l2876_c40_923d_phase;
     lit2_uxn_opcodes_h_l2876_c40_923d_pc <= VAR_lit2_uxn_opcodes_h_l2876_c40_923d_pc;
     lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2876_c40_923d_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2876_c40_923d_return_output := lit2_uxn_opcodes_h_l2876_c40_923d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_8ab1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_8ab1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue := VAR_lit2_uxn_opcodes_h_l2876_c40_923d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_1608] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_738f] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_738f_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_738f_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_738f_phase;
     lit_uxn_opcodes_h_l2877_c40_738f_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_738f_pc;
     lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_738f_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_738f_return_output := lit_uxn_opcodes_h_l2877_c40_738f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5ac6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1608_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5ac6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_738f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_b349] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_ebff] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_ebff_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_phase;
     lit2_uxn_opcodes_h_l2878_c40_ebff_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_pc;
     lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_return_output := lit2_uxn_opcodes_h_l2878_c40_ebff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_a90c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output;
     VAR_inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b349_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_ebff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_bd91] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output;

     -- inc[uxn_opcodes_h_l2879_c40_0113] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2879_c40_0113_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2879_c40_0113_phase <= VAR_inc_uxn_opcodes_h_l2879_c40_0113_phase;
     inc_uxn_opcodes_h_l2879_c40_0113_ins <= VAR_inc_uxn_opcodes_h_l2879_c40_0113_ins;
     inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2879_c40_0113_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2879_c40_0113_return_output := inc_uxn_opcodes_h_l2879_c40_0113_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3514] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output;
     VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3514_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue := VAR_inc_uxn_opcodes_h_l2879_c40_0113_return_output;
     -- inc2[uxn_opcodes_h_l2880_c40_fda2] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2880_c40_fda2_phase <= VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_phase;
     inc2_uxn_opcodes_h_l2880_c40_fda2_ins <= VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_ins;
     inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_return_output := inc2_uxn_opcodes_h_l2880_c40_fda2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_d1c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_76f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output;
     VAR_pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_76f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue := VAR_inc2_uxn_opcodes_h_l2880_c40_fda2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_cc65] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output;

     -- pop[uxn_opcodes_h_l2881_c40_abec] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2881_c40_abec_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2881_c40_abec_phase <= VAR_pop_uxn_opcodes_h_l2881_c40_abec_phase;
     pop_uxn_opcodes_h_l2881_c40_abec_ins <= VAR_pop_uxn_opcodes_h_l2881_c40_abec_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2881_c40_abec_return_output := pop_uxn_opcodes_h_l2881_c40_abec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_305d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_305d_return_output;
     VAR_pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_cc65_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue := VAR_pop_uxn_opcodes_h_l2881_c40_abec_return_output;
     -- pop2[uxn_opcodes_h_l2882_c40_9567] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2882_c40_9567_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2882_c40_9567_phase <= VAR_pop2_uxn_opcodes_h_l2882_c40_9567_phase;
     pop2_uxn_opcodes_h_l2882_c40_9567_ins <= VAR_pop2_uxn_opcodes_h_l2882_c40_9567_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2882_c40_9567_return_output := pop2_uxn_opcodes_h_l2882_c40_9567_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_81cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_f1d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output;
     VAR_nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_81cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue := VAR_pop2_uxn_opcodes_h_l2882_c40_9567_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_d553] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output;

     -- nip[uxn_opcodes_h_l2883_c40_f03e] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2883_c40_f03e_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2883_c40_f03e_phase <= VAR_nip_uxn_opcodes_h_l2883_c40_f03e_phase;
     nip_uxn_opcodes_h_l2883_c40_f03e_ins <= VAR_nip_uxn_opcodes_h_l2883_c40_f03e_ins;
     nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2883_c40_f03e_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2883_c40_f03e_return_output := nip_uxn_opcodes_h_l2883_c40_f03e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a252] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_d553_return_output;
     VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a252_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue := VAR_nip_uxn_opcodes_h_l2883_c40_f03e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_d86a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_88d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output;

     -- nip2[uxn_opcodes_h_l2884_c40_8cae] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2884_c40_8cae_phase <= VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_phase;
     nip2_uxn_opcodes_h_l2884_c40_8cae_ins <= VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_ins;
     nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_return_output := nip2_uxn_opcodes_h_l2884_c40_8cae_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output;
     VAR_swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_88d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue := VAR_nip2_uxn_opcodes_h_l2884_c40_8cae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_2fb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output;

     -- swp[uxn_opcodes_h_l2885_c40_bdee] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2885_c40_bdee_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2885_c40_bdee_phase <= VAR_swp_uxn_opcodes_h_l2885_c40_bdee_phase;
     swp_uxn_opcodes_h_l2885_c40_bdee_ins <= VAR_swp_uxn_opcodes_h_l2885_c40_bdee_ins;
     swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2885_c40_bdee_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2885_c40_bdee_return_output := swp_uxn_opcodes_h_l2885_c40_bdee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_3fad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_3fad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue := VAR_swp_uxn_opcodes_h_l2885_c40_bdee_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_63c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output;

     -- swp2[uxn_opcodes_h_l2886_c40_4626] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2886_c40_4626_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2886_c40_4626_phase <= VAR_swp2_uxn_opcodes_h_l2886_c40_4626_phase;
     swp2_uxn_opcodes_h_l2886_c40_4626_ins <= VAR_swp2_uxn_opcodes_h_l2886_c40_4626_ins;
     swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2886_c40_4626_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2886_c40_4626_return_output := swp2_uxn_opcodes_h_l2886_c40_4626_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_0f81] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output;
     VAR_rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_0f81_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue := VAR_swp2_uxn_opcodes_h_l2886_c40_4626_return_output;
     -- rot[uxn_opcodes_h_l2887_c40_cfff] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2887_c40_cfff_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2887_c40_cfff_phase <= VAR_rot_uxn_opcodes_h_l2887_c40_cfff_phase;
     rot_uxn_opcodes_h_l2887_c40_cfff_ins <= VAR_rot_uxn_opcodes_h_l2887_c40_cfff_ins;
     rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2887_c40_cfff_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2887_c40_cfff_return_output := rot_uxn_opcodes_h_l2887_c40_cfff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_4fba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_4a1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output;
     VAR_rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_4fba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue := VAR_rot_uxn_opcodes_h_l2887_c40_cfff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_17e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output;

     -- rot2[uxn_opcodes_h_l2888_c40_320b] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2888_c40_320b_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2888_c40_320b_phase <= VAR_rot2_uxn_opcodes_h_l2888_c40_320b_phase;
     rot2_uxn_opcodes_h_l2888_c40_320b_ins <= VAR_rot2_uxn_opcodes_h_l2888_c40_320b_ins;
     rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2888_c40_320b_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2888_c40_320b_return_output := rot2_uxn_opcodes_h_l2888_c40_320b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_ffad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output;
     VAR_dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_17e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue := VAR_rot2_uxn_opcodes_h_l2888_c40_320b_return_output;
     -- dup[uxn_opcodes_h_l2889_c40_2551] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2889_c40_2551_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2889_c40_2551_phase <= VAR_dup_uxn_opcodes_h_l2889_c40_2551_phase;
     dup_uxn_opcodes_h_l2889_c40_2551_ins <= VAR_dup_uxn_opcodes_h_l2889_c40_2551_ins;
     dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2889_c40_2551_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2889_c40_2551_return_output := dup_uxn_opcodes_h_l2889_c40_2551_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_eb30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_80a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output;
     VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_80a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue := VAR_dup_uxn_opcodes_h_l2889_c40_2551_return_output;
     -- dup2[uxn_opcodes_h_l2890_c40_1e67] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2890_c40_1e67_phase <= VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_phase;
     dup2_uxn_opcodes_h_l2890_c40_1e67_ins <= VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_ins;
     dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_return_output := dup2_uxn_opcodes_h_l2890_c40_1e67_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_8649] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_73eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_8649_return_output;
     VAR_ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_73eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue := VAR_dup2_uxn_opcodes_h_l2890_c40_1e67_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_b006] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output;

     -- ovr[uxn_opcodes_h_l2891_c40_1911] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2891_c40_1911_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2891_c40_1911_phase <= VAR_ovr_uxn_opcodes_h_l2891_c40_1911_phase;
     ovr_uxn_opcodes_h_l2891_c40_1911_ins <= VAR_ovr_uxn_opcodes_h_l2891_c40_1911_ins;
     ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2891_c40_1911_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2891_c40_1911_return_output := ovr_uxn_opcodes_h_l2891_c40_1911_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_5de1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_b006_return_output;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_5de1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue := VAR_ovr_uxn_opcodes_h_l2891_c40_1911_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_79ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output;

     -- ovr2[uxn_opcodes_h_l2892_c40_8e48] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2892_c40_8e48_phase <= VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_phase;
     ovr2_uxn_opcodes_h_l2892_c40_8e48_ins <= VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_ins;
     ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output := ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_f727] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output;
     VAR_equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_f727_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue := VAR_ovr2_uxn_opcodes_h_l2892_c40_8e48_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_9701] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_d8c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output;

     -- equ[uxn_opcodes_h_l2893_c40_f107] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2893_c40_f107_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2893_c40_f107_phase <= VAR_equ_uxn_opcodes_h_l2893_c40_f107_phase;
     equ_uxn_opcodes_h_l2893_c40_f107_ins <= VAR_equ_uxn_opcodes_h_l2893_c40_f107_ins;
     equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2893_c40_f107_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2893_c40_f107_return_output := equ_uxn_opcodes_h_l2893_c40_f107_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_9701_return_output;
     VAR_equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_d8c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue := VAR_equ_uxn_opcodes_h_l2893_c40_f107_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_e6f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output;

     -- equ2[uxn_opcodes_h_l2894_c40_a424] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2894_c40_a424_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2894_c40_a424_phase <= VAR_equ2_uxn_opcodes_h_l2894_c40_a424_phase;
     equ2_uxn_opcodes_h_l2894_c40_a424_ins <= VAR_equ2_uxn_opcodes_h_l2894_c40_a424_ins;
     equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2894_c40_a424_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2894_c40_a424_return_output := equ2_uxn_opcodes_h_l2894_c40_a424_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_5303] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_5303_return_output;
     VAR_neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_e6f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue := VAR_equ2_uxn_opcodes_h_l2894_c40_a424_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_3725] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_73e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output;

     -- neq[uxn_opcodes_h_l2895_c40_e302] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2895_c40_e302_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2895_c40_e302_phase <= VAR_neq_uxn_opcodes_h_l2895_c40_e302_phase;
     neq_uxn_opcodes_h_l2895_c40_e302_ins <= VAR_neq_uxn_opcodes_h_l2895_c40_e302_ins;
     neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2895_c40_e302_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2895_c40_e302_return_output := neq_uxn_opcodes_h_l2895_c40_e302_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output;
     VAR_neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_3725_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue := VAR_neq_uxn_opcodes_h_l2895_c40_e302_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_dabc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_4051] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output;

     -- neq2[uxn_opcodes_h_l2896_c40_536c] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2896_c40_536c_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2896_c40_536c_phase <= VAR_neq2_uxn_opcodes_h_l2896_c40_536c_phase;
     neq2_uxn_opcodes_h_l2896_c40_536c_ins <= VAR_neq2_uxn_opcodes_h_l2896_c40_536c_ins;
     neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2896_c40_536c_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2896_c40_536c_return_output := neq2_uxn_opcodes_h_l2896_c40_536c_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output;
     VAR_gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_4051_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue := VAR_neq2_uxn_opcodes_h_l2896_c40_536c_return_output;
     -- gth[uxn_opcodes_h_l2897_c40_e249] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2897_c40_e249_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2897_c40_e249_phase <= VAR_gth_uxn_opcodes_h_l2897_c40_e249_phase;
     gth_uxn_opcodes_h_l2897_c40_e249_ins <= VAR_gth_uxn_opcodes_h_l2897_c40_e249_ins;
     gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2897_c40_e249_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2897_c40_e249_return_output := gth_uxn_opcodes_h_l2897_c40_e249_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_8446] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_0994] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_0994_return_output;
     VAR_gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_8446_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue := VAR_gth_uxn_opcodes_h_l2897_c40_e249_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_08b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output;

     -- gth2[uxn_opcodes_h_l2898_c40_1326] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2898_c40_1326_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2898_c40_1326_phase <= VAR_gth2_uxn_opcodes_h_l2898_c40_1326_phase;
     gth2_uxn_opcodes_h_l2898_c40_1326_ins <= VAR_gth2_uxn_opcodes_h_l2898_c40_1326_ins;
     gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2898_c40_1326_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2898_c40_1326_return_output := gth2_uxn_opcodes_h_l2898_c40_1326_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_94c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output;
     VAR_lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_94c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue := VAR_gth2_uxn_opcodes_h_l2898_c40_1326_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_9392] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output;

     -- lth[uxn_opcodes_h_l2899_c40_d47c] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2899_c40_d47c_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2899_c40_d47c_phase <= VAR_lth_uxn_opcodes_h_l2899_c40_d47c_phase;
     lth_uxn_opcodes_h_l2899_c40_d47c_ins <= VAR_lth_uxn_opcodes_h_l2899_c40_d47c_ins;
     lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2899_c40_d47c_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2899_c40_d47c_return_output := lth_uxn_opcodes_h_l2899_c40_d47c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_5095] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_9392_return_output;
     VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_5095_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue := VAR_lth_uxn_opcodes_h_l2899_c40_d47c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f0c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output;

     -- lth2[uxn_opcodes_h_l2900_c40_6cf1] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2900_c40_6cf1_phase <= VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_phase;
     lth2_uxn_opcodes_h_l2900_c40_6cf1_ins <= VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_ins;
     lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output := lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_d382] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_d382_return_output;
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f0c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue := VAR_lth2_uxn_opcodes_h_l2900_c40_6cf1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_5f85] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_3fa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output;

     -- jmp[uxn_opcodes_h_l2901_c40_122c] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2901_c40_122c_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2901_c40_122c_phase <= VAR_jmp_uxn_opcodes_h_l2901_c40_122c_phase;
     jmp_uxn_opcodes_h_l2901_c40_122c_ins <= VAR_jmp_uxn_opcodes_h_l2901_c40_122c_ins;
     jmp_uxn_opcodes_h_l2901_c40_122c_pc <= VAR_jmp_uxn_opcodes_h_l2901_c40_122c_pc;
     jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2901_c40_122c_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2901_c40_122c_return_output := jmp_uxn_opcodes_h_l2901_c40_122c_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_3fa1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue := VAR_jmp_uxn_opcodes_h_l2901_c40_122c_return_output;
     -- jmp2[uxn_opcodes_h_l2902_c40_8ac2] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase <= VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_phase;
     jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins <= VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_ins;
     jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output := jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_a31e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_0be2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output;
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_0be2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue := VAR_jmp2_uxn_opcodes_h_l2902_c40_8ac2_return_output;
     -- jcn[uxn_opcodes_h_l2903_c40_9f86] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2903_c40_9f86_phase <= VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_phase;
     jcn_uxn_opcodes_h_l2903_c40_9f86_ins <= VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_ins;
     jcn_uxn_opcodes_h_l2903_c40_9f86_pc <= VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_pc;
     jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_return_output := jcn_uxn_opcodes_h_l2903_c40_9f86_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_c109] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_8af8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_c109_return_output;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8af8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue := VAR_jcn_uxn_opcodes_h_l2903_c40_9f86_return_output;
     -- jcn2[uxn_opcodes_h_l2904_c40_f826] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2904_c40_f826_phase <= VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_phase;
     jcn2_uxn_opcodes_h_l2904_c40_f826_ins <= VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_ins;
     jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_return_output := jcn2_uxn_opcodes_h_l2904_c40_f826_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_c135] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_a2dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output;
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c135_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue := VAR_jcn2_uxn_opcodes_h_l2904_c40_f826_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d2c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output;

     -- jsr[uxn_opcodes_h_l2905_c40_ae9f] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2905_c40_ae9f_phase <= VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_phase;
     jsr_uxn_opcodes_h_l2905_c40_ae9f_ins <= VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_ins;
     jsr_uxn_opcodes_h_l2905_c40_ae9f_pc <= VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_pc;
     jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output := jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_b0a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b0a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue := VAR_jsr_uxn_opcodes_h_l2905_c40_ae9f_return_output;
     -- jsr2[uxn_opcodes_h_l2906_c40_7ae1] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase <= VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_phase;
     jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins <= VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_ins;
     jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc <= VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_pc;
     jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output := jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_93bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_431f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output;
     VAR_sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_431f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue := VAR_jsr2_uxn_opcodes_h_l2906_c40_7ae1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_ff8f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_2568] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output;

     -- sth[uxn_opcodes_h_l2907_c40_1199] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2907_c40_1199_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2907_c40_1199_phase <= VAR_sth_uxn_opcodes_h_l2907_c40_1199_phase;
     sth_uxn_opcodes_h_l2907_c40_1199_ins <= VAR_sth_uxn_opcodes_h_l2907_c40_1199_ins;
     sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2907_c40_1199_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2907_c40_1199_return_output := sth_uxn_opcodes_h_l2907_c40_1199_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output;
     VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_2568_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue := VAR_sth_uxn_opcodes_h_l2907_c40_1199_return_output;
     -- sth2[uxn_opcodes_h_l2908_c40_eac8] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2908_c40_eac8_phase <= VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_phase;
     sth2_uxn_opcodes_h_l2908_c40_eac8_ins <= VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_ins;
     sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_return_output := sth2_uxn_opcodes_h_l2908_c40_eac8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_9fcc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_6513] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output;
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_6513_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue := VAR_sth2_uxn_opcodes_h_l2908_c40_eac8_return_output;
     -- ldz[uxn_opcodes_h_l2909_c40_2bcd] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2909_c40_2bcd_phase <= VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_phase;
     ldz_uxn_opcodes_h_l2909_c40_2bcd_ins <= VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_ins;
     ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_stack_read;
     ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output := ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_02ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0bed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0bed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue := VAR_ldz_uxn_opcodes_h_l2909_c40_2bcd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_5b89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_2571] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output;

     -- ldz2[uxn_opcodes_h_l2910_c40_9cb4] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase <= VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_phase;
     ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins <= VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_ins;
     ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_stack_read;
     ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output := ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_2571_return_output;
     VAR_stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_5b89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue := VAR_ldz2_uxn_opcodes_h_l2910_c40_9cb4_return_output;
     -- stz[uxn_opcodes_h_l2911_c40_f364] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2911_c40_f364_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2911_c40_f364_phase <= VAR_stz_uxn_opcodes_h_l2911_c40_f364_phase;
     stz_uxn_opcodes_h_l2911_c40_f364_ins <= VAR_stz_uxn_opcodes_h_l2911_c40_f364_ins;
     stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2911_c40_f364_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2911_c40_f364_return_output := stz_uxn_opcodes_h_l2911_c40_f364_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_2050] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_942c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_2050_return_output;
     VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_942c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue := VAR_stz_uxn_opcodes_h_l2911_c40_f364_return_output;
     -- stz2[uxn_opcodes_h_l2912_c40_28b7] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2912_c40_28b7_phase <= VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_phase;
     stz2_uxn_opcodes_h_l2912_c40_28b7_ins <= VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_ins;
     stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_return_output := stz2_uxn_opcodes_h_l2912_c40_28b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_4058] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_e7c9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output;
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4058_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue := VAR_stz2_uxn_opcodes_h_l2912_c40_28b7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_da5a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_d511] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output;

     -- ldr[uxn_opcodes_h_l2913_c40_e156] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2913_c40_e156_phase <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_phase;
     ldr_uxn_opcodes_h_l2913_c40_e156_ins <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_ins;
     ldr_uxn_opcodes_h_l2913_c40_e156_pc <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_pc;
     ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_stack_read;
     ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_e156_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2913_c40_e156_return_output := ldr_uxn_opcodes_h_l2913_c40_e156_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_d511_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue := VAR_ldr_uxn_opcodes_h_l2913_c40_e156_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_0d7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_19c1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output;

     -- ldr2[uxn_opcodes_h_l2914_c40_2c4b] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_phase;
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_ins;
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_pc;
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_stack_read;
     ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output := ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output;
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_19c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue := VAR_ldr2_uxn_opcodes_h_l2914_c40_2c4b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_212e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_9918] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output;

     -- str1[uxn_opcodes_h_l2915_c40_01ba] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2915_c40_01ba_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2915_c40_01ba_phase <= VAR_str1_uxn_opcodes_h_l2915_c40_01ba_phase;
     str1_uxn_opcodes_h_l2915_c40_01ba_ins <= VAR_str1_uxn_opcodes_h_l2915_c40_01ba_ins;
     str1_uxn_opcodes_h_l2915_c40_01ba_pc <= VAR_str1_uxn_opcodes_h_l2915_c40_01ba_pc;
     str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2915_c40_01ba_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2915_c40_01ba_return_output := str1_uxn_opcodes_h_l2915_c40_01ba_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_212e_return_output;
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_9918_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue := VAR_str1_uxn_opcodes_h_l2915_c40_01ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_7096] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output;

     -- str2[uxn_opcodes_h_l2916_c40_8555] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2916_c40_8555_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2916_c40_8555_phase <= VAR_str2_uxn_opcodes_h_l2916_c40_8555_phase;
     str2_uxn_opcodes_h_l2916_c40_8555_ins <= VAR_str2_uxn_opcodes_h_l2916_c40_8555_ins;
     str2_uxn_opcodes_h_l2916_c40_8555_pc <= VAR_str2_uxn_opcodes_h_l2916_c40_8555_pc;
     str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2916_c40_8555_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2916_c40_8555_return_output := str2_uxn_opcodes_h_l2916_c40_8555_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_8831] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_7096_return_output;
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_8831_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue := VAR_str2_uxn_opcodes_h_l2916_c40_8555_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_0a94] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output;

     -- lda[uxn_opcodes_h_l2917_c40_5420] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2917_c40_5420_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2917_c40_5420_phase <= VAR_lda_uxn_opcodes_h_l2917_c40_5420_phase;
     lda_uxn_opcodes_h_l2917_c40_5420_ins <= VAR_lda_uxn_opcodes_h_l2917_c40_5420_ins;
     lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_stack_read;
     lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2917_c40_5420_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2917_c40_5420_return_output := lda_uxn_opcodes_h_l2917_c40_5420_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_75b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output;
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_75b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue := VAR_lda_uxn_opcodes_h_l2917_c40_5420_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_7317] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output;

     -- lda2[uxn_opcodes_h_l2918_c40_1389] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2918_c40_1389_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2918_c40_1389_phase <= VAR_lda2_uxn_opcodes_h_l2918_c40_1389_phase;
     lda2_uxn_opcodes_h_l2918_c40_1389_ins <= VAR_lda2_uxn_opcodes_h_l2918_c40_1389_ins;
     lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_stack_read;
     lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_1389_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2918_c40_1389_return_output := lda2_uxn_opcodes_h_l2918_c40_1389_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_d70b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output;
     VAR_sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_7317_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue := VAR_lda2_uxn_opcodes_h_l2918_c40_1389_return_output;
     -- sta[uxn_opcodes_h_l2919_c40_f889] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2919_c40_f889_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2919_c40_f889_phase <= VAR_sta_uxn_opcodes_h_l2919_c40_f889_phase;
     sta_uxn_opcodes_h_l2919_c40_f889_ins <= VAR_sta_uxn_opcodes_h_l2919_c40_f889_ins;
     sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2919_c40_f889_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2919_c40_f889_return_output := sta_uxn_opcodes_h_l2919_c40_f889_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_f4fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_79bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output;
     VAR_sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_f4fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue := VAR_sta_uxn_opcodes_h_l2919_c40_f889_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_3985] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f83a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output;

     -- sta2[uxn_opcodes_h_l2920_c40_9394] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2920_c40_9394_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2920_c40_9394_phase <= VAR_sta2_uxn_opcodes_h_l2920_c40_9394_phase;
     sta2_uxn_opcodes_h_l2920_c40_9394_ins <= VAR_sta2_uxn_opcodes_h_l2920_c40_9394_ins;
     sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2920_c40_9394_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2920_c40_9394_return_output := sta2_uxn_opcodes_h_l2920_c40_9394_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_3985_return_output;
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f83a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue := VAR_sta2_uxn_opcodes_h_l2920_c40_9394_return_output;
     -- dei[uxn_opcodes_h_l2921_c40_3ec8] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2921_c40_3ec8_phase <= VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_phase;
     dei_uxn_opcodes_h_l2921_c40_3ec8_ins <= VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_ins;
     dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_stack_read;
     dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_return_output := dei_uxn_opcodes_h_l2921_c40_3ec8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_b1f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_d3c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output;
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_d3c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue := VAR_dei_uxn_opcodes_h_l2921_c40_3ec8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_1218] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_453e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output;

     -- dei2[uxn_opcodes_h_l2922_c40_bdff] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2922_c40_bdff_phase <= VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_phase;
     dei2_uxn_opcodes_h_l2922_c40_bdff_ins <= VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_ins;
     dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_stack_read;
     dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_return_output := dei2_uxn_opcodes_h_l2922_c40_bdff_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_1218_return_output;
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_453e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue := VAR_dei2_uxn_opcodes_h_l2922_c40_bdff_return_output;
     -- deo[uxn_opcodes_h_l2923_c40_c98d] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2923_c40_c98d_phase <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_phase;
     deo_uxn_opcodes_h_l2923_c40_c98d_ins <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_ins;
     deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_stack_read;
     deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_device_ram_read;
     deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_c98d_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2923_c40_c98d_return_output := deo_uxn_opcodes_h_l2923_c40_c98d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_9228] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_c79c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output;
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_9228_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue := VAR_deo_uxn_opcodes_h_l2923_c40_c98d_return_output;
     -- deo2[uxn_opcodes_h_l2924_c40_17fd] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2924_c40_17fd_phase <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_phase;
     deo2_uxn_opcodes_h_l2924_c40_17fd_ins <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_ins;
     deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_stack_read;
     deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_return_output := deo2_uxn_opcodes_h_l2924_c40_17fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_0a26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_b740] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output;
     VAR_add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_b740_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue := VAR_deo2_uxn_opcodes_h_l2924_c40_17fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_6223] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_02bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output;

     -- add[uxn_opcodes_h_l2925_c40_adec] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2925_c40_adec_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2925_c40_adec_phase <= VAR_add_uxn_opcodes_h_l2925_c40_adec_phase;
     add_uxn_opcodes_h_l2925_c40_adec_ins <= VAR_add_uxn_opcodes_h_l2925_c40_adec_ins;
     add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read <= VAR_add_uxn_opcodes_h_l2925_c40_adec_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2925_c40_adec_return_output := add_uxn_opcodes_h_l2925_c40_adec_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output;
     VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_6223_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue := VAR_add_uxn_opcodes_h_l2925_c40_adec_return_output;
     -- add2[uxn_opcodes_h_l2926_c40_f1f6] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2926_c40_f1f6_phase <= VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_phase;
     add2_uxn_opcodes_h_l2926_c40_f1f6_ins <= VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_ins;
     add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_return_output := add2_uxn_opcodes_h_l2926_c40_f1f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_6ed8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_c700] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c700_return_output;
     VAR_sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_6ed8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue := VAR_add2_uxn_opcodes_h_l2926_c40_f1f6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_924c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output;

     -- sub[uxn_opcodes_h_l2927_c40_4f42] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2927_c40_4f42_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2927_c40_4f42_phase <= VAR_sub_uxn_opcodes_h_l2927_c40_4f42_phase;
     sub_uxn_opcodes_h_l2927_c40_4f42_ins <= VAR_sub_uxn_opcodes_h_l2927_c40_4f42_ins;
     sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2927_c40_4f42_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2927_c40_4f42_return_output := sub_uxn_opcodes_h_l2927_c40_4f42_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_4df9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output;
     VAR_sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_924c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue := VAR_sub_uxn_opcodes_h_l2927_c40_4f42_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_ba7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output;

     -- sub2[uxn_opcodes_h_l2928_c40_5546] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2928_c40_5546_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2928_c40_5546_phase <= VAR_sub2_uxn_opcodes_h_l2928_c40_5546_phase;
     sub2_uxn_opcodes_h_l2928_c40_5546_ins <= VAR_sub2_uxn_opcodes_h_l2928_c40_5546_ins;
     sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2928_c40_5546_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2928_c40_5546_return_output := sub2_uxn_opcodes_h_l2928_c40_5546_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_5965] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output;
     VAR_mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_5965_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue := VAR_sub2_uxn_opcodes_h_l2928_c40_5546_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_ea33] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output;

     -- mul[uxn_opcodes_h_l2929_c40_1558] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2929_c40_1558_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2929_c40_1558_phase <= VAR_mul_uxn_opcodes_h_l2929_c40_1558_phase;
     mul_uxn_opcodes_h_l2929_c40_1558_ins <= VAR_mul_uxn_opcodes_h_l2929_c40_1558_ins;
     mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2929_c40_1558_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2929_c40_1558_return_output := mul_uxn_opcodes_h_l2929_c40_1558_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_d48a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output;
     VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea33_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue := VAR_mul_uxn_opcodes_h_l2929_c40_1558_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_3d4a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output;

     -- mul2[uxn_opcodes_h_l2930_c40_9fad] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2930_c40_9fad_phase <= VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_phase;
     mul2_uxn_opcodes_h_l2930_c40_9fad_ins <= VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_ins;
     mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_return_output := mul2_uxn_opcodes_h_l2930_c40_9fad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_222c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_222c_return_output;
     VAR_div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_3d4a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue := VAR_mul2_uxn_opcodes_h_l2930_c40_9fad_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_9917] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output;

     -- div[uxn_opcodes_h_l2931_c40_d3df] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2931_c40_d3df_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2931_c40_d3df_phase <= VAR_div_uxn_opcodes_h_l2931_c40_d3df_phase;
     div_uxn_opcodes_h_l2931_c40_d3df_ins <= VAR_div_uxn_opcodes_h_l2931_c40_d3df_ins;
     div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read <= VAR_div_uxn_opcodes_h_l2931_c40_d3df_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2931_c40_d3df_return_output := div_uxn_opcodes_h_l2931_c40_d3df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_1965] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_9917_return_output;
     VAR_div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_1965_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue := VAR_div_uxn_opcodes_h_l2931_c40_d3df_return_output;
     -- div2[uxn_opcodes_h_l2932_c40_33d7] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2932_c40_33d7_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2932_c40_33d7_phase <= VAR_div2_uxn_opcodes_h_l2932_c40_33d7_phase;
     div2_uxn_opcodes_h_l2932_c40_33d7_ins <= VAR_div2_uxn_opcodes_h_l2932_c40_33d7_ins;
     div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2932_c40_33d7_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2932_c40_33d7_return_output := div2_uxn_opcodes_h_l2932_c40_33d7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_035d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_d0f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_035d_return_output;
     VAR_and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_d0f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue := VAR_div2_uxn_opcodes_h_l2932_c40_33d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_8824] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_0877] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output;

     -- and[uxn_opcodes_h_l2933_c40_6fa1] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2933_c40_6fa1_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2933_c40_6fa1_phase <= VAR_and_uxn_opcodes_h_l2933_c40_6fa1_phase;
     and_uxn_opcodes_h_l2933_c40_6fa1_ins <= VAR_and_uxn_opcodes_h_l2933_c40_6fa1_ins;
     and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read <= VAR_and_uxn_opcodes_h_l2933_c40_6fa1_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2933_c40_6fa1_return_output := and_uxn_opcodes_h_l2933_c40_6fa1_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_8824_return_output;
     VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_0877_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue := VAR_and_uxn_opcodes_h_l2933_c40_6fa1_return_output;
     -- and2[uxn_opcodes_h_l2934_c40_8f1f] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2934_c40_8f1f_phase <= VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_phase;
     and2_uxn_opcodes_h_l2934_c40_8f1f_ins <= VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_ins;
     and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_return_output := and2_uxn_opcodes_h_l2934_c40_8f1f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_727e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_c653] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_727e_return_output;
     VAR_ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_c653_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue := VAR_and2_uxn_opcodes_h_l2934_c40_8f1f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_3676] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_6a87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output;

     -- ora[uxn_opcodes_h_l2935_c40_d00c] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2935_c40_d00c_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2935_c40_d00c_phase <= VAR_ora_uxn_opcodes_h_l2935_c40_d00c_phase;
     ora_uxn_opcodes_h_l2935_c40_d00c_ins <= VAR_ora_uxn_opcodes_h_l2935_c40_d00c_ins;
     ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2935_c40_d00c_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2935_c40_d00c_return_output := ora_uxn_opcodes_h_l2935_c40_d00c_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_3676_return_output;
     VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_6a87_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue := VAR_ora_uxn_opcodes_h_l2935_c40_d00c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_57ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output;

     -- ora2[uxn_opcodes_h_l2936_c40_76e2] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2936_c40_76e2_phase <= VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_phase;
     ora2_uxn_opcodes_h_l2936_c40_76e2_ins <= VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_ins;
     ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_return_output := ora2_uxn_opcodes_h_l2936_c40_76e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_b818] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output;
     VAR_eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_b818_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue := VAR_ora2_uxn_opcodes_h_l2936_c40_76e2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_30f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_7815] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output;

     -- eor[uxn_opcodes_h_l2937_c40_8d13] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2937_c40_8d13_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2937_c40_8d13_phase <= VAR_eor_uxn_opcodes_h_l2937_c40_8d13_phase;
     eor_uxn_opcodes_h_l2937_c40_8d13_ins <= VAR_eor_uxn_opcodes_h_l2937_c40_8d13_ins;
     eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2937_c40_8d13_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2937_c40_8d13_return_output := eor_uxn_opcodes_h_l2937_c40_8d13_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output;
     VAR_eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_7815_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue := VAR_eor_uxn_opcodes_h_l2937_c40_8d13_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_0df0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output;

     -- eor2[uxn_opcodes_h_l2938_c40_304f] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2938_c40_304f_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2938_c40_304f_phase <= VAR_eor2_uxn_opcodes_h_l2938_c40_304f_phase;
     eor2_uxn_opcodes_h_l2938_c40_304f_ins <= VAR_eor2_uxn_opcodes_h_l2938_c40_304f_ins;
     eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2938_c40_304f_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2938_c40_304f_return_output := eor2_uxn_opcodes_h_l2938_c40_304f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_9132] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_9132_return_output;
     VAR_sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_0df0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue := VAR_eor2_uxn_opcodes_h_l2938_c40_304f_return_output;
     -- sft[uxn_opcodes_h_l2939_c40_9876] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2939_c40_9876_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2939_c40_9876_phase <= VAR_sft_uxn_opcodes_h_l2939_c40_9876_phase;
     sft_uxn_opcodes_h_l2939_c40_9876_ins <= VAR_sft_uxn_opcodes_h_l2939_c40_9876_ins;
     sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2939_c40_9876_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2939_c40_9876_return_output := sft_uxn_opcodes_h_l2939_c40_9876_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_4bb9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_4bb9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue := VAR_sft_uxn_opcodes_h_l2939_c40_9876_return_output;
     -- sft2[uxn_opcodes_h_l2940_c40_2bc2] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2940_c40_2bc2_phase <= VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_phase;
     sft2_uxn_opcodes_h_l2940_c40_2bc2_ins <= VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_ins;
     sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output := sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue := VAR_sft2_uxn_opcodes_h_l2940_c40_2bc2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_9132] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_9132_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_30f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_30f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_57ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_57ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_3676] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_3676_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_727e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_727e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_8824] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_8824_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_035d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_035d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_9917] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_9917_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_222c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_222c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_d48a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_d48a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_ba7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_ba7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_4df9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_4df9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_c700] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c700_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_02bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_02bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_0a26] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_0a26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_c79c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_c79c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_1218] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_1218_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_b1f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_b1f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_3985] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_3985_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_79bb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_79bb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_d70b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d70b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_0a94] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_0a94_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_7096] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_7096_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_212e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_212e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_0d7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_0d7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_da5a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_da5a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_e7c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_e7c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_2050] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_2050_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_2571] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_2571_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_02ea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_02ea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_9fcc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_9fcc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_ff8f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_ff8f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_93bb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_93bb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_d2c1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d2c1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_a2dd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_a2dd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_c109] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_c109_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_a31e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_a31e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_5f85] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_5f85_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_d382] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_d382_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_9392] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_9392_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_08b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_08b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_0994] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_0994_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_dabc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_dabc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_73e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_73e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_5303] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_5303_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_9701] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_9701_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_79ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_79ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_b006] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_b006_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_8649] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_8649_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_eb30] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_eb30_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_ffad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_ffad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_4a1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_4a1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_63c9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_63c9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_2fb0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_2fb0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_d86a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_d86a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_d553] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_d553_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_f1d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_f1d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_305d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_305d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_d1c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_d1c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_bd91] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_bd91_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_a90c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a90c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_1608] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1608_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_6a10] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6a10_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_1635] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_1635_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_5501] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_5501_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_be19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_be19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_ef80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_ef80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_0bb5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_0bb5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_b68b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_b68b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c2_147f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2943_c17_abcc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_abcc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2963_c34_b556] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_b556_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_37bf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_37bf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2951_c68_1d8d] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_1d8d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2962_c40_f32d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_f32d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_967e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_967e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2957_c3_3ffe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_3ffe_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2966_c34_7378] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_7378_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2964_c30_540f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_540f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2967_c37_5333] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_5333_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2965_c33_6930] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_6930_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2969_c32_b865] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_b865_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2961_c39_985f] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_985f_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_147f_return_output.device_ram_address;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_abcc_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_3ffe_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_37bf_return_output;
     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_f54b LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_f54b_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_967e_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_713b LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_713b_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_147f_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_985f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_f32d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_b556_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_540f_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_6930_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_7378_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_5333_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_37bf_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_b865_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_360e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_left;
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output := BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c58_1d00] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_1d00_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_1d8d_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_360e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_f54b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_f54b_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_1d00_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_713b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_713b_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_73c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_cbec] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output;

     -- MUX[uxn_opcodes_h_l2952_c20_3c46] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c20_3c46_cond <= VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_cond;
     MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iftrue;
     MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_return_output := MUX_uxn_opcodes_h_l2952_c20_3c46_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2946_c3_e553 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_73c8_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2948_c3_a849 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_cbec_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right := VAR_MUX_uxn_opcodes_h_l2952_c20_3c46_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse := VAR_sp0_uxn_opcodes_h_l2948_c3_a849;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue := VAR_sp1_uxn_opcodes_h_l2946_c3_e553;
     -- sp0_MUX[uxn_opcodes_h_l2945_c2_e003] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_cond;
     sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue;
     sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output := sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2945_c2_e003] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_cond;
     sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iftrue;
     sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output := sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;
     VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_e003_return_output;
     -- MUX[uxn_opcodes_h_l2951_c29_ba8d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2951_c29_ba8d_cond <= VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_cond;
     MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue <= VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iftrue;
     MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse <= VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output := MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c19_e9d8] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_e9d8_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2951_c29_ba8d_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_e9d8_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_0843] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_0843_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_060c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2952_c2_9f6a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_060c_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_9f6a;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_9f6a;
     -- stack_ram_update[uxn_opcodes_h_l2954_c24_b2c4] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_stack_address;
     stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_value;
     stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output := stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_b2c4_return_output;
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
