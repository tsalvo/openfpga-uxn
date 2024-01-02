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
-- BIN_OP_AND[uxn_opcodes_h_l2863_c14_0775]
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_5d35]
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2864_c14_b334]
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_2c84]
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_1ab1]
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2864_c14_d78a]
signal MUX_uxn_opcodes_h_l2864_c14_d78a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_d78a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c8_5a2b]
signal MUX_uxn_opcodes_h_l2865_c8_5a2b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_f2cb]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_72c1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2871_c2_f554]
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c2_f554]
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2871_c48_0de0]
signal brk_uxn_opcodes_h_l2871_c48_0de0_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2871_c48_0de0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_364a]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_2072]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_a425]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_72c1]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2872_c40_92bd]
signal jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_92bd_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_92bd_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_92bd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_c302]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_13e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_5dad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_a425]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2873_c40_48ef]
signal jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_48ef_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_48ef_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_48ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_b667]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_3b41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f385]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_5dad]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2874_c40_f1e8]
signal jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_f1e8_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_f1e8_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_cac9]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_e875]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_93fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_f385]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2875_c40_d60b]
signal lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_d60b_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_d60b_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_d60b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_809a]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_0db0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_f6e1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_93fc]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2876_c40_db64]
signal lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_db64_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_db64_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_db64_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_35c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_433e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_af6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_f6e1]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_9a89]
signal lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_9a89_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_9a89_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_9a89_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_7bde]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_f309]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_6648]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_af6a]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_5e27]
signal lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_5e27_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_5e27_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_5e27_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_f77c]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_4abf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_a2c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_6648]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2879_c40_08e3]
signal inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_08e3_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_08e3_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_08e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_77fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_839e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_2731]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_a2c2]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2880_c40_2e1a]
signal inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_2e1a_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_2e1a_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_0fe5]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_cbbc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_5890]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_2731]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2881_c40_ed1a]
signal pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_ed1a_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_ed1a_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_ed1a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_510e]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_15d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_6614]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_5890]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2882_c40_1c81]
signal pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_1c81_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_1c81_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_1c81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_1450]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_b952]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_315e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_6614]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2883_c40_9675]
signal nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_9675_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_9675_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_9675_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_1c5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_56c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_7d1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_315e]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2884_c40_978d]
signal nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_978d_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_978d_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_978d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_83f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_b679]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_161b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_7d1a]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2885_c40_4de6]
signal swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_4de6_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_4de6_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_4de6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_c92e]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_eb49]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_5fa9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_161b]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2886_c40_4a37]
signal swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4a37_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4a37_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_4a37_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_5a2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_b7da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_2d36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_5fa9]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2887_c40_2571]
signal rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_2571_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_2571_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_2571_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_8c9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_b4b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_66eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_2d36]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2888_c40_359a]
signal rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_359a_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_359a_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_359a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5913]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_4b1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_b168]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_66eb]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2889_c40_e28c]
signal dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_e28c_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_e28c_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_e28c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_02c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_dc58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_2dfe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_b168]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2890_c40_0edc]
signal dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0edc_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0edc_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_0edc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_13de]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_f0b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_771f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_2dfe]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2891_c40_b079]
signal ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_b079_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_b079_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_b079_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_cfec]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_b149]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_2fdb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_771f]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2892_c40_d137]
signal ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_d137_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_d137_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_d137_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_063a]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_4a50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_0fa9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_2fdb]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2893_c40_e5ef]
signal equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_e5ef_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_e5ef_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_e5ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_202e]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_fbff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_15e5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_0fa9]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2894_c40_7764]
signal equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_7764_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_7764_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_7764_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f0a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_df8d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_89a0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_15e5]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2895_c40_63d1]
signal neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_63d1_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_63d1_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_63d1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_7ebe]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_6946]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_ad3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_89a0]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2896_c40_da71]
signal neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_da71_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_da71_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_da71_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_f381]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_8592]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_54c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_ad3d]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2897_c40_63b1]
signal gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_63b1_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_63b1_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_63b1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_9d32]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_af60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_9269]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_54c6]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2898_c40_0ef0]
signal gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_0ef0_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_0ef0_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_d35c]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_7772]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_9c1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_9269]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2899_c40_0f2e]
signal lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_0f2e_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_0f2e_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_0f2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_52b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_c9b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_4d69]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_9c1f]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2900_c40_9209]
signal lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_9209_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_9209_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_9209_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_7a0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f94d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e885]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_4d69]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2901_c40_801b]
signal jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_801b_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_801b_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_801b_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_801b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_e4de]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_5ae9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_e2d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_e885]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2902_c40_fd83]
signal jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_fd83_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_fd83_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_1b79]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_1fd0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_1c99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_e2d7]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2903_c40_394d]
signal jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_394d_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_394d_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_394d_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_394d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_8805]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_d7e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_f987]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_1c99]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2904_c40_8ed4]
signal jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_3c04]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_6ecd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_c2be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_f987]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2905_c40_82b0]
signal jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_82b0_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_82b0_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_82b0_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_82b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_559d]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_6823]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_369a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_c2be]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2906_c40_3b2e]
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_962d]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_b200]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_982e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_369a]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2907_c40_90ef]
signal sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_90ef_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_90ef_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_90ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_54cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_13d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_b3d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_982e]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2908_c40_32dc]
signal sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_32dc_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_32dc_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_32dc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_6f7c]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_5af3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_162c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_b3d5]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2909_c40_6d79]
signal ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_6d79_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_6d79_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_6d79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_7e95]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0b03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_571b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_162c]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2910_c40_03fe]
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_8301]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_d1b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_786f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_571b]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2911_c40_a7bb]
signal stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_a7bb_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_a7bb_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_a7bb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_a80c]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_f9a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_9c83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_786f]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2912_c40_c44e]
signal stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_c44e_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_c44e_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_c44e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_b40c]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_e1fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_987d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_9c83]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2913_c40_7dc0]
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_57cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_b926]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_8b05]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_987d]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2914_c40_228e]
signal ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_228e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_61e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_107d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_a1b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_8b05]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2915_c40_8eee]
signal str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_8eee_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_8eee_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_8eee_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_8eee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_c8f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_2c19]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_2128]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_a1b7]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2916_c40_bc16]
signal str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_bc16_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_bc16_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_bc16_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_bc16_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_42ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7818]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_a928]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_2128]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2917_c40_0cc6]
signal lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_0cc6_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_0cc6_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_0cc6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_8728]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_9df6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_c545]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_a928]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2918_c40_3c0d]
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_ff44]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_8357]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_bda3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_c545]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2919_c40_1eee]
signal sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_1eee_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_1eee_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_1eee_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_97a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_c6b1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_992e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_bda3]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2920_c40_80a8]
signal sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_80a8_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_80a8_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_80a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_610e]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f290]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_0d4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_992e]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2921_c40_b717]
signal dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_b717_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_b717_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_b717_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_ea24]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_f194]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_6879]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_0d4d]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2922_c40_68d4]
signal dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_68d4_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_68d4_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_68d4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c665]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_89df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_fd02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_6879]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2923_c40_0529]
signal deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_0529_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_137c]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2226]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_dc80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_fd02]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2924_c40_c4f4]
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_9bff]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_facd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_5fdb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_dc80]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2925_c40_32b6]
signal add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2925_c40_32b6_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_32b6_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_32b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_59a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_9917]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_586f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_5fdb]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2926_c40_1e65]
signal add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_1e65_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_1e65_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_1e65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_af61]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_1f6e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e7e2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_586f]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2927_c40_5857]
signal sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_5857_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_5857_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_5857_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_506f]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_21d1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_3a23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_e7e2]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2928_c40_ce79]
signal sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_ce79_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_ce79_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_ce79_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_bd0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_8ae2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_1294]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_3a23]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2929_c40_f9bf]
signal mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_f9bf_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_f9bf_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_f9bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_6bc9]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_ea1d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_ac19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_1294]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2930_c40_24d5]
signal mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_24d5_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_24d5_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_24d5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_7727]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_e8c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_91ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_ac19]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2931_c40_9810]
signal div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2931_c40_9810_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_9810_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_9810_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_612f]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_21e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_b5bd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_91ce]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2932_c40_7769]
signal div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_7769_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_7769_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_7769_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_5d2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b245]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a682]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_b5bd]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2933_c40_f2ab]
signal and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2933_c40_f2ab_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_f2ab_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_f2ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_afa3]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_f55c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_0d07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_a682]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2934_c40_343e]
signal and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_343e_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_343e_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_343e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_3eea]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_f3b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_509b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_0d07]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2935_c40_9289]
signal ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_9289_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_9289_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_9289_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_49bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_11ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_6cbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_509b]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2936_c40_fb57]
signal ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_fb57_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_fb57_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_fb57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_b3e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_242d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_fa79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_6cbe]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2937_c40_e1df]
signal eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_e1df_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_e1df_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_e1df_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_6386]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_1f27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_941d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_fa79]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2938_c40_d05f]
signal eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d05f_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d05f_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_d05f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_f8d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_5998]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_95f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_941d]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2939_c40_6052]
signal sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_6052_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_6052_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_6052_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_64ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_c8a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_95f5]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2940_c40_331d]
signal sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_331d_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_331d_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_331d_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2942_c16_17e6]
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_132a]
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2945_c2_3380]
signal sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2945_c2_3380]
signal sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_978b]
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_ca9a]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2951_c29_6335]
signal MUX_uxn_opcodes_h_l2951_c29_6335_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_6335_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_6335_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_6335_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_6d9b]
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2952_c20_f785]
signal MUX_uxn_opcodes_h_l2952_c20_f785_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_f785_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_f785_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_f785_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_b214]
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2954_c24_7fe1]
signal stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775
BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334
BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output);

-- MUX_uxn_opcodes_h_l2864_c14_d78a
MUX_uxn_opcodes_h_l2864_c14_d78a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2864_c14_d78a_cond,
MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue,
MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse,
MUX_uxn_opcodes_h_l2864_c14_d78a_return_output);

-- MUX_uxn_opcodes_h_l2865_c8_5a2b
MUX_uxn_opcodes_h_l2865_c8_5a2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c8_5a2b_cond,
MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue,
MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse,
MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2871_c2_f554
is_wait_MUX_uxn_opcodes_h_l2871_c2_f554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond,
is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue,
is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse,
is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c2_f554
opc_result_MUX_uxn_opcodes_h_l2871_c2_f554 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output);

-- brk_uxn_opcodes_h_l2871_c48_0de0
brk_uxn_opcodes_h_l2871_c48_0de0 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2871_c48_0de0_phase,
brk_uxn_opcodes_h_l2871_c48_0de0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1
opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output);

-- jci_uxn_opcodes_h_l2872_c40_92bd
jci_uxn_opcodes_h_l2872_c40_92bd : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2872_c40_92bd_phase,
jci_uxn_opcodes_h_l2872_c40_92bd_pc,
jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read,
jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read,
jci_uxn_opcodes_h_l2872_c40_92bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_a425
opc_result_MUX_uxn_opcodes_h_l2873_c7_a425 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output);

-- jmi_uxn_opcodes_h_l2873_c40_48ef
jmi_uxn_opcodes_h_l2873_c40_48ef : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2873_c40_48ef_phase,
jmi_uxn_opcodes_h_l2873_c40_48ef_pc,
jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read,
jmi_uxn_opcodes_h_l2873_c40_48ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad
opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output);

-- jsi_uxn_opcodes_h_l2874_c40_f1e8
jsi_uxn_opcodes_h_l2874_c40_f1e8 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2874_c40_f1e8_phase,
jsi_uxn_opcodes_h_l2874_c40_f1e8_pc,
jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read,
jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_f385
opc_result_MUX_uxn_opcodes_h_l2875_c7_f385 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output);

-- lit_uxn_opcodes_h_l2875_c40_d60b
lit_uxn_opcodes_h_l2875_c40_d60b : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2875_c40_d60b_phase,
lit_uxn_opcodes_h_l2875_c40_d60b_pc,
lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read,
lit_uxn_opcodes_h_l2875_c40_d60b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc
opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output);

-- lit2_uxn_opcodes_h_l2876_c40_db64
lit2_uxn_opcodes_h_l2876_c40_db64 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2876_c40_db64_phase,
lit2_uxn_opcodes_h_l2876_c40_db64_pc,
lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read,
lit2_uxn_opcodes_h_l2876_c40_db64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1
opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output);

-- lit_uxn_opcodes_h_l2877_c40_9a89
lit_uxn_opcodes_h_l2877_c40_9a89 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_9a89_phase,
lit_uxn_opcodes_h_l2877_c40_9a89_pc,
lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_9a89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a
opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_5e27
lit2_uxn_opcodes_h_l2878_c40_5e27 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_5e27_phase,
lit2_uxn_opcodes_h_l2878_c40_5e27_pc,
lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_5e27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_6648
opc_result_MUX_uxn_opcodes_h_l2879_c7_6648 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output);

-- inc_uxn_opcodes_h_l2879_c40_08e3
inc_uxn_opcodes_h_l2879_c40_08e3 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2879_c40_08e3_phase,
inc_uxn_opcodes_h_l2879_c40_08e3_ins,
inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read,
inc_uxn_opcodes_h_l2879_c40_08e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2
opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output);

-- inc2_uxn_opcodes_h_l2880_c40_2e1a
inc2_uxn_opcodes_h_l2880_c40_2e1a : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2880_c40_2e1a_phase,
inc2_uxn_opcodes_h_l2880_c40_2e1a_ins,
inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read,
inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_2731
opc_result_MUX_uxn_opcodes_h_l2881_c7_2731 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output);

-- pop_uxn_opcodes_h_l2881_c40_ed1a
pop_uxn_opcodes_h_l2881_c40_ed1a : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2881_c40_ed1a_phase,
pop_uxn_opcodes_h_l2881_c40_ed1a_ins,
pop_uxn_opcodes_h_l2881_c40_ed1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_5890
opc_result_MUX_uxn_opcodes_h_l2882_c7_5890 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output);

-- pop2_uxn_opcodes_h_l2882_c40_1c81
pop2_uxn_opcodes_h_l2882_c40_1c81 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2882_c40_1c81_phase,
pop2_uxn_opcodes_h_l2882_c40_1c81_ins,
pop2_uxn_opcodes_h_l2882_c40_1c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_6614
opc_result_MUX_uxn_opcodes_h_l2883_c7_6614 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output);

-- nip_uxn_opcodes_h_l2883_c40_9675
nip_uxn_opcodes_h_l2883_c40_9675 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2883_c40_9675_phase,
nip_uxn_opcodes_h_l2883_c40_9675_ins,
nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read,
nip_uxn_opcodes_h_l2883_c40_9675_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_315e
opc_result_MUX_uxn_opcodes_h_l2884_c7_315e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output);

-- nip2_uxn_opcodes_h_l2884_c40_978d
nip2_uxn_opcodes_h_l2884_c40_978d : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2884_c40_978d_phase,
nip2_uxn_opcodes_h_l2884_c40_978d_ins,
nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read,
nip2_uxn_opcodes_h_l2884_c40_978d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a
opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output);

-- swp_uxn_opcodes_h_l2885_c40_4de6
swp_uxn_opcodes_h_l2885_c40_4de6 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2885_c40_4de6_phase,
swp_uxn_opcodes_h_l2885_c40_4de6_ins,
swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read,
swp_uxn_opcodes_h_l2885_c40_4de6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_161b
opc_result_MUX_uxn_opcodes_h_l2886_c7_161b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output);

-- swp2_uxn_opcodes_h_l2886_c40_4a37
swp2_uxn_opcodes_h_l2886_c40_4a37 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2886_c40_4a37_phase,
swp2_uxn_opcodes_h_l2886_c40_4a37_ins,
swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read,
swp2_uxn_opcodes_h_l2886_c40_4a37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9
opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output);

-- rot_uxn_opcodes_h_l2887_c40_2571
rot_uxn_opcodes_h_l2887_c40_2571 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2887_c40_2571_phase,
rot_uxn_opcodes_h_l2887_c40_2571_ins,
rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read,
rot_uxn_opcodes_h_l2887_c40_2571_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36
opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output);

-- rot2_uxn_opcodes_h_l2888_c40_359a
rot2_uxn_opcodes_h_l2888_c40_359a : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2888_c40_359a_phase,
rot2_uxn_opcodes_h_l2888_c40_359a_ins,
rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read,
rot2_uxn_opcodes_h_l2888_c40_359a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb
opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output);

-- dup_uxn_opcodes_h_l2889_c40_e28c
dup_uxn_opcodes_h_l2889_c40_e28c : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2889_c40_e28c_phase,
dup_uxn_opcodes_h_l2889_c40_e28c_ins,
dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read,
dup_uxn_opcodes_h_l2889_c40_e28c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_b168
opc_result_MUX_uxn_opcodes_h_l2890_c7_b168 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output);

-- dup2_uxn_opcodes_h_l2890_c40_0edc
dup2_uxn_opcodes_h_l2890_c40_0edc : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2890_c40_0edc_phase,
dup2_uxn_opcodes_h_l2890_c40_0edc_ins,
dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read,
dup2_uxn_opcodes_h_l2890_c40_0edc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe
opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output);

-- ovr_uxn_opcodes_h_l2891_c40_b079
ovr_uxn_opcodes_h_l2891_c40_b079 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2891_c40_b079_phase,
ovr_uxn_opcodes_h_l2891_c40_b079_ins,
ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read,
ovr_uxn_opcodes_h_l2891_c40_b079_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_771f
opc_result_MUX_uxn_opcodes_h_l2892_c7_771f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output);

-- ovr2_uxn_opcodes_h_l2892_c40_d137
ovr2_uxn_opcodes_h_l2892_c40_d137 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2892_c40_d137_phase,
ovr2_uxn_opcodes_h_l2892_c40_d137_ins,
ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read,
ovr2_uxn_opcodes_h_l2892_c40_d137_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb
opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output);

-- equ_uxn_opcodes_h_l2893_c40_e5ef
equ_uxn_opcodes_h_l2893_c40_e5ef : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2893_c40_e5ef_phase,
equ_uxn_opcodes_h_l2893_c40_e5ef_ins,
equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read,
equ_uxn_opcodes_h_l2893_c40_e5ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9
opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output);

-- equ2_uxn_opcodes_h_l2894_c40_7764
equ2_uxn_opcodes_h_l2894_c40_7764 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2894_c40_7764_phase,
equ2_uxn_opcodes_h_l2894_c40_7764_ins,
equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read,
equ2_uxn_opcodes_h_l2894_c40_7764_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5
opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output);

-- neq_uxn_opcodes_h_l2895_c40_63d1
neq_uxn_opcodes_h_l2895_c40_63d1 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2895_c40_63d1_phase,
neq_uxn_opcodes_h_l2895_c40_63d1_ins,
neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read,
neq_uxn_opcodes_h_l2895_c40_63d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0
opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output);

-- neq2_uxn_opcodes_h_l2896_c40_da71
neq2_uxn_opcodes_h_l2896_c40_da71 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2896_c40_da71_phase,
neq2_uxn_opcodes_h_l2896_c40_da71_ins,
neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read,
neq2_uxn_opcodes_h_l2896_c40_da71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d
opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output);

-- gth_uxn_opcodes_h_l2897_c40_63b1
gth_uxn_opcodes_h_l2897_c40_63b1 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2897_c40_63b1_phase,
gth_uxn_opcodes_h_l2897_c40_63b1_ins,
gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read,
gth_uxn_opcodes_h_l2897_c40_63b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6
opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output);

-- gth2_uxn_opcodes_h_l2898_c40_0ef0
gth2_uxn_opcodes_h_l2898_c40_0ef0 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2898_c40_0ef0_phase,
gth2_uxn_opcodes_h_l2898_c40_0ef0_ins,
gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read,
gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_9269
opc_result_MUX_uxn_opcodes_h_l2899_c7_9269 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output);

-- lth_uxn_opcodes_h_l2899_c40_0f2e
lth_uxn_opcodes_h_l2899_c40_0f2e : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2899_c40_0f2e_phase,
lth_uxn_opcodes_h_l2899_c40_0f2e_ins,
lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read,
lth_uxn_opcodes_h_l2899_c40_0f2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f
opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output);

-- lth2_uxn_opcodes_h_l2900_c40_9209
lth2_uxn_opcodes_h_l2900_c40_9209 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2900_c40_9209_phase,
lth2_uxn_opcodes_h_l2900_c40_9209_ins,
lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read,
lth2_uxn_opcodes_h_l2900_c40_9209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69
opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output);

-- jmp_uxn_opcodes_h_l2901_c40_801b
jmp_uxn_opcodes_h_l2901_c40_801b : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2901_c40_801b_phase,
jmp_uxn_opcodes_h_l2901_c40_801b_ins,
jmp_uxn_opcodes_h_l2901_c40_801b_pc,
jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read,
jmp_uxn_opcodes_h_l2901_c40_801b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_e885
opc_result_MUX_uxn_opcodes_h_l2902_c7_e885 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output);

-- jmp2_uxn_opcodes_h_l2902_c40_fd83
jmp2_uxn_opcodes_h_l2902_c40_fd83 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2902_c40_fd83_phase,
jmp2_uxn_opcodes_h_l2902_c40_fd83_ins,
jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read,
jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7
opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output);

-- jcn_uxn_opcodes_h_l2903_c40_394d
jcn_uxn_opcodes_h_l2903_c40_394d : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2903_c40_394d_phase,
jcn_uxn_opcodes_h_l2903_c40_394d_ins,
jcn_uxn_opcodes_h_l2903_c40_394d_pc,
jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read,
jcn_uxn_opcodes_h_l2903_c40_394d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99
opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output);

-- jcn2_uxn_opcodes_h_l2904_c40_8ed4
jcn2_uxn_opcodes_h_l2904_c40_8ed4 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase,
jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins,
jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read,
jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_f987
opc_result_MUX_uxn_opcodes_h_l2905_c7_f987 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output);

-- jsr_uxn_opcodes_h_l2905_c40_82b0
jsr_uxn_opcodes_h_l2905_c40_82b0 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2905_c40_82b0_phase,
jsr_uxn_opcodes_h_l2905_c40_82b0_ins,
jsr_uxn_opcodes_h_l2905_c40_82b0_pc,
jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read,
jsr_uxn_opcodes_h_l2905_c40_82b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be
opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output);

-- jsr2_uxn_opcodes_h_l2906_c40_3b2e
jsr2_uxn_opcodes_h_l2906_c40_3b2e : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read,
jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_369a
opc_result_MUX_uxn_opcodes_h_l2907_c7_369a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output);

-- sth_uxn_opcodes_h_l2907_c40_90ef
sth_uxn_opcodes_h_l2907_c40_90ef : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2907_c40_90ef_phase,
sth_uxn_opcodes_h_l2907_c40_90ef_ins,
sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read,
sth_uxn_opcodes_h_l2907_c40_90ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_982e
opc_result_MUX_uxn_opcodes_h_l2908_c7_982e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output);

-- sth2_uxn_opcodes_h_l2908_c40_32dc
sth2_uxn_opcodes_h_l2908_c40_32dc : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2908_c40_32dc_phase,
sth2_uxn_opcodes_h_l2908_c40_32dc_ins,
sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read,
sth2_uxn_opcodes_h_l2908_c40_32dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5
opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output);

-- ldz_uxn_opcodes_h_l2909_c40_6d79
ldz_uxn_opcodes_h_l2909_c40_6d79 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2909_c40_6d79_phase,
ldz_uxn_opcodes_h_l2909_c40_6d79_ins,
ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read,
ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read,
ldz_uxn_opcodes_h_l2909_c40_6d79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_162c
opc_result_MUX_uxn_opcodes_h_l2910_c7_162c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output);

-- ldz2_uxn_opcodes_h_l2910_c40_03fe
ldz2_uxn_opcodes_h_l2910_c40_03fe : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2910_c40_03fe_phase,
ldz2_uxn_opcodes_h_l2910_c40_03fe_ins,
ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read,
ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read,
ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_571b
opc_result_MUX_uxn_opcodes_h_l2911_c7_571b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output);

-- stz_uxn_opcodes_h_l2911_c40_a7bb
stz_uxn_opcodes_h_l2911_c40_a7bb : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2911_c40_a7bb_phase,
stz_uxn_opcodes_h_l2911_c40_a7bb_ins,
stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read,
stz_uxn_opcodes_h_l2911_c40_a7bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_786f
opc_result_MUX_uxn_opcodes_h_l2912_c7_786f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output);

-- stz2_uxn_opcodes_h_l2912_c40_c44e
stz2_uxn_opcodes_h_l2912_c40_c44e : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2912_c40_c44e_phase,
stz2_uxn_opcodes_h_l2912_c40_c44e_ins,
stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read,
stz2_uxn_opcodes_h_l2912_c40_c44e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83
opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output);

-- ldr_uxn_opcodes_h_l2913_c40_7dc0
ldr_uxn_opcodes_h_l2913_c40_7dc0 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2913_c40_7dc0_phase,
ldr_uxn_opcodes_h_l2913_c40_7dc0_ins,
ldr_uxn_opcodes_h_l2913_c40_7dc0_pc,
ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read,
ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read,
ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_987d
opc_result_MUX_uxn_opcodes_h_l2914_c7_987d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output);

-- ldr2_uxn_opcodes_h_l2914_c40_228e
ldr2_uxn_opcodes_h_l2914_c40_228e : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2914_c40_228e_phase,
ldr2_uxn_opcodes_h_l2914_c40_228e_ins,
ldr2_uxn_opcodes_h_l2914_c40_228e_pc,
ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read,
ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read,
ldr2_uxn_opcodes_h_l2914_c40_228e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05
opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output);

-- str1_uxn_opcodes_h_l2915_c40_8eee
str1_uxn_opcodes_h_l2915_c40_8eee : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2915_c40_8eee_phase,
str1_uxn_opcodes_h_l2915_c40_8eee_ins,
str1_uxn_opcodes_h_l2915_c40_8eee_pc,
str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read,
str1_uxn_opcodes_h_l2915_c40_8eee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7
opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output);

-- str2_uxn_opcodes_h_l2916_c40_bc16
str2_uxn_opcodes_h_l2916_c40_bc16 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2916_c40_bc16_phase,
str2_uxn_opcodes_h_l2916_c40_bc16_ins,
str2_uxn_opcodes_h_l2916_c40_bc16_pc,
str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read,
str2_uxn_opcodes_h_l2916_c40_bc16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_2128
opc_result_MUX_uxn_opcodes_h_l2917_c7_2128 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output);

-- lda_uxn_opcodes_h_l2917_c40_0cc6
lda_uxn_opcodes_h_l2917_c40_0cc6 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2917_c40_0cc6_phase,
lda_uxn_opcodes_h_l2917_c40_0cc6_ins,
lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read,
lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read,
lda_uxn_opcodes_h_l2917_c40_0cc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_a928
opc_result_MUX_uxn_opcodes_h_l2918_c7_a928 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output);

-- lda2_uxn_opcodes_h_l2918_c40_3c0d
lda2_uxn_opcodes_h_l2918_c40_3c0d : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2918_c40_3c0d_phase,
lda2_uxn_opcodes_h_l2918_c40_3c0d_ins,
lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read,
lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read,
lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_c545
opc_result_MUX_uxn_opcodes_h_l2919_c7_c545 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output);

-- sta_uxn_opcodes_h_l2919_c40_1eee
sta_uxn_opcodes_h_l2919_c40_1eee : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2919_c40_1eee_phase,
sta_uxn_opcodes_h_l2919_c40_1eee_ins,
sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read,
sta_uxn_opcodes_h_l2919_c40_1eee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3
opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output);

-- sta2_uxn_opcodes_h_l2920_c40_80a8
sta2_uxn_opcodes_h_l2920_c40_80a8 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2920_c40_80a8_phase,
sta2_uxn_opcodes_h_l2920_c40_80a8_ins,
sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read,
sta2_uxn_opcodes_h_l2920_c40_80a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_992e
opc_result_MUX_uxn_opcodes_h_l2921_c7_992e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output);

-- dei_uxn_opcodes_h_l2921_c40_b717
dei_uxn_opcodes_h_l2921_c40_b717 : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2921_c40_b717_phase,
dei_uxn_opcodes_h_l2921_c40_b717_ins,
dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read,
dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read,
dei_uxn_opcodes_h_l2921_c40_b717_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d
opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output);

-- dei2_uxn_opcodes_h_l2922_c40_68d4
dei2_uxn_opcodes_h_l2922_c40_68d4 : entity work.dei2_0CLK_919eceda port map (
clk,
dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2922_c40_68d4_phase,
dei2_uxn_opcodes_h_l2922_c40_68d4_ins,
dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read,
dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read,
dei2_uxn_opcodes_h_l2922_c40_68d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_6879
opc_result_MUX_uxn_opcodes_h_l2923_c7_6879 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output);

-- deo_uxn_opcodes_h_l2923_c40_0529
deo_uxn_opcodes_h_l2923_c40_0529 : entity work.deo_0CLK_ebde644c port map (
clk,
deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2923_c40_0529_phase,
deo_uxn_opcodes_h_l2923_c40_0529_ins,
deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read,
deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read,
deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read,
deo_uxn_opcodes_h_l2923_c40_0529_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02
opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output);

-- deo2_uxn_opcodes_h_l2924_c40_c4f4
deo2_uxn_opcodes_h_l2924_c40_c4f4 : entity work.deo2_0CLK_5952a5d7 port map (
clk,
deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2924_c40_c4f4_phase,
deo2_uxn_opcodes_h_l2924_c40_c4f4_ins,
deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read,
deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read,
deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read,
deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80
opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output);

-- add_uxn_opcodes_h_l2925_c40_32b6
add_uxn_opcodes_h_l2925_c40_32b6 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE,
add_uxn_opcodes_h_l2925_c40_32b6_phase,
add_uxn_opcodes_h_l2925_c40_32b6_ins,
add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read,
add_uxn_opcodes_h_l2925_c40_32b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb
opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output);

-- add2_uxn_opcodes_h_l2926_c40_1e65
add2_uxn_opcodes_h_l2926_c40_1e65 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2926_c40_1e65_phase,
add2_uxn_opcodes_h_l2926_c40_1e65_ins,
add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read,
add2_uxn_opcodes_h_l2926_c40_1e65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_586f
opc_result_MUX_uxn_opcodes_h_l2927_c7_586f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output);

-- sub_uxn_opcodes_h_l2927_c40_5857
sub_uxn_opcodes_h_l2927_c40_5857 : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2927_c40_5857_phase,
sub_uxn_opcodes_h_l2927_c40_5857_ins,
sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read,
sub_uxn_opcodes_h_l2927_c40_5857_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2
opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output);

-- sub2_uxn_opcodes_h_l2928_c40_ce79
sub2_uxn_opcodes_h_l2928_c40_ce79 : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2928_c40_ce79_phase,
sub2_uxn_opcodes_h_l2928_c40_ce79_ins,
sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read,
sub2_uxn_opcodes_h_l2928_c40_ce79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23
opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output);

-- mul_uxn_opcodes_h_l2929_c40_f9bf
mul_uxn_opcodes_h_l2929_c40_f9bf : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2929_c40_f9bf_phase,
mul_uxn_opcodes_h_l2929_c40_f9bf_ins,
mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read,
mul_uxn_opcodes_h_l2929_c40_f9bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_1294
opc_result_MUX_uxn_opcodes_h_l2930_c7_1294 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output);

-- mul2_uxn_opcodes_h_l2930_c40_24d5
mul2_uxn_opcodes_h_l2930_c40_24d5 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2930_c40_24d5_phase,
mul2_uxn_opcodes_h_l2930_c40_24d5_ins,
mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read,
mul2_uxn_opcodes_h_l2930_c40_24d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19
opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output);

-- div_uxn_opcodes_h_l2931_c40_9810
div_uxn_opcodes_h_l2931_c40_9810 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE,
div_uxn_opcodes_h_l2931_c40_9810_phase,
div_uxn_opcodes_h_l2931_c40_9810_ins,
div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read,
div_uxn_opcodes_h_l2931_c40_9810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce
opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output);

-- div2_uxn_opcodes_h_l2932_c40_7769
div2_uxn_opcodes_h_l2932_c40_7769 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2932_c40_7769_phase,
div2_uxn_opcodes_h_l2932_c40_7769_ins,
div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read,
div2_uxn_opcodes_h_l2932_c40_7769_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd
opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output);

-- and_uxn_opcodes_h_l2933_c40_f2ab
and_uxn_opcodes_h_l2933_c40_f2ab : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE,
and_uxn_opcodes_h_l2933_c40_f2ab_phase,
and_uxn_opcodes_h_l2933_c40_f2ab_ins,
and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read,
and_uxn_opcodes_h_l2933_c40_f2ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_a682
opc_result_MUX_uxn_opcodes_h_l2934_c7_a682 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output);

-- and2_uxn_opcodes_h_l2934_c40_343e
and2_uxn_opcodes_h_l2934_c40_343e : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2934_c40_343e_phase,
and2_uxn_opcodes_h_l2934_c40_343e_ins,
and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read,
and2_uxn_opcodes_h_l2934_c40_343e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07
opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output);

-- ora_uxn_opcodes_h_l2935_c40_9289
ora_uxn_opcodes_h_l2935_c40_9289 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2935_c40_9289_phase,
ora_uxn_opcodes_h_l2935_c40_9289_ins,
ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read,
ora_uxn_opcodes_h_l2935_c40_9289_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_509b
opc_result_MUX_uxn_opcodes_h_l2936_c7_509b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output);

-- ora2_uxn_opcodes_h_l2936_c40_fb57
ora2_uxn_opcodes_h_l2936_c40_fb57 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2936_c40_fb57_phase,
ora2_uxn_opcodes_h_l2936_c40_fb57_ins,
ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read,
ora2_uxn_opcodes_h_l2936_c40_fb57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe
opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output);

-- eor_uxn_opcodes_h_l2937_c40_e1df
eor_uxn_opcodes_h_l2937_c40_e1df : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2937_c40_e1df_phase,
eor_uxn_opcodes_h_l2937_c40_e1df_ins,
eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read,
eor_uxn_opcodes_h_l2937_c40_e1df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79
opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output);

-- eor2_uxn_opcodes_h_l2938_c40_d05f
eor2_uxn_opcodes_h_l2938_c40_d05f : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2938_c40_d05f_phase,
eor2_uxn_opcodes_h_l2938_c40_d05f_ins,
eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read,
eor2_uxn_opcodes_h_l2938_c40_d05f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_941d
opc_result_MUX_uxn_opcodes_h_l2939_c7_941d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output);

-- sft_uxn_opcodes_h_l2939_c40_6052
sft_uxn_opcodes_h_l2939_c40_6052 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2939_c40_6052_phase,
sft_uxn_opcodes_h_l2939_c40_6052_ins,
sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read,
sft_uxn_opcodes_h_l2939_c40_6052_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5
opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output);

-- sft2_uxn_opcodes_h_l2940_c40_331d
sft2_uxn_opcodes_h_l2940_c40_331d : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2940_c40_331d_phase,
sft2_uxn_opcodes_h_l2940_c40_331d_ins,
sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read,
sft2_uxn_opcodes_h_l2940_c40_331d_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6
CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x,
CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output);

-- sp0_MUX_uxn_opcodes_h_l2945_c2_3380
sp0_MUX_uxn_opcodes_h_l2945_c2_3380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond,
sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue,
sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse,
sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output);

-- sp1_MUX_uxn_opcodes_h_l2945_c2_3380
sp1_MUX_uxn_opcodes_h_l2945_c2_3380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond,
sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue,
sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse,
sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output);

-- MUX_uxn_opcodes_h_l2951_c29_6335
MUX_uxn_opcodes_h_l2951_c29_6335 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2951_c29_6335_cond,
MUX_uxn_opcodes_h_l2951_c29_6335_iftrue,
MUX_uxn_opcodes_h_l2951_c29_6335_iffalse,
MUX_uxn_opcodes_h_l2951_c29_6335_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output);

-- MUX_uxn_opcodes_h_l2952_c20_f785
MUX_uxn_opcodes_h_l2952_c20_f785 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c20_f785_cond,
MUX_uxn_opcodes_h_l2952_c20_f785_iftrue,
MUX_uxn_opcodes_h_l2952_c20_f785_iffalse,
MUX_uxn_opcodes_h_l2952_c20_f785_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output);

-- stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address,
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value,
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable,
stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output,
 MUX_uxn_opcodes_h_l2864_c14_d78a_return_output,
 MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output,
 is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output,
 brk_uxn_opcodes_h_l2871_c48_0de0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output,
 jci_uxn_opcodes_h_l2872_c40_92bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output,
 jmi_uxn_opcodes_h_l2873_c40_48ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output,
 jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output,
 lit_uxn_opcodes_h_l2875_c40_d60b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output,
 lit2_uxn_opcodes_h_l2876_c40_db64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output,
 lit_uxn_opcodes_h_l2877_c40_9a89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output,
 lit2_uxn_opcodes_h_l2878_c40_5e27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output,
 inc_uxn_opcodes_h_l2879_c40_08e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output,
 inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output,
 pop_uxn_opcodes_h_l2881_c40_ed1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output,
 pop2_uxn_opcodes_h_l2882_c40_1c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output,
 nip_uxn_opcodes_h_l2883_c40_9675_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output,
 nip2_uxn_opcodes_h_l2884_c40_978d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output,
 swp_uxn_opcodes_h_l2885_c40_4de6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output,
 swp2_uxn_opcodes_h_l2886_c40_4a37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output,
 rot_uxn_opcodes_h_l2887_c40_2571_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output,
 rot2_uxn_opcodes_h_l2888_c40_359a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output,
 dup_uxn_opcodes_h_l2889_c40_e28c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output,
 dup2_uxn_opcodes_h_l2890_c40_0edc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output,
 ovr_uxn_opcodes_h_l2891_c40_b079_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output,
 ovr2_uxn_opcodes_h_l2892_c40_d137_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output,
 equ_uxn_opcodes_h_l2893_c40_e5ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output,
 equ2_uxn_opcodes_h_l2894_c40_7764_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output,
 neq_uxn_opcodes_h_l2895_c40_63d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output,
 neq2_uxn_opcodes_h_l2896_c40_da71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output,
 gth_uxn_opcodes_h_l2897_c40_63b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output,
 gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output,
 lth_uxn_opcodes_h_l2899_c40_0f2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output,
 lth2_uxn_opcodes_h_l2900_c40_9209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output,
 jmp_uxn_opcodes_h_l2901_c40_801b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output,
 jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output,
 jcn_uxn_opcodes_h_l2903_c40_394d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output,
 jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output,
 jsr_uxn_opcodes_h_l2905_c40_82b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output,
 jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output,
 sth_uxn_opcodes_h_l2907_c40_90ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output,
 sth2_uxn_opcodes_h_l2908_c40_32dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output,
 ldz_uxn_opcodes_h_l2909_c40_6d79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output,
 ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output,
 stz_uxn_opcodes_h_l2911_c40_a7bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output,
 stz2_uxn_opcodes_h_l2912_c40_c44e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output,
 ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output,
 ldr2_uxn_opcodes_h_l2914_c40_228e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output,
 str1_uxn_opcodes_h_l2915_c40_8eee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output,
 str2_uxn_opcodes_h_l2916_c40_bc16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output,
 lda_uxn_opcodes_h_l2917_c40_0cc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output,
 lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output,
 sta_uxn_opcodes_h_l2919_c40_1eee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output,
 sta2_uxn_opcodes_h_l2920_c40_80a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output,
 dei_uxn_opcodes_h_l2921_c40_b717_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output,
 dei2_uxn_opcodes_h_l2922_c40_68d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output,
 deo_uxn_opcodes_h_l2923_c40_0529_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output,
 deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output,
 add_uxn_opcodes_h_l2925_c40_32b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output,
 add2_uxn_opcodes_h_l2926_c40_1e65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output,
 sub_uxn_opcodes_h_l2927_c40_5857_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output,
 sub2_uxn_opcodes_h_l2928_c40_ce79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output,
 mul_uxn_opcodes_h_l2929_c40_f9bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output,
 mul2_uxn_opcodes_h_l2930_c40_24d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output,
 div_uxn_opcodes_h_l2931_c40_9810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output,
 div2_uxn_opcodes_h_l2932_c40_7769_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output,
 and_uxn_opcodes_h_l2933_c40_f2ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output,
 and2_uxn_opcodes_h_l2934_c40_343e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output,
 ora_uxn_opcodes_h_l2935_c40_9289_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output,
 ora2_uxn_opcodes_h_l2936_c40_fb57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output,
 eor_uxn_opcodes_h_l2937_c40_e1df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output,
 eor2_uxn_opcodes_h_l2938_c40_d05f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output,
 sft_uxn_opcodes_h_l2939_c40_6052_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output,
 sft2_uxn_opcodes_h_l2940_c40_331d_return_output,
 CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output,
 sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output,
 sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output,
 MUX_uxn_opcodes_h_l2951_c29_6335_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output,
 MUX_uxn_opcodes_h_l2952_c20_f785_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output,
 stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_0de0_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_0de0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_92bd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_d60b_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_d60b_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_d60b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_db64_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_db64_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_db64_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_9a89_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_9a89_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_9a89_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_08e3_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_08e3_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_08e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_9675_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_9675_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_9675_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_978d_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_978d_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_978d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_4de6_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_4de6_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_4de6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_2571_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_2571_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_2571_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_359a_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_359a_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_359a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_e28c_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_e28c_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_e28c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_b079_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_b079_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_b079_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_7764_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_7764_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_7764_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_63d1_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_63d1_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_63d1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_da71_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_da71_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_da71_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_63b1_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_63b1_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_63b1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_9209_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_9209_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_9209_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_801b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_394d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_90ef_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_90ef_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_90ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_8eee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_bc16_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_1eee_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_1eee_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_1eee_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_b717_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_0529_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_32b6_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_32b6_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_32b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_1e65_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_1e65_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_1e65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_5857_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_5857_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_5857_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_9810_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_9810_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_9810_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_7769_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_7769_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_7769_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_f2ab_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_f2ab_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_f2ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_343e_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_343e_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_343e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_9289_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_9289_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_9289_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_e1df_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_e1df_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_e1df_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_6052_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_6052_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_6052_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_331d_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_331d_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_331d_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2942_c2_bbfb : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_146a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2948_c3_d26a : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2946_c3_a1e7 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_6335_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_6335_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_d96f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_5bf1_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_54f3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2952_c2_3315 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_f785_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_f785_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_bb72_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_2bc0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_cb48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_c413_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_60eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_b78e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_97d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_a4d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_a778_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_5777_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_a73f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2956_l2968_DUPLICATE_cae1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_642a_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right := to_unsigned(43, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right := to_unsigned(49, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right := to_unsigned(32, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right := to_unsigned(16, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right := to_unsigned(57, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right := to_unsigned(192, 8);
     VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right := to_unsigned(18, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right := to_unsigned(48, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right := to_unsigned(23, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right := to_unsigned(40, 8);
     VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right := to_unsigned(25, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right := to_unsigned(31, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right := to_unsigned(37, 8);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right := to_unsigned(12, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right := to_unsigned(58, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right := to_unsigned(38, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right := to_unsigned(54, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right := to_unsigned(10, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right := to_unsigned(50, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right := to_unsigned(52, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right := to_unsigned(27, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2926_c40_1e65_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2925_c40_32b6_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2934_c40_343e_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2933_c40_f2ab_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2932_c40_7769_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2931_c40_9810_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2889_c40_e28c_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2937_c40_e1df_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2894_c40_7764_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2897_c40_63b1_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2879_c40_08e3_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2900_c40_9209_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2896_c40_da71_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2895_c40_63d1_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2884_c40_978d_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2883_c40_9675_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2935_c40_9289_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2891_c40_b079_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2888_c40_359a_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2887_c40_2571_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2940_c40_331d_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2939_c40_6052_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2919_c40_1eee_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2907_c40_90ef_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2927_c40_5857_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2885_c40_4de6_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2876_c40_db64_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2875_c40_d60b_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_9a89_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2926_c40_1e65_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2925_c40_32b6_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2934_c40_343e_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2933_c40_f2ab_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2871_c48_0de0_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2932_c40_7769_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2931_c40_9810_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2889_c40_e28c_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2937_c40_e1df_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2894_c40_7764_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2897_c40_63b1_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2879_c40_08e3_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2876_c40_db64_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2875_c40_d60b_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2877_c40_9a89_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2900_c40_9209_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2896_c40_da71_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2895_c40_63d1_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2884_c40_978d_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2883_c40_9675_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2935_c40_9289_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2891_c40_b079_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2888_c40_359a_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2887_c40_2571_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2940_c40_331d_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2939_c40_6052_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2919_c40_1eee_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2907_c40_90ef_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2927_c40_5857_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2885_c40_4de6_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse := sp1;
     -- brk[uxn_opcodes_h_l2871_c48_0de0] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2871_c48_0de0_phase <= VAR_brk_uxn_opcodes_h_l2871_c48_0de0_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2871_c48_0de0_return_output := brk_uxn_opcodes_h_l2871_c48_0de0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2863_c14_0775] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_left;
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output := BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2942_c16_17e6] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output := CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output;
     VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_0775_return_output;
     VAR_stack_index_uxn_opcodes_h_l2942_c2_bbfb := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_17e6_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue := VAR_brk_uxn_opcodes_h_l2871_c48_0de0_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left := VAR_stack_index_uxn_opcodes_h_l2942_c2_bbfb;
     -- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_5d35] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_left;
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output := BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_5d35_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2864_c14_b334] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_left;
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output := BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_b334_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_2c84] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_2c84_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_1ab1] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_1ab1_return_output;
     -- MUX[uxn_opcodes_h_l2864_c14_d78a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2864_c14_d78a_cond <= VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_cond;
     MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue <= VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iftrue;
     MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse <= VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_return_output := MUX_uxn_opcodes_h_l2864_c14_d78a_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_cond := VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2864_c14_d78a_return_output;
     -- MUX[uxn_opcodes_h_l2865_c8_5a2b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c8_5a2b_cond <= VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_cond;
     MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iftrue;
     MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output := MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2865_c8_5a2b_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_cac9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_3c04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_610e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_510e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_7727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_bd0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_7bde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_61e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_77fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_64ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_1c5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_af61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_13de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_8728] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_a80c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_57cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_0fe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_9bff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_809a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_c302] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_b40c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_612f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_8c9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_83f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_6386] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_f8d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_7ebe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_364a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_7e95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_d35c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_5d2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_54cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_6bc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_3eea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_8301] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_f381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_5913] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_5a2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_f77c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_02c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_b3e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_9d32] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_962d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_52b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_8805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_59a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_49bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_559d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_6f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_97a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_ff44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_1b79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_cfec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_42ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_c8f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_e4de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_f2cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_c92e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_afa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_7a0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_b667] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_137c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_1450] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_506f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_ea24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f0a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_202e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_c665] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_35c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_063a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_f2cb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_364a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_c302_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_b667_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cac9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_809a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_35c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_7bde_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f77c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_77fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_0fe5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_510e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_1450_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_1c5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_83f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_c92e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_5a2e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_8c9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_5913_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_02c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_13de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_cfec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_063a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_202e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f0a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_7ebe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f381_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_9d32_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d35c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_52b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_7a0f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_e4de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_1b79_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_8805_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_3c04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_559d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_962d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_54cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6f7c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_7e95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_8301_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_a80c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b40c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_57cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_61e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_c8f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_42ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_8728_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_ff44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_97a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_610e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_ea24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_c665_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_137c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_9bff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_59a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_af61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_506f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_bd0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_6bc9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_7727_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_612f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5d2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_afa3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_3eea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_49bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_b3e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_6386_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_f8d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_64ce_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_72c1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2871_c2_f554] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_cond;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output := is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_a425] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_2072] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_a425_return_output;
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2072_return_output;
     -- jci[uxn_opcodes_h_l2872_c40_92bd] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2872_c40_92bd_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2872_c40_92bd_phase <= VAR_jci_uxn_opcodes_h_l2872_c40_92bd_phase;
     jci_uxn_opcodes_h_l2872_c40_92bd_pc <= VAR_jci_uxn_opcodes_h_l2872_c40_92bd_pc;
     jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_stack_read;
     jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2872_c40_92bd_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2872_c40_92bd_return_output := jci_uxn_opcodes_h_l2872_c40_92bd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_13e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_5dad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output;
     VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_13e9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue := VAR_jci_uxn_opcodes_h_l2872_c40_92bd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f385] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_3b41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output;

     -- jmi[uxn_opcodes_h_l2873_c40_48ef] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2873_c40_48ef_phase <= VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_phase;
     jmi_uxn_opcodes_h_l2873_c40_48ef_pc <= VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_pc;
     jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_return_output := jmi_uxn_opcodes_h_l2873_c40_48ef_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f385_return_output;
     VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_3b41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue := VAR_jmi_uxn_opcodes_h_l2873_c40_48ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_e875] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output;

     -- jsi[uxn_opcodes_h_l2874_c40_f1e8] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2874_c40_f1e8_phase <= VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_phase;
     jsi_uxn_opcodes_h_l2874_c40_f1e8_pc <= VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_pc;
     jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output := jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_93fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output;
     VAR_lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_e875_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue := VAR_jsi_uxn_opcodes_h_l2874_c40_f1e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_f6e1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_0db0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output;

     -- lit[uxn_opcodes_h_l2875_c40_d60b] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2875_c40_d60b_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2875_c40_d60b_phase <= VAR_lit_uxn_opcodes_h_l2875_c40_d60b_phase;
     lit_uxn_opcodes_h_l2875_c40_d60b_pc <= VAR_lit_uxn_opcodes_h_l2875_c40_d60b_pc;
     lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2875_c40_d60b_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2875_c40_d60b_return_output := lit_uxn_opcodes_h_l2875_c40_d60b_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output;
     VAR_lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_0db0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue := VAR_lit_uxn_opcodes_h_l2875_c40_d60b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_433e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_af6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output;

     -- lit2[uxn_opcodes_h_l2876_c40_db64] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2876_c40_db64_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2876_c40_db64_phase <= VAR_lit2_uxn_opcodes_h_l2876_c40_db64_phase;
     lit2_uxn_opcodes_h_l2876_c40_db64_pc <= VAR_lit2_uxn_opcodes_h_l2876_c40_db64_pc;
     lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2876_c40_db64_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2876_c40_db64_return_output := lit2_uxn_opcodes_h_l2876_c40_db64_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_433e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue := VAR_lit2_uxn_opcodes_h_l2876_c40_db64_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_6648] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_f309] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_9a89] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_9a89_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_9a89_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_9a89_phase;
     lit_uxn_opcodes_h_l2877_c40_9a89_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_9a89_pc;
     lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_9a89_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_9a89_return_output := lit_uxn_opcodes_h_l2877_c40_9a89_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_6648_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f309_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_9a89_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_a2c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_4abf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_5e27] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_5e27_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_phase;
     lit2_uxn_opcodes_h_l2878_c40_5e27_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_pc;
     lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_return_output := lit2_uxn_opcodes_h_l2878_c40_5e27_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output;
     VAR_inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_4abf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_5e27_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_839e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output;

     -- inc[uxn_opcodes_h_l2879_c40_08e3] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2879_c40_08e3_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2879_c40_08e3_phase <= VAR_inc_uxn_opcodes_h_l2879_c40_08e3_phase;
     inc_uxn_opcodes_h_l2879_c40_08e3_ins <= VAR_inc_uxn_opcodes_h_l2879_c40_08e3_ins;
     inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2879_c40_08e3_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2879_c40_08e3_return_output := inc_uxn_opcodes_h_l2879_c40_08e3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_2731] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2731_return_output;
     VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_839e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue := VAR_inc_uxn_opcodes_h_l2879_c40_08e3_return_output;
     -- inc2[uxn_opcodes_h_l2880_c40_2e1a] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2880_c40_2e1a_phase <= VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_phase;
     inc2_uxn_opcodes_h_l2880_c40_2e1a_ins <= VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_ins;
     inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output := inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_5890] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_cbbc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_5890_return_output;
     VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_cbbc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue := VAR_inc2_uxn_opcodes_h_l2880_c40_2e1a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_15d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output;

     -- pop[uxn_opcodes_h_l2881_c40_ed1a] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2881_c40_ed1a_phase <= VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_phase;
     pop_uxn_opcodes_h_l2881_c40_ed1a_ins <= VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_return_output := pop_uxn_opcodes_h_l2881_c40_ed1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_6614] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_6614_return_output;
     VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_15d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue := VAR_pop_uxn_opcodes_h_l2881_c40_ed1a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_b952] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output;

     -- pop2[uxn_opcodes_h_l2882_c40_1c81] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2882_c40_1c81_phase <= VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_phase;
     pop2_uxn_opcodes_h_l2882_c40_1c81_ins <= VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_return_output := pop2_uxn_opcodes_h_l2882_c40_1c81_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_315e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_315e_return_output;
     VAR_nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_b952_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue := VAR_pop2_uxn_opcodes_h_l2882_c40_1c81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_7d1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_56c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output;

     -- nip[uxn_opcodes_h_l2883_c40_9675] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2883_c40_9675_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2883_c40_9675_phase <= VAR_nip_uxn_opcodes_h_l2883_c40_9675_phase;
     nip_uxn_opcodes_h_l2883_c40_9675_ins <= VAR_nip_uxn_opcodes_h_l2883_c40_9675_ins;
     nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2883_c40_9675_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2883_c40_9675_return_output := nip_uxn_opcodes_h_l2883_c40_9675_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output;
     VAR_nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_56c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue := VAR_nip_uxn_opcodes_h_l2883_c40_9675_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_161b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_b679] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output;

     -- nip2[uxn_opcodes_h_l2884_c40_978d] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2884_c40_978d_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2884_c40_978d_phase <= VAR_nip2_uxn_opcodes_h_l2884_c40_978d_phase;
     nip2_uxn_opcodes_h_l2884_c40_978d_ins <= VAR_nip2_uxn_opcodes_h_l2884_c40_978d_ins;
     nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2884_c40_978d_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2884_c40_978d_return_output := nip2_uxn_opcodes_h_l2884_c40_978d_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_161b_return_output;
     VAR_swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_b679_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue := VAR_nip2_uxn_opcodes_h_l2884_c40_978d_return_output;
     -- swp[uxn_opcodes_h_l2885_c40_4de6] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2885_c40_4de6_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2885_c40_4de6_phase <= VAR_swp_uxn_opcodes_h_l2885_c40_4de6_phase;
     swp_uxn_opcodes_h_l2885_c40_4de6_ins <= VAR_swp_uxn_opcodes_h_l2885_c40_4de6_ins;
     swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2885_c40_4de6_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2885_c40_4de6_return_output := swp_uxn_opcodes_h_l2885_c40_4de6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_5fa9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_eb49] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output;
     VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_eb49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue := VAR_swp_uxn_opcodes_h_l2885_c40_4de6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_b7da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_2d36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output;

     -- swp2[uxn_opcodes_h_l2886_c40_4a37] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2886_c40_4a37_phase <= VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_phase;
     swp2_uxn_opcodes_h_l2886_c40_4a37_ins <= VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_ins;
     swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_return_output := swp2_uxn_opcodes_h_l2886_c40_4a37_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output;
     VAR_rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_b7da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue := VAR_swp2_uxn_opcodes_h_l2886_c40_4a37_return_output;
     -- rot[uxn_opcodes_h_l2887_c40_2571] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2887_c40_2571_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2887_c40_2571_phase <= VAR_rot_uxn_opcodes_h_l2887_c40_2571_phase;
     rot_uxn_opcodes_h_l2887_c40_2571_ins <= VAR_rot_uxn_opcodes_h_l2887_c40_2571_ins;
     rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2887_c40_2571_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2887_c40_2571_return_output := rot_uxn_opcodes_h_l2887_c40_2571_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_66eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_b4b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output;
     VAR_rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_b4b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue := VAR_rot_uxn_opcodes_h_l2887_c40_2571_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_4b1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output;

     -- rot2[uxn_opcodes_h_l2888_c40_359a] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2888_c40_359a_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2888_c40_359a_phase <= VAR_rot2_uxn_opcodes_h_l2888_c40_359a_phase;
     rot2_uxn_opcodes_h_l2888_c40_359a_ins <= VAR_rot2_uxn_opcodes_h_l2888_c40_359a_ins;
     rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2888_c40_359a_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2888_c40_359a_return_output := rot2_uxn_opcodes_h_l2888_c40_359a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_b168] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_b168_return_output;
     VAR_dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_4b1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue := VAR_rot2_uxn_opcodes_h_l2888_c40_359a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_2dfe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output;

     -- dup[uxn_opcodes_h_l2889_c40_e28c] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2889_c40_e28c_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2889_c40_e28c_phase <= VAR_dup_uxn_opcodes_h_l2889_c40_e28c_phase;
     dup_uxn_opcodes_h_l2889_c40_e28c_ins <= VAR_dup_uxn_opcodes_h_l2889_c40_e28c_ins;
     dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2889_c40_e28c_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2889_c40_e28c_return_output := dup_uxn_opcodes_h_l2889_c40_e28c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_dc58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output;
     VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_dc58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue := VAR_dup_uxn_opcodes_h_l2889_c40_e28c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_771f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output;

     -- dup2[uxn_opcodes_h_l2890_c40_0edc] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2890_c40_0edc_phase <= VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_phase;
     dup2_uxn_opcodes_h_l2890_c40_0edc_ins <= VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_ins;
     dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_return_output := dup2_uxn_opcodes_h_l2890_c40_0edc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_f0b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_771f_return_output;
     VAR_ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_f0b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue := VAR_dup2_uxn_opcodes_h_l2890_c40_0edc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_b149] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_2fdb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output;

     -- ovr[uxn_opcodes_h_l2891_c40_b079] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2891_c40_b079_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2891_c40_b079_phase <= VAR_ovr_uxn_opcodes_h_l2891_c40_b079_phase;
     ovr_uxn_opcodes_h_l2891_c40_b079_ins <= VAR_ovr_uxn_opcodes_h_l2891_c40_b079_ins;
     ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2891_c40_b079_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2891_c40_b079_return_output := ovr_uxn_opcodes_h_l2891_c40_b079_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_b149_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue := VAR_ovr_uxn_opcodes_h_l2891_c40_b079_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_0fa9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_4a50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output;

     -- ovr2[uxn_opcodes_h_l2892_c40_d137] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2892_c40_d137_phase <= VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_phase;
     ovr2_uxn_opcodes_h_l2892_c40_d137_ins <= VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_ins;
     ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_return_output := ovr2_uxn_opcodes_h_l2892_c40_d137_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output;
     VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_4a50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue := VAR_ovr2_uxn_opcodes_h_l2892_c40_d137_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_fbff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_15e5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output;

     -- equ[uxn_opcodes_h_l2893_c40_e5ef] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2893_c40_e5ef_phase <= VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_phase;
     equ_uxn_opcodes_h_l2893_c40_e5ef_ins <= VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_ins;
     equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_return_output := equ_uxn_opcodes_h_l2893_c40_e5ef_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output;
     VAR_equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_fbff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue := VAR_equ_uxn_opcodes_h_l2893_c40_e5ef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_df8d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_89a0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output;

     -- equ2[uxn_opcodes_h_l2894_c40_7764] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2894_c40_7764_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2894_c40_7764_phase <= VAR_equ2_uxn_opcodes_h_l2894_c40_7764_phase;
     equ2_uxn_opcodes_h_l2894_c40_7764_ins <= VAR_equ2_uxn_opcodes_h_l2894_c40_7764_ins;
     equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2894_c40_7764_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2894_c40_7764_return_output := equ2_uxn_opcodes_h_l2894_c40_7764_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output;
     VAR_neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_df8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue := VAR_equ2_uxn_opcodes_h_l2894_c40_7764_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_ad3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_6946] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output;

     -- neq[uxn_opcodes_h_l2895_c40_63d1] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2895_c40_63d1_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2895_c40_63d1_phase <= VAR_neq_uxn_opcodes_h_l2895_c40_63d1_phase;
     neq_uxn_opcodes_h_l2895_c40_63d1_ins <= VAR_neq_uxn_opcodes_h_l2895_c40_63d1_ins;
     neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2895_c40_63d1_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2895_c40_63d1_return_output := neq_uxn_opcodes_h_l2895_c40_63d1_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output;
     VAR_neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_6946_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue := VAR_neq_uxn_opcodes_h_l2895_c40_63d1_return_output;
     -- neq2[uxn_opcodes_h_l2896_c40_da71] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2896_c40_da71_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2896_c40_da71_phase <= VAR_neq2_uxn_opcodes_h_l2896_c40_da71_phase;
     neq2_uxn_opcodes_h_l2896_c40_da71_ins <= VAR_neq2_uxn_opcodes_h_l2896_c40_da71_ins;
     neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2896_c40_da71_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2896_c40_da71_return_output := neq2_uxn_opcodes_h_l2896_c40_da71_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_54c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_8592] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output;
     VAR_gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_8592_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue := VAR_neq2_uxn_opcodes_h_l2896_c40_da71_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_9269] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_af60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output;

     -- gth[uxn_opcodes_h_l2897_c40_63b1] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2897_c40_63b1_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2897_c40_63b1_phase <= VAR_gth_uxn_opcodes_h_l2897_c40_63b1_phase;
     gth_uxn_opcodes_h_l2897_c40_63b1_ins <= VAR_gth_uxn_opcodes_h_l2897_c40_63b1_ins;
     gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2897_c40_63b1_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2897_c40_63b1_return_output := gth_uxn_opcodes_h_l2897_c40_63b1_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_9269_return_output;
     VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_af60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue := VAR_gth_uxn_opcodes_h_l2897_c40_63b1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_9c1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_7772] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output;

     -- gth2[uxn_opcodes_h_l2898_c40_0ef0] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2898_c40_0ef0_phase <= VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_phase;
     gth2_uxn_opcodes_h_l2898_c40_0ef0_ins <= VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_ins;
     gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output := gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output;
     VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_7772_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue := VAR_gth2_uxn_opcodes_h_l2898_c40_0ef0_return_output;
     -- lth[uxn_opcodes_h_l2899_c40_0f2e] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2899_c40_0f2e_phase <= VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_phase;
     lth_uxn_opcodes_h_l2899_c40_0f2e_ins <= VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_ins;
     lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_return_output := lth_uxn_opcodes_h_l2899_c40_0f2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_c9b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_4d69] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output;
     VAR_lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_c9b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue := VAR_lth_uxn_opcodes_h_l2899_c40_0f2e_return_output;
     -- lth2[uxn_opcodes_h_l2900_c40_9209] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2900_c40_9209_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2900_c40_9209_phase <= VAR_lth2_uxn_opcodes_h_l2900_c40_9209_phase;
     lth2_uxn_opcodes_h_l2900_c40_9209_ins <= VAR_lth2_uxn_opcodes_h_l2900_c40_9209_ins;
     lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2900_c40_9209_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2900_c40_9209_return_output := lth2_uxn_opcodes_h_l2900_c40_9209_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e885] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_f94d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e885_return_output;
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_f94d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue := VAR_lth2_uxn_opcodes_h_l2900_c40_9209_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_5ae9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_e2d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output;

     -- jmp[uxn_opcodes_h_l2901_c40_801b] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2901_c40_801b_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2901_c40_801b_phase <= VAR_jmp_uxn_opcodes_h_l2901_c40_801b_phase;
     jmp_uxn_opcodes_h_l2901_c40_801b_ins <= VAR_jmp_uxn_opcodes_h_l2901_c40_801b_ins;
     jmp_uxn_opcodes_h_l2901_c40_801b_pc <= VAR_jmp_uxn_opcodes_h_l2901_c40_801b_pc;
     jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2901_c40_801b_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2901_c40_801b_return_output := jmp_uxn_opcodes_h_l2901_c40_801b_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5ae9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue := VAR_jmp_uxn_opcodes_h_l2901_c40_801b_return_output;
     -- jmp2[uxn_opcodes_h_l2902_c40_fd83] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2902_c40_fd83_phase <= VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_phase;
     jmp2_uxn_opcodes_h_l2902_c40_fd83_ins <= VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_ins;
     jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output := jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_1fd0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_1c99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output;
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1fd0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue := VAR_jmp2_uxn_opcodes_h_l2902_c40_fd83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_f987] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output;

     -- jcn[uxn_opcodes_h_l2903_c40_394d] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2903_c40_394d_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2903_c40_394d_phase <= VAR_jcn_uxn_opcodes_h_l2903_c40_394d_phase;
     jcn_uxn_opcodes_h_l2903_c40_394d_ins <= VAR_jcn_uxn_opcodes_h_l2903_c40_394d_ins;
     jcn_uxn_opcodes_h_l2903_c40_394d_pc <= VAR_jcn_uxn_opcodes_h_l2903_c40_394d_pc;
     jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2903_c40_394d_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2903_c40_394d_return_output := jcn_uxn_opcodes_h_l2903_c40_394d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_d7e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_f987_return_output;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_d7e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue := VAR_jcn_uxn_opcodes_h_l2903_c40_394d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_6ecd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_c2be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output;

     -- jcn2[uxn_opcodes_h_l2904_c40_8ed4] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase <= VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_phase;
     jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins <= VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_ins;
     jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output := jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output;
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_6ecd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue := VAR_jcn2_uxn_opcodes_h_l2904_c40_8ed4_return_output;
     -- jsr[uxn_opcodes_h_l2905_c40_82b0] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2905_c40_82b0_phase <= VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_phase;
     jsr_uxn_opcodes_h_l2905_c40_82b0_ins <= VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_ins;
     jsr_uxn_opcodes_h_l2905_c40_82b0_pc <= VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_pc;
     jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_return_output := jsr_uxn_opcodes_h_l2905_c40_82b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_6823] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_369a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_369a_return_output;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_6823_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue := VAR_jsr_uxn_opcodes_h_l2905_c40_82b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_b200] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output;

     -- jsr2[uxn_opcodes_h_l2906_c40_3b2e] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase <= VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_phase;
     jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins <= VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_ins;
     jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc <= VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_pc;
     jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output := jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_982e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_982e_return_output;
     VAR_sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_b200_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue := VAR_jsr2_uxn_opcodes_h_l2906_c40_3b2e_return_output;
     -- sth[uxn_opcodes_h_l2907_c40_90ef] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2907_c40_90ef_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2907_c40_90ef_phase <= VAR_sth_uxn_opcodes_h_l2907_c40_90ef_phase;
     sth_uxn_opcodes_h_l2907_c40_90ef_ins <= VAR_sth_uxn_opcodes_h_l2907_c40_90ef_ins;
     sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2907_c40_90ef_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2907_c40_90ef_return_output := sth_uxn_opcodes_h_l2907_c40_90ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_13d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_b3d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output;
     VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_13d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue := VAR_sth_uxn_opcodes_h_l2907_c40_90ef_return_output;
     -- sth2[uxn_opcodes_h_l2908_c40_32dc] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2908_c40_32dc_phase <= VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_phase;
     sth2_uxn_opcodes_h_l2908_c40_32dc_ins <= VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_ins;
     sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_return_output := sth2_uxn_opcodes_h_l2908_c40_32dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_162c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_5af3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_162c_return_output;
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_5af3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue := VAR_sth2_uxn_opcodes_h_l2908_c40_32dc_return_output;
     -- ldz[uxn_opcodes_h_l2909_c40_6d79] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2909_c40_6d79_phase <= VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_phase;
     ldz_uxn_opcodes_h_l2909_c40_6d79_ins <= VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_ins;
     ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_stack_read;
     ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_return_output := ldz_uxn_opcodes_h_l2909_c40_6d79_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_571b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_0b03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_571b_return_output;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_0b03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue := VAR_ldz_uxn_opcodes_h_l2909_c40_6d79_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_d1b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output;

     -- ldz2[uxn_opcodes_h_l2910_c40_03fe] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2910_c40_03fe_phase <= VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_phase;
     ldz2_uxn_opcodes_h_l2910_c40_03fe_ins <= VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_ins;
     ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_stack_read;
     ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output := ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_786f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_786f_return_output;
     VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_d1b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue := VAR_ldz2_uxn_opcodes_h_l2910_c40_03fe_return_output;
     -- stz[uxn_opcodes_h_l2911_c40_a7bb] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2911_c40_a7bb_phase <= VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_phase;
     stz_uxn_opcodes_h_l2911_c40_a7bb_ins <= VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_ins;
     stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_return_output := stz_uxn_opcodes_h_l2911_c40_a7bb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_9c83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_f9a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output;
     VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_f9a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue := VAR_stz_uxn_opcodes_h_l2911_c40_a7bb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_e1fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output;

     -- stz2[uxn_opcodes_h_l2912_c40_c44e] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2912_c40_c44e_phase <= VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_phase;
     stz2_uxn_opcodes_h_l2912_c40_c44e_ins <= VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_ins;
     stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_return_output := stz2_uxn_opcodes_h_l2912_c40_c44e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_987d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_987d_return_output;
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_e1fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue := VAR_stz2_uxn_opcodes_h_l2912_c40_c44e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_b926] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_8b05] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output;

     -- ldr[uxn_opcodes_h_l2913_c40_7dc0] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2913_c40_7dc0_phase <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_phase;
     ldr_uxn_opcodes_h_l2913_c40_7dc0_ins <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_ins;
     ldr_uxn_opcodes_h_l2913_c40_7dc0_pc <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_pc;
     ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_stack_read;
     ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output := ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_b926_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue := VAR_ldr_uxn_opcodes_h_l2913_c40_7dc0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_a1b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output;

     -- ldr2[uxn_opcodes_h_l2914_c40_228e] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2914_c40_228e_phase <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_phase;
     ldr2_uxn_opcodes_h_l2914_c40_228e_ins <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_ins;
     ldr2_uxn_opcodes_h_l2914_c40_228e_pc <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_pc;
     ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_stack_read;
     ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_return_output := ldr2_uxn_opcodes_h_l2914_c40_228e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_107d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output;
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_107d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue := VAR_ldr2_uxn_opcodes_h_l2914_c40_228e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_2128] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_2c19] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output;

     -- str1[uxn_opcodes_h_l2915_c40_8eee] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2915_c40_8eee_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2915_c40_8eee_phase <= VAR_str1_uxn_opcodes_h_l2915_c40_8eee_phase;
     str1_uxn_opcodes_h_l2915_c40_8eee_ins <= VAR_str1_uxn_opcodes_h_l2915_c40_8eee_ins;
     str1_uxn_opcodes_h_l2915_c40_8eee_pc <= VAR_str1_uxn_opcodes_h_l2915_c40_8eee_pc;
     str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2915_c40_8eee_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2915_c40_8eee_return_output := str1_uxn_opcodes_h_l2915_c40_8eee_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_2128_return_output;
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_2c19_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue := VAR_str1_uxn_opcodes_h_l2915_c40_8eee_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7818] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_a928] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output;

     -- str2[uxn_opcodes_h_l2916_c40_bc16] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2916_c40_bc16_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2916_c40_bc16_phase <= VAR_str2_uxn_opcodes_h_l2916_c40_bc16_phase;
     str2_uxn_opcodes_h_l2916_c40_bc16_ins <= VAR_str2_uxn_opcodes_h_l2916_c40_bc16_ins;
     str2_uxn_opcodes_h_l2916_c40_bc16_pc <= VAR_str2_uxn_opcodes_h_l2916_c40_bc16_pc;
     str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2916_c40_bc16_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2916_c40_bc16_return_output := str2_uxn_opcodes_h_l2916_c40_bc16_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_a928_return_output;
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7818_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue := VAR_str2_uxn_opcodes_h_l2916_c40_bc16_return_output;
     -- lda[uxn_opcodes_h_l2917_c40_0cc6] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2917_c40_0cc6_phase <= VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_phase;
     lda_uxn_opcodes_h_l2917_c40_0cc6_ins <= VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_ins;
     lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_stack_read;
     lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_return_output := lda_uxn_opcodes_h_l2917_c40_0cc6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_c545] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_9df6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_c545_return_output;
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_9df6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue := VAR_lda_uxn_opcodes_h_l2917_c40_0cc6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_8357] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output;

     -- lda2[uxn_opcodes_h_l2918_c40_3c0d] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2918_c40_3c0d_phase <= VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_phase;
     lda2_uxn_opcodes_h_l2918_c40_3c0d_ins <= VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_ins;
     lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_stack_read;
     lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output := lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_bda3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output;
     VAR_sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_8357_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue := VAR_lda2_uxn_opcodes_h_l2918_c40_3c0d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_992e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_c6b1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output;

     -- sta[uxn_opcodes_h_l2919_c40_1eee] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2919_c40_1eee_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2919_c40_1eee_phase <= VAR_sta_uxn_opcodes_h_l2919_c40_1eee_phase;
     sta_uxn_opcodes_h_l2919_c40_1eee_ins <= VAR_sta_uxn_opcodes_h_l2919_c40_1eee_ins;
     sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2919_c40_1eee_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2919_c40_1eee_return_output := sta_uxn_opcodes_h_l2919_c40_1eee_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_992e_return_output;
     VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_c6b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue := VAR_sta_uxn_opcodes_h_l2919_c40_1eee_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_f290] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_0d4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output;

     -- sta2[uxn_opcodes_h_l2920_c40_80a8] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2920_c40_80a8_phase <= VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_phase;
     sta2_uxn_opcodes_h_l2920_c40_80a8_ins <= VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_ins;
     sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_return_output := sta2_uxn_opcodes_h_l2920_c40_80a8_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output;
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_f290_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue := VAR_sta2_uxn_opcodes_h_l2920_c40_80a8_return_output;
     -- dei[uxn_opcodes_h_l2921_c40_b717] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2921_c40_b717_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2921_c40_b717_phase <= VAR_dei_uxn_opcodes_h_l2921_c40_b717_phase;
     dei_uxn_opcodes_h_l2921_c40_b717_ins <= VAR_dei_uxn_opcodes_h_l2921_c40_b717_ins;
     dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_stack_read;
     dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2921_c40_b717_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2921_c40_b717_return_output := dei_uxn_opcodes_h_l2921_c40_b717_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_6879] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_f194] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_6879_return_output;
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_f194_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue := VAR_dei_uxn_opcodes_h_l2921_c40_b717_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_89df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_fd02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output;

     -- dei2[uxn_opcodes_h_l2922_c40_68d4] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2922_c40_68d4_phase <= VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_phase;
     dei2_uxn_opcodes_h_l2922_c40_68d4_ins <= VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_ins;
     dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_stack_read;
     dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_return_output := dei2_uxn_opcodes_h_l2922_c40_68d4_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output;
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_89df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue := VAR_dei2_uxn_opcodes_h_l2922_c40_68d4_return_output;
     -- deo[uxn_opcodes_h_l2923_c40_0529] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2923_c40_0529_phase <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_phase;
     deo_uxn_opcodes_h_l2923_c40_0529_ins <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_ins;
     deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_stack_read;
     deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_device_ram_read;
     deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_0529_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2923_c40_0529_return_output := deo_uxn_opcodes_h_l2923_c40_0529_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2226] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_dc80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output;
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2226_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue := VAR_deo_uxn_opcodes_h_l2923_c40_0529_return_output;
     -- deo2[uxn_opcodes_h_l2924_c40_c4f4] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2924_c40_c4f4_phase <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_phase;
     deo2_uxn_opcodes_h_l2924_c40_c4f4_ins <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_ins;
     deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_stack_read;
     deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output := deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_facd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_5fdb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output;
     VAR_add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_facd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue := VAR_deo2_uxn_opcodes_h_l2924_c40_c4f4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_9917] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_586f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output;

     -- add[uxn_opcodes_h_l2925_c40_32b6] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2925_c40_32b6_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2925_c40_32b6_phase <= VAR_add_uxn_opcodes_h_l2925_c40_32b6_phase;
     add_uxn_opcodes_h_l2925_c40_32b6_ins <= VAR_add_uxn_opcodes_h_l2925_c40_32b6_ins;
     add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read <= VAR_add_uxn_opcodes_h_l2925_c40_32b6_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2925_c40_32b6_return_output := add_uxn_opcodes_h_l2925_c40_32b6_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_586f_return_output;
     VAR_add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_9917_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue := VAR_add_uxn_opcodes_h_l2925_c40_32b6_return_output;
     -- add2[uxn_opcodes_h_l2926_c40_1e65] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2926_c40_1e65_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2926_c40_1e65_phase <= VAR_add2_uxn_opcodes_h_l2926_c40_1e65_phase;
     add2_uxn_opcodes_h_l2926_c40_1e65_ins <= VAR_add2_uxn_opcodes_h_l2926_c40_1e65_ins;
     add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2926_c40_1e65_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2926_c40_1e65_return_output := add2_uxn_opcodes_h_l2926_c40_1e65_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_1f6e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e7e2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output;
     VAR_sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_1f6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue := VAR_add2_uxn_opcodes_h_l2926_c40_1e65_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_3a23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_21d1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output;

     -- sub[uxn_opcodes_h_l2927_c40_5857] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2927_c40_5857_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2927_c40_5857_phase <= VAR_sub_uxn_opcodes_h_l2927_c40_5857_phase;
     sub_uxn_opcodes_h_l2927_c40_5857_ins <= VAR_sub_uxn_opcodes_h_l2927_c40_5857_ins;
     sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2927_c40_5857_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2927_c40_5857_return_output := sub_uxn_opcodes_h_l2927_c40_5857_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output;
     VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_21d1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue := VAR_sub_uxn_opcodes_h_l2927_c40_5857_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_8ae2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_1294] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output;

     -- sub2[uxn_opcodes_h_l2928_c40_ce79] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2928_c40_ce79_phase <= VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_phase;
     sub2_uxn_opcodes_h_l2928_c40_ce79_ins <= VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_ins;
     sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_return_output := sub2_uxn_opcodes_h_l2928_c40_ce79_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_1294_return_output;
     VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_8ae2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue := VAR_sub2_uxn_opcodes_h_l2928_c40_ce79_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_ac19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output;

     -- mul[uxn_opcodes_h_l2929_c40_f9bf] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2929_c40_f9bf_phase <= VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_phase;
     mul_uxn_opcodes_h_l2929_c40_f9bf_ins <= VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_ins;
     mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_return_output := mul_uxn_opcodes_h_l2929_c40_f9bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_ea1d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output;
     VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_ea1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue := VAR_mul_uxn_opcodes_h_l2929_c40_f9bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_91ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output;

     -- mul2[uxn_opcodes_h_l2930_c40_24d5] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2930_c40_24d5_phase <= VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_phase;
     mul2_uxn_opcodes_h_l2930_c40_24d5_ins <= VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_ins;
     mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_return_output := mul2_uxn_opcodes_h_l2930_c40_24d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_e8c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output;
     VAR_div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_e8c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue := VAR_mul2_uxn_opcodes_h_l2930_c40_24d5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_21e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_b5bd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output;

     -- div[uxn_opcodes_h_l2931_c40_9810] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2931_c40_9810_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2931_c40_9810_phase <= VAR_div_uxn_opcodes_h_l2931_c40_9810_phase;
     div_uxn_opcodes_h_l2931_c40_9810_ins <= VAR_div_uxn_opcodes_h_l2931_c40_9810_ins;
     div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read <= VAR_div_uxn_opcodes_h_l2931_c40_9810_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2931_c40_9810_return_output := div_uxn_opcodes_h_l2931_c40_9810_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output;
     VAR_div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_21e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue := VAR_div_uxn_opcodes_h_l2931_c40_9810_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_b245] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a682] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output;

     -- div2[uxn_opcodes_h_l2932_c40_7769] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2932_c40_7769_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2932_c40_7769_phase <= VAR_div2_uxn_opcodes_h_l2932_c40_7769_phase;
     div2_uxn_opcodes_h_l2932_c40_7769_ins <= VAR_div2_uxn_opcodes_h_l2932_c40_7769_ins;
     div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2932_c40_7769_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2932_c40_7769_return_output := div2_uxn_opcodes_h_l2932_c40_7769_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a682_return_output;
     VAR_and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_b245_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue := VAR_div2_uxn_opcodes_h_l2932_c40_7769_return_output;
     -- and[uxn_opcodes_h_l2933_c40_f2ab] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2933_c40_f2ab_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2933_c40_f2ab_phase <= VAR_and_uxn_opcodes_h_l2933_c40_f2ab_phase;
     and_uxn_opcodes_h_l2933_c40_f2ab_ins <= VAR_and_uxn_opcodes_h_l2933_c40_f2ab_ins;
     and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read <= VAR_and_uxn_opcodes_h_l2933_c40_f2ab_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2933_c40_f2ab_return_output := and_uxn_opcodes_h_l2933_c40_f2ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_0d07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_f55c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output;
     VAR_and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_f55c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue := VAR_and_uxn_opcodes_h_l2933_c40_f2ab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_f3b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_509b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output;

     -- and2[uxn_opcodes_h_l2934_c40_343e] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2934_c40_343e_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2934_c40_343e_phase <= VAR_and2_uxn_opcodes_h_l2934_c40_343e_phase;
     and2_uxn_opcodes_h_l2934_c40_343e_ins <= VAR_and2_uxn_opcodes_h_l2934_c40_343e_ins;
     and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2934_c40_343e_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2934_c40_343e_return_output := and2_uxn_opcodes_h_l2934_c40_343e_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_509b_return_output;
     VAR_ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_f3b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue := VAR_and2_uxn_opcodes_h_l2934_c40_343e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_11ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_6cbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output;

     -- ora[uxn_opcodes_h_l2935_c40_9289] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2935_c40_9289_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2935_c40_9289_phase <= VAR_ora_uxn_opcodes_h_l2935_c40_9289_phase;
     ora_uxn_opcodes_h_l2935_c40_9289_ins <= VAR_ora_uxn_opcodes_h_l2935_c40_9289_ins;
     ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2935_c40_9289_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2935_c40_9289_return_output := ora_uxn_opcodes_h_l2935_c40_9289_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output;
     VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_11ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue := VAR_ora_uxn_opcodes_h_l2935_c40_9289_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_fa79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_242d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output;

     -- ora2[uxn_opcodes_h_l2936_c40_fb57] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2936_c40_fb57_phase <= VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_phase;
     ora2_uxn_opcodes_h_l2936_c40_fb57_ins <= VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_ins;
     ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_return_output := ora2_uxn_opcodes_h_l2936_c40_fb57_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output;
     VAR_eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_242d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue := VAR_ora2_uxn_opcodes_h_l2936_c40_fb57_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_941d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output;

     -- eor[uxn_opcodes_h_l2937_c40_e1df] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2937_c40_e1df_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2937_c40_e1df_phase <= VAR_eor_uxn_opcodes_h_l2937_c40_e1df_phase;
     eor_uxn_opcodes_h_l2937_c40_e1df_ins <= VAR_eor_uxn_opcodes_h_l2937_c40_e1df_ins;
     eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2937_c40_e1df_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2937_c40_e1df_return_output := eor_uxn_opcodes_h_l2937_c40_e1df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_1f27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_941d_return_output;
     VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_1f27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue := VAR_eor_uxn_opcodes_h_l2937_c40_e1df_return_output;
     -- eor2[uxn_opcodes_h_l2938_c40_d05f] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2938_c40_d05f_phase <= VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_phase;
     eor2_uxn_opcodes_h_l2938_c40_d05f_ins <= VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_ins;
     eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_return_output := eor2_uxn_opcodes_h_l2938_c40_d05f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_95f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_5998] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output;
     VAR_sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_5998_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue := VAR_eor2_uxn_opcodes_h_l2938_c40_d05f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_c8a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output;

     -- sft[uxn_opcodes_h_l2939_c40_6052] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2939_c40_6052_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2939_c40_6052_phase <= VAR_sft_uxn_opcodes_h_l2939_c40_6052_phase;
     sft_uxn_opcodes_h_l2939_c40_6052_ins <= VAR_sft_uxn_opcodes_h_l2939_c40_6052_ins;
     sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2939_c40_6052_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2939_c40_6052_return_output := sft_uxn_opcodes_h_l2939_c40_6052_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_c8a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue := VAR_sft_uxn_opcodes_h_l2939_c40_6052_return_output;
     -- sft2[uxn_opcodes_h_l2940_c40_331d] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2940_c40_331d_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2940_c40_331d_phase <= VAR_sft2_uxn_opcodes_h_l2940_c40_331d_phase;
     sft2_uxn_opcodes_h_l2940_c40_331d_ins <= VAR_sft2_uxn_opcodes_h_l2940_c40_331d_ins;
     sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2940_c40_331d_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2940_c40_331d_return_output := sft2_uxn_opcodes_h_l2940_c40_331d_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue := VAR_sft2_uxn_opcodes_h_l2940_c40_331d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_95f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_95f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_941d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_941d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_fa79] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_fa79_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_6cbe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_6cbe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_509b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_509b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_0d07] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0d07_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_a682] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a682_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_b5bd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_b5bd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_91ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_91ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_ac19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_ac19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_1294] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_1294_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_3a23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_3a23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_e7e2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e7e2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_586f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_586f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_5fdb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_5fdb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_dc80] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_dc80_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_fd02] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_fd02_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_6879] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_6879_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_0d4d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_0d4d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_992e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_992e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_bda3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_bda3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_c545] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_c545_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_a928] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_a928_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_2128] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_2128_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_a1b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_a1b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_8b05] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_8b05_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_987d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_987d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_9c83] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_9c83_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_786f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_786f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_571b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_571b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_162c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_162c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_b3d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_b3d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_982e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_982e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_369a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_369a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_c2be] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_c2be_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_f987] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_f987_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_1c99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_1c99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_e2d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_e2d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_e885] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e885_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_4d69] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_4d69_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_9c1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_9c1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_9269] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_9269_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_54c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_54c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_ad3d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_ad3d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_89a0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_89a0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_15e5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_15e5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_0fa9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_0fa9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_2fdb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_2fdb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_771f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_771f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_2dfe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_2dfe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_b168] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_b168_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_66eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_66eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_2d36] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_2d36_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_5fa9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_5fa9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_161b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_161b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_7d1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_7d1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_315e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_315e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_6614] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_6614_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_5890] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_5890_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_2731] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2731_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_a2c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_a2c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_6648] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_6648_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_af6a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_af6a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_f6e1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_f6e1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_93fc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_93fc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_f385] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f385_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_5dad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_5dad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_a425] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_a425_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_72c1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_72c1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c2_f554] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_5777 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_5777_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2966_c34_97d8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_97d8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2963_c34_c413] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_c413_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2965_c33_b78e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_b78e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2969_c32_a778] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_a778_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2964_c30_60eb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_60eb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2956_l2968_DUPLICATE_cae1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2956_l2968_DUPLICATE_cae1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2961_c39_2bc0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_2bc0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2957_c3_bb72] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_bb72_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2951_c68_5bf1] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_5bf1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2962_c40_cb48] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_cb48_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2967_c37_a4d3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_a4d3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2943_c17_146a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_146a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_f554_return_output.is_stack_index_flipped;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_146a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_bb72_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2956_l2968_DUPLICATE_cae1_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_642a LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_642a_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_f554_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_2bc0_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_cb48_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_c413_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_60eb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_b78e_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_97d8_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_a4d3_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2956_l2968_DUPLICATE_cae1_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_a778_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_132a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_left;
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output := BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c58_54f3] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_54f3_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_5bf1_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_a73f LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_a73f_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_5777_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2951_c29_6335_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c20_f785_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_132a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_a73f_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_a73f_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_54f3_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_642a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_642a_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_978b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output;

     -- MUX[uxn_opcodes_h_l2952_c20_f785] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c20_f785_cond <= VAR_MUX_uxn_opcodes_h_l2952_c20_f785_cond;
     MUX_uxn_opcodes_h_l2952_c20_f785_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iftrue;
     MUX_uxn_opcodes_h_l2952_c20_f785_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c20_f785_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c20_f785_return_output := MUX_uxn_opcodes_h_l2952_c20_f785_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_ca9a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2946_c3_a1e7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_978b_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2948_c3_d26a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_ca9a_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right := VAR_MUX_uxn_opcodes_h_l2952_c20_f785_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse := VAR_sp0_uxn_opcodes_h_l2948_c3_d26a;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue := VAR_sp1_uxn_opcodes_h_l2946_c3_a1e7;
     -- sp0_MUX[uxn_opcodes_h_l2945_c2_3380] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_cond;
     sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue;
     sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output := sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2945_c2_3380] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_cond;
     sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iftrue;
     sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output := sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;
     VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_3380_return_output;
     -- MUX[uxn_opcodes_h_l2951_c29_6335] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2951_c29_6335_cond <= VAR_MUX_uxn_opcodes_h_l2951_c29_6335_cond;
     MUX_uxn_opcodes_h_l2951_c29_6335_iftrue <= VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iftrue;
     MUX_uxn_opcodes_h_l2951_c29_6335_iffalse <= VAR_MUX_uxn_opcodes_h_l2951_c29_6335_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2951_c29_6335_return_output := MUX_uxn_opcodes_h_l2951_c29_6335_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c19_d96f] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_d96f_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2951_c29_6335_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_d96f_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_6d9b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_6d9b_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_b214] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2952_c2_3315 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_b214_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_3315;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_3315;
     -- stack_ram_update[uxn_opcodes_h_l2954_c24_7fe1] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_stack_address;
     stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_value;
     stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output := stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_7fe1_return_output;
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
