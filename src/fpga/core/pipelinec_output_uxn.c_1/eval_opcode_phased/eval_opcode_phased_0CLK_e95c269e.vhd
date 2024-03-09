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
entity eval_opcode_phased_0CLK_e95c269e is
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
end eval_opcode_phased_0CLK_e95c269e;
architecture arch of eval_opcode_phased_0CLK_e95c269e is
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
-- BIN_OP_AND[uxn_opcodes_h_l2865_c14_b0b7]
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2866_c14_e2d2]
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2866_c14_938e]
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2866_c14_e010]
signal UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2866_c14_bbe6]
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2866_c14_761e]
signal MUX_uxn_opcodes_h_l2866_c14_761e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_761e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_761e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2866_c14_761e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2867_c8_a247]
signal MUX_uxn_opcodes_h_l2867_c8_a247_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_a247_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_a247_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2867_c8_a247_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c6_89ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_eb0a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2873_c2_e5fa]
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c2_e5fa]
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2873_c48_0b1d]
signal brk_uxn_opcodes_h_l2873_c48_0b1d_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2873_c48_0b1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_d299]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_c027]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_e3a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_eb0a]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2874_c40_2a5e]
signal jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_2a5e_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_2a5e_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2874_c40_2a5e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_cf29]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_1cf0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_aa9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_e3a4]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2875_c40_5075]
signal jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_5075_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_5075_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2875_c40_5075_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_56af]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_4c70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_8bee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_aa9a]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2876_c40_750a]
signal jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_750a_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_750a_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2876_c40_750a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_00d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_57c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_6e11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_8bee]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_5d24]
signal lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_5d24_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_5d24_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_5d24_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_9a2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_e75e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_fa94]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_6e11]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_0290]
signal lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_0290_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_0290_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_0290_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_a9d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_b121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_7099]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_fa94]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2879_c40_5958]
signal lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_5958_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_5958_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2879_c40_5958_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_af53]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_7964]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_25b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_7099]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2880_c40_c010]
signal lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_c010_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_c010_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2880_c40_c010_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_f935]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_ec5a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_08bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_25b6]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2881_c40_40fb]
signal inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_40fb_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_40fb_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2881_c40_40fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_e3a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_432f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_876c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_08bf]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2882_c40_dc22]
signal inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_dc22_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_dc22_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2882_c40_dc22_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_4f75]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_93b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_e7f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_876c]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2883_c40_686d]
signal pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_686d_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_686d_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2883_c40_686d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_07c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_ec6c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_6046]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_e7f0]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2884_c40_076e]
signal pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_076e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_076e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2884_c40_076e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_a666]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_1d44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_3ef3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_6046]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2885_c40_2f8c]
signal nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_2f8c_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_2f8c_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2885_c40_2f8c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_ca0d]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_b17e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_253c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_3ef3]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2886_c40_6713]
signal nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_6713_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_6713_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2886_c40_6713_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_0314]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_59cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3e96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_253c]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2887_c40_fba3]
signal swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_fba3_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_fba3_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2887_c40_fba3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_9976]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_827c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_a979]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_3e96]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2888_c40_b690]
signal swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_b690_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_b690_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2888_c40_b690_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_cffd]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_3bc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_c45b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_a979]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2889_c40_9e60]
signal rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_9e60_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_9e60_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2889_c40_9e60_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_1270]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_9fc8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_3a46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_c45b]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2890_c40_6298]
signal rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_6298_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_6298_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2890_c40_6298_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4e6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_8d41]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_bfef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_3a46]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2891_c40_5ad6]
signal dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_5ad6_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_5ad6_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2891_c40_5ad6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_6074]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_8b4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_16f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_bfef]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2892_c40_6228]
signal dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_6228_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_6228_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2892_c40_6228_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_1ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_0655]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_e9d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_16f7]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2893_c40_ee84]
signal ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_ee84_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_ee84_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2893_c40_ee84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_069f]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_ff17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_baa3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_e9d6]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2894_c40_2428]
signal ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_2428_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_2428_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2894_c40_2428_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_c6a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_9e8a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_94eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_baa3]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2895_c40_849c]
signal equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_849c_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_849c_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2895_c40_849c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_6836]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_31fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_6fb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_94eb]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2896_c40_8ec2]
signal equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_8ec2_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_8ec2_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_b7da]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_08ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_6c79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_6fb0]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2897_c40_8885]
signal neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_8885_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_8885_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2897_c40_8885_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_4a71]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_b876]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_8aee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_6c79]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2898_c40_9d23]
signal neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_9d23_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_9d23_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2898_c40_9d23_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1521]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_255f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_4517]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_8aee]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2899_c40_f9c7]
signal gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_f9c7_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_f9c7_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2899_c40_f9c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_c83c]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_6d25]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_8be1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_4517]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2900_c40_b5e9]
signal gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_b5e9_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_b5e9_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_fdbe]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_925f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e863]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_8be1]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2901_c40_f86f]
signal lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_f86f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_f86f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2901_c40_f86f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_f8e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_bf35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_cb28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_e863]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2902_c40_0a3f]
signal lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_0a3f_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_0a3f_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_3469]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_fb82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_dc1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_cb28]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2903_c40_5efb]
signal jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_5efb_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_5efb_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_5efb_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2903_c40_5efb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_3b08]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_2649]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_800d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_dc1e]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2904_c40_4f65]
signal jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_4f65_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_4f65_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_a0ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_c358]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_918a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_800d]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2905_c40_ebf1]
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_d0b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_3483]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_4684]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_918a]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2906_c40_d3d8]
signal jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_a6f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_3ff6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_37bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_4684]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2907_c40_c807]
signal jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_c807_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_c807_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_c807_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2907_c40_c807_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_f589]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f89f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_11f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_37bf]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2908_c40_ca50]
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_5ffb]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_880a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_a5a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_11f0]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2909_c40_bc38]
signal sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_bc38_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_bc38_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2909_c40_bc38_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_b996]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_16f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_2324]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_a5a2]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2910_c40_1e40]
signal sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_1e40_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_1e40_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2910_c40_1e40_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_60f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_af99]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_4ca5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_2324]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2911_c40_7127]
signal ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_7127_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_7127_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2911_c40_7127_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ed09]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_fbf3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_0501]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_4ca5]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2912_c40_7b48]
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_7cb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2f53]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_c861]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_0501]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2913_c40_4e16]
signal stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_4e16_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_4e16_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2913_c40_4e16_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_96da]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_0af3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_77c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_c861]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2914_c40_e2e7]
signal stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_e2e7_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_e2e7_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_1724]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_75fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_084e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_77c0]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2915_c40_1eb6]
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_03d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_f63c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_f137]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_084e]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2916_c40_e108]
signal ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2916_c40_e108_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_0026]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_b96c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_6bcc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_f137]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2917_c40_2738]
signal str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_2738_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_2738_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_2738_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2917_c40_2738_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_0154]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_b80c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_e163]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_6bcc]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2918_c40_9941]
signal str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_9941_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_9941_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_9941_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2918_c40_9941_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_fc4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_97ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_d45e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_e163]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2919_c40_1df0]
signal lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_1df0_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_1df0_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2919_c40_1df0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_c952]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b707]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_00d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_d45e]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2920_c40_2567]
signal lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_2567_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_2567_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2920_c40_2567_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_0608]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_c1d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_57fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_00d5]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2921_c40_1389]
signal sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_1389_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_1389_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2921_c40_1389_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_6a6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6e93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f519]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_57fb]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2922_c40_5d90]
signal sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_5d90_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_5d90_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2922_c40_5d90_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_81ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_0e51]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_752c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_f519]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2923_c40_5ab8]
signal dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1 : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2923_c40_5ab8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_be4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_8e24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_d9f5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_752c]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2924_c40_9e96]
signal dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1 : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2924_c40_9e96_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_732f]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_8a0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_7103]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_d9f5]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2925_c40_cf9f]
signal deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_phase : unsigned(11 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2925_c40_cf9f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_f8ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_ccc0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_3e40]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_7103]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2926_c40_5956]
signal deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_phase : unsigned(11 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2926_c40_5956_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_b3b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_78c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e957]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_3e40]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2927_c40_ea22]
signal add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2927_c40_ea22_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_ea22_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2927_c40_ea22_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_74c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_6029]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_26ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_e957]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2928_c40_711d]
signal add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_711d_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_711d_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2928_c40_711d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_4609]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_3a6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b966]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_26ab]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output : opcode_result_t;

-- sub1[uxn_opcodes_h_l2929_c40_3376]
signal sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_3376_phase : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_3376_ins : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read : unsigned(7 downto 0);
signal sub1_uxn_opcodes_h_l2929_c40_3376_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_60ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_5b73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_9044]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_b966]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2930_c40_b8ad]
signal sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_b8ad_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_b8ad_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_e4d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_2a0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_950e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_9044]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2931_c40_43e9]
signal mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_43e9_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_43e9_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2931_c40_43e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_ea5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_c454]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_10c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_950e]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2932_c40_54fc]
signal mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_54fc_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_54fc_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2932_c40_54fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f851]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_2a9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_dbf1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_10c5]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2933_c40_d596]
signal div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2933_c40_d596_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_d596_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2933_c40_d596_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_19b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_3398]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_36c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_dbf1]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2934_c40_288e]
signal div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_288e_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_288e_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2934_c40_288e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_83cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_a4e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_77b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_36c4]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2935_c40_c330]
signal and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c330_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c330_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2935_c40_c330_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_3759]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_63bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_5f0a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_77b7]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2936_c40_7d83]
signal and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_7d83_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_7d83_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2936_c40_7d83_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_8f91]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_1f8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_432d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_5f0a]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2937_c40_8f8d]
signal ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_8f8d_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_8f8d_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2937_c40_8f8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_4c6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_643c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_7e9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_432d]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2938_c40_f24f]
signal ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_f24f_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_f24f_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2938_c40_f24f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_63ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_2fe0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_6ea6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_7e9e]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2939_c40_7116]
signal eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_7116_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_7116_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2939_c40_7116_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_df83]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_9fb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_abef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_6ea6]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2940_c40_3762]
signal eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_3762_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_3762_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2940_c40_3762_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_ee59]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_96d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_7dac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_abef]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2941_c40_36e1]
signal sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_36e1_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_36e1_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2941_c40_36e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_b023]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_5209]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_7dac]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2942_c40_93c0]
signal sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_93c0_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_93c0_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2942_c40_93c0_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2944_c16_6aa7]
signal CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2945_c2_19c1]
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2947_c2_1689]
signal sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2947_c2_1689]
signal sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_94c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2950_c3_9471]
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2953_c29_83c2]
signal MUX_uxn_opcodes_h_l2953_c29_83c2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2953_c29_83c2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2953_c19_f6cb]
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2954_c20_4e8b]
signal MUX_uxn_opcodes_h_l2954_c20_4e8b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output : unsigned(8 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2954_c2_b0b4]
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right : unsigned(8 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output : unsigned(8 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2956_c24_64fd]
signal stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7
BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left,
BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right,
BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left,
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right,
BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e
BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left,
BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right,
BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left,
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right,
BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output);

-- MUX_uxn_opcodes_h_l2866_c14_761e
MUX_uxn_opcodes_h_l2866_c14_761e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2866_c14_761e_cond,
MUX_uxn_opcodes_h_l2866_c14_761e_iftrue,
MUX_uxn_opcodes_h_l2866_c14_761e_iffalse,
MUX_uxn_opcodes_h_l2866_c14_761e_return_output);

-- MUX_uxn_opcodes_h_l2867_c8_a247
MUX_uxn_opcodes_h_l2867_c8_a247 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2867_c8_a247_cond,
MUX_uxn_opcodes_h_l2867_c8_a247_iftrue,
MUX_uxn_opcodes_h_l2867_c8_a247_iffalse,
MUX_uxn_opcodes_h_l2867_c8_a247_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa
is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond,
is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue,
is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse,
is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa
opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output);

-- brk_uxn_opcodes_h_l2873_c48_0b1d
brk_uxn_opcodes_h_l2873_c48_0b1d : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2873_c48_0b1d_phase,
brk_uxn_opcodes_h_l2873_c48_0b1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a
opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output);

-- jci_uxn_opcodes_h_l2874_c40_2a5e
jci_uxn_opcodes_h_l2874_c40_2a5e : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2874_c40_2a5e_phase,
jci_uxn_opcodes_h_l2874_c40_2a5e_pc,
jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read,
jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read,
jci_uxn_opcodes_h_l2874_c40_2a5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4
opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output);

-- jmi_uxn_opcodes_h_l2875_c40_5075
jmi_uxn_opcodes_h_l2875_c40_5075 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2875_c40_5075_phase,
jmi_uxn_opcodes_h_l2875_c40_5075_pc,
jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read,
jmi_uxn_opcodes_h_l2875_c40_5075_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a
opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output);

-- jsi_uxn_opcodes_h_l2876_c40_750a
jsi_uxn_opcodes_h_l2876_c40_750a : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2876_c40_750a_phase,
jsi_uxn_opcodes_h_l2876_c40_750a_pc,
jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read,
jsi_uxn_opcodes_h_l2876_c40_750a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee
opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output);

-- lit_uxn_opcodes_h_l2877_c40_5d24
lit_uxn_opcodes_h_l2877_c40_5d24 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_5d24_phase,
lit_uxn_opcodes_h_l2877_c40_5d24_pc,
lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_5d24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11
opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_0290
lit2_uxn_opcodes_h_l2878_c40_0290 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_0290_phase,
lit2_uxn_opcodes_h_l2878_c40_0290_pc,
lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_0290_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94
opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output);

-- lit_uxn_opcodes_h_l2879_c40_5958
lit_uxn_opcodes_h_l2879_c40_5958 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2879_c40_5958_phase,
lit_uxn_opcodes_h_l2879_c40_5958_pc,
lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read,
lit_uxn_opcodes_h_l2879_c40_5958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_7099
opc_result_MUX_uxn_opcodes_h_l2880_c7_7099 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output);

-- lit2_uxn_opcodes_h_l2880_c40_c010
lit2_uxn_opcodes_h_l2880_c40_c010 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2880_c40_c010_phase,
lit2_uxn_opcodes_h_l2880_c40_c010_pc,
lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read,
lit2_uxn_opcodes_h_l2880_c40_c010_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6
opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output);

-- inc_uxn_opcodes_h_l2881_c40_40fb
inc_uxn_opcodes_h_l2881_c40_40fb : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2881_c40_40fb_phase,
inc_uxn_opcodes_h_l2881_c40_40fb_ins,
inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read,
inc_uxn_opcodes_h_l2881_c40_40fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf
opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output);

-- inc2_uxn_opcodes_h_l2882_c40_dc22
inc2_uxn_opcodes_h_l2882_c40_dc22 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2882_c40_dc22_phase,
inc2_uxn_opcodes_h_l2882_c40_dc22_ins,
inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read,
inc2_uxn_opcodes_h_l2882_c40_dc22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_876c
opc_result_MUX_uxn_opcodes_h_l2883_c7_876c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output);

-- pop_uxn_opcodes_h_l2883_c40_686d
pop_uxn_opcodes_h_l2883_c40_686d : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2883_c40_686d_phase,
pop_uxn_opcodes_h_l2883_c40_686d_ins,
pop_uxn_opcodes_h_l2883_c40_686d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0
opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output);

-- pop2_uxn_opcodes_h_l2884_c40_076e
pop2_uxn_opcodes_h_l2884_c40_076e : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2884_c40_076e_phase,
pop2_uxn_opcodes_h_l2884_c40_076e_ins,
pop2_uxn_opcodes_h_l2884_c40_076e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_6046
opc_result_MUX_uxn_opcodes_h_l2885_c7_6046 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output);

-- nip_uxn_opcodes_h_l2885_c40_2f8c
nip_uxn_opcodes_h_l2885_c40_2f8c : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2885_c40_2f8c_phase,
nip_uxn_opcodes_h_l2885_c40_2f8c_ins,
nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read,
nip_uxn_opcodes_h_l2885_c40_2f8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3
opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output);

-- nip2_uxn_opcodes_h_l2886_c40_6713
nip2_uxn_opcodes_h_l2886_c40_6713 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2886_c40_6713_phase,
nip2_uxn_opcodes_h_l2886_c40_6713_ins,
nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read,
nip2_uxn_opcodes_h_l2886_c40_6713_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_253c
opc_result_MUX_uxn_opcodes_h_l2887_c7_253c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output);

-- swp_uxn_opcodes_h_l2887_c40_fba3
swp_uxn_opcodes_h_l2887_c40_fba3 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2887_c40_fba3_phase,
swp_uxn_opcodes_h_l2887_c40_fba3_ins,
swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read,
swp_uxn_opcodes_h_l2887_c40_fba3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96
opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output);

-- swp2_uxn_opcodes_h_l2888_c40_b690
swp2_uxn_opcodes_h_l2888_c40_b690 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2888_c40_b690_phase,
swp2_uxn_opcodes_h_l2888_c40_b690_ins,
swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read,
swp2_uxn_opcodes_h_l2888_c40_b690_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_a979
opc_result_MUX_uxn_opcodes_h_l2889_c7_a979 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output);

-- rot_uxn_opcodes_h_l2889_c40_9e60
rot_uxn_opcodes_h_l2889_c40_9e60 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2889_c40_9e60_phase,
rot_uxn_opcodes_h_l2889_c40_9e60_ins,
rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read,
rot_uxn_opcodes_h_l2889_c40_9e60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b
opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output);

-- rot2_uxn_opcodes_h_l2890_c40_6298
rot2_uxn_opcodes_h_l2890_c40_6298 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2890_c40_6298_phase,
rot2_uxn_opcodes_h_l2890_c40_6298_ins,
rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read,
rot2_uxn_opcodes_h_l2890_c40_6298_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46
opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output);

-- dup_uxn_opcodes_h_l2891_c40_5ad6
dup_uxn_opcodes_h_l2891_c40_5ad6 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2891_c40_5ad6_phase,
dup_uxn_opcodes_h_l2891_c40_5ad6_ins,
dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read,
dup_uxn_opcodes_h_l2891_c40_5ad6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef
opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output);

-- dup2_uxn_opcodes_h_l2892_c40_6228
dup2_uxn_opcodes_h_l2892_c40_6228 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2892_c40_6228_phase,
dup2_uxn_opcodes_h_l2892_c40_6228_ins,
dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read,
dup2_uxn_opcodes_h_l2892_c40_6228_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7
opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output);

-- ovr_uxn_opcodes_h_l2893_c40_ee84
ovr_uxn_opcodes_h_l2893_c40_ee84 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2893_c40_ee84_phase,
ovr_uxn_opcodes_h_l2893_c40_ee84_ins,
ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read,
ovr_uxn_opcodes_h_l2893_c40_ee84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6
opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output);

-- ovr2_uxn_opcodes_h_l2894_c40_2428
ovr2_uxn_opcodes_h_l2894_c40_2428 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2894_c40_2428_phase,
ovr2_uxn_opcodes_h_l2894_c40_2428_ins,
ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read,
ovr2_uxn_opcodes_h_l2894_c40_2428_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3
opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output);

-- equ_uxn_opcodes_h_l2895_c40_849c
equ_uxn_opcodes_h_l2895_c40_849c : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2895_c40_849c_phase,
equ_uxn_opcodes_h_l2895_c40_849c_ins,
equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read,
equ_uxn_opcodes_h_l2895_c40_849c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb
opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output);

-- equ2_uxn_opcodes_h_l2896_c40_8ec2
equ2_uxn_opcodes_h_l2896_c40_8ec2 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2896_c40_8ec2_phase,
equ2_uxn_opcodes_h_l2896_c40_8ec2_ins,
equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read,
equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output);

-- neq_uxn_opcodes_h_l2897_c40_8885
neq_uxn_opcodes_h_l2897_c40_8885 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2897_c40_8885_phase,
neq_uxn_opcodes_h_l2897_c40_8885_ins,
neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read,
neq_uxn_opcodes_h_l2897_c40_8885_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79
opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output);

-- neq2_uxn_opcodes_h_l2898_c40_9d23
neq2_uxn_opcodes_h_l2898_c40_9d23 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2898_c40_9d23_phase,
neq2_uxn_opcodes_h_l2898_c40_9d23_ins,
neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read,
neq2_uxn_opcodes_h_l2898_c40_9d23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee
opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output);

-- gth_uxn_opcodes_h_l2899_c40_f9c7
gth_uxn_opcodes_h_l2899_c40_f9c7 : entity work.gth_0CLK_441a128d port map (
clk,
gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2899_c40_f9c7_phase,
gth_uxn_opcodes_h_l2899_c40_f9c7_ins,
gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read,
gth_uxn_opcodes_h_l2899_c40_f9c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_4517
opc_result_MUX_uxn_opcodes_h_l2900_c7_4517 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output);

-- gth2_uxn_opcodes_h_l2900_c40_b5e9
gth2_uxn_opcodes_h_l2900_c40_b5e9 : entity work.gth2_0CLK_977cbcae port map (
clk,
gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2900_c40_b5e9_phase,
gth2_uxn_opcodes_h_l2900_c40_b5e9_ins,
gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read,
gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1
opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output);

-- lth_uxn_opcodes_h_l2901_c40_f86f
lth_uxn_opcodes_h_l2901_c40_f86f : entity work.lth_0CLK_441a128d port map (
clk,
lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2901_c40_f86f_phase,
lth_uxn_opcodes_h_l2901_c40_f86f_ins,
lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read,
lth_uxn_opcodes_h_l2901_c40_f86f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_e863
opc_result_MUX_uxn_opcodes_h_l2902_c7_e863 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output);

-- lth2_uxn_opcodes_h_l2902_c40_0a3f
lth2_uxn_opcodes_h_l2902_c40_0a3f : entity work.lth2_0CLK_977cbcae port map (
clk,
lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2902_c40_0a3f_phase,
lth2_uxn_opcodes_h_l2902_c40_0a3f_ins,
lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read,
lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28
opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output);

-- jmp_uxn_opcodes_h_l2903_c40_5efb
jmp_uxn_opcodes_h_l2903_c40_5efb : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2903_c40_5efb_phase,
jmp_uxn_opcodes_h_l2903_c40_5efb_ins,
jmp_uxn_opcodes_h_l2903_c40_5efb_pc,
jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read,
jmp_uxn_opcodes_h_l2903_c40_5efb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e
opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output);

-- jmp2_uxn_opcodes_h_l2904_c40_4f65
jmp2_uxn_opcodes_h_l2904_c40_4f65 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2904_c40_4f65_phase,
jmp2_uxn_opcodes_h_l2904_c40_4f65_ins,
jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read,
jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_800d
opc_result_MUX_uxn_opcodes_h_l2905_c7_800d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output);

-- jcn_uxn_opcodes_h_l2905_c40_ebf1
jcn_uxn_opcodes_h_l2905_c40_ebf1 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2905_c40_ebf1_phase,
jcn_uxn_opcodes_h_l2905_c40_ebf1_ins,
jcn_uxn_opcodes_h_l2905_c40_ebf1_pc,
jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read,
jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_918a
opc_result_MUX_uxn_opcodes_h_l2906_c7_918a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output);

-- jcn2_uxn_opcodes_h_l2906_c40_d3d8
jcn2_uxn_opcodes_h_l2906_c40_d3d8 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase,
jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins,
jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read,
jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_4684
opc_result_MUX_uxn_opcodes_h_l2907_c7_4684 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output);

-- jsr_uxn_opcodes_h_l2907_c40_c807
jsr_uxn_opcodes_h_l2907_c40_c807 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2907_c40_c807_phase,
jsr_uxn_opcodes_h_l2907_c40_c807_ins,
jsr_uxn_opcodes_h_l2907_c40_c807_pc,
jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read,
jsr_uxn_opcodes_h_l2907_c40_c807_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf
opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output);

-- jsr2_uxn_opcodes_h_l2908_c40_ca50
jsr2_uxn_opcodes_h_l2908_c40_ca50 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2908_c40_ca50_phase,
jsr2_uxn_opcodes_h_l2908_c40_ca50_ins,
jsr2_uxn_opcodes_h_l2908_c40_ca50_pc,
jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read,
jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0
opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output);

-- sth_uxn_opcodes_h_l2909_c40_bc38
sth_uxn_opcodes_h_l2909_c40_bc38 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2909_c40_bc38_phase,
sth_uxn_opcodes_h_l2909_c40_bc38_ins,
sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read,
sth_uxn_opcodes_h_l2909_c40_bc38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2
opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output);

-- sth2_uxn_opcodes_h_l2910_c40_1e40
sth2_uxn_opcodes_h_l2910_c40_1e40 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2910_c40_1e40_phase,
sth2_uxn_opcodes_h_l2910_c40_1e40_ins,
sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read,
sth2_uxn_opcodes_h_l2910_c40_1e40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_2324
opc_result_MUX_uxn_opcodes_h_l2911_c7_2324 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output);

-- ldz_uxn_opcodes_h_l2911_c40_7127
ldz_uxn_opcodes_h_l2911_c40_7127 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2911_c40_7127_phase,
ldz_uxn_opcodes_h_l2911_c40_7127_ins,
ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read,
ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read,
ldz_uxn_opcodes_h_l2911_c40_7127_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5
opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output);

-- ldz2_uxn_opcodes_h_l2912_c40_7b48
ldz2_uxn_opcodes_h_l2912_c40_7b48 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2912_c40_7b48_phase,
ldz2_uxn_opcodes_h_l2912_c40_7b48_ins,
ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read,
ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read,
ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_0501
opc_result_MUX_uxn_opcodes_h_l2913_c7_0501 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output);

-- stz_uxn_opcodes_h_l2913_c40_4e16
stz_uxn_opcodes_h_l2913_c40_4e16 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2913_c40_4e16_phase,
stz_uxn_opcodes_h_l2913_c40_4e16_ins,
stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read,
stz_uxn_opcodes_h_l2913_c40_4e16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_c861
opc_result_MUX_uxn_opcodes_h_l2914_c7_c861 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output);

-- stz2_uxn_opcodes_h_l2914_c40_e2e7
stz2_uxn_opcodes_h_l2914_c40_e2e7 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2914_c40_e2e7_phase,
stz2_uxn_opcodes_h_l2914_c40_e2e7_ins,
stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read,
stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0
opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output);

-- ldr_uxn_opcodes_h_l2915_c40_1eb6
ldr_uxn_opcodes_h_l2915_c40_1eb6 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2915_c40_1eb6_phase,
ldr_uxn_opcodes_h_l2915_c40_1eb6_ins,
ldr_uxn_opcodes_h_l2915_c40_1eb6_pc,
ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read,
ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read,
ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_084e
opc_result_MUX_uxn_opcodes_h_l2916_c7_084e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output);

-- ldr2_uxn_opcodes_h_l2916_c40_e108
ldr2_uxn_opcodes_h_l2916_c40_e108 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2916_c40_e108_phase,
ldr2_uxn_opcodes_h_l2916_c40_e108_ins,
ldr2_uxn_opcodes_h_l2916_c40_e108_pc,
ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read,
ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read,
ldr2_uxn_opcodes_h_l2916_c40_e108_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_f137
opc_result_MUX_uxn_opcodes_h_l2917_c7_f137 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output);

-- str1_uxn_opcodes_h_l2917_c40_2738
str1_uxn_opcodes_h_l2917_c40_2738 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2917_c40_2738_phase,
str1_uxn_opcodes_h_l2917_c40_2738_ins,
str1_uxn_opcodes_h_l2917_c40_2738_pc,
str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read,
str1_uxn_opcodes_h_l2917_c40_2738_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc
opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output);

-- str2_uxn_opcodes_h_l2918_c40_9941
str2_uxn_opcodes_h_l2918_c40_9941 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2918_c40_9941_phase,
str2_uxn_opcodes_h_l2918_c40_9941_ins,
str2_uxn_opcodes_h_l2918_c40_9941_pc,
str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read,
str2_uxn_opcodes_h_l2918_c40_9941_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_e163
opc_result_MUX_uxn_opcodes_h_l2919_c7_e163 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output);

-- lda_uxn_opcodes_h_l2919_c40_1df0
lda_uxn_opcodes_h_l2919_c40_1df0 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2919_c40_1df0_phase,
lda_uxn_opcodes_h_l2919_c40_1df0_ins,
lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read,
lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read,
lda_uxn_opcodes_h_l2919_c40_1df0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e
opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output);

-- lda2_uxn_opcodes_h_l2920_c40_2567
lda2_uxn_opcodes_h_l2920_c40_2567 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2920_c40_2567_phase,
lda2_uxn_opcodes_h_l2920_c40_2567_ins,
lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read,
lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read,
lda2_uxn_opcodes_h_l2920_c40_2567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5
opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output);

-- sta_uxn_opcodes_h_l2921_c40_1389
sta_uxn_opcodes_h_l2921_c40_1389 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2921_c40_1389_phase,
sta_uxn_opcodes_h_l2921_c40_1389_ins,
sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read,
sta_uxn_opcodes_h_l2921_c40_1389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb
opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output);

-- sta2_uxn_opcodes_h_l2922_c40_5d90
sta2_uxn_opcodes_h_l2922_c40_5d90 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2922_c40_5d90_phase,
sta2_uxn_opcodes_h_l2922_c40_5d90_ins,
sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read,
sta2_uxn_opcodes_h_l2922_c40_5d90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_f519
opc_result_MUX_uxn_opcodes_h_l2923_c7_f519 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output);

-- dei_uxn_opcodes_h_l2923_c40_5ab8
dei_uxn_opcodes_h_l2923_c40_5ab8 : entity work.dei_0CLK_b938be89 port map (
clk,
dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2923_c40_5ab8_phase,
dei_uxn_opcodes_h_l2923_c40_5ab8_ins,
dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons,
dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0,
dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1,
dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read,
dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read,
dei_uxn_opcodes_h_l2923_c40_5ab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_752c
opc_result_MUX_uxn_opcodes_h_l2924_c7_752c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output);

-- dei2_uxn_opcodes_h_l2924_c40_9e96
dei2_uxn_opcodes_h_l2924_c40_9e96 : entity work.dei2_0CLK_0f8c9c15 port map (
clk,
dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2924_c40_9e96_phase,
dei2_uxn_opcodes_h_l2924_c40_9e96_ins,
dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons,
dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0,
dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1,
dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read,
dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read,
dei2_uxn_opcodes_h_l2924_c40_9e96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5
opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output);

-- deo_uxn_opcodes_h_l2925_c40_cf9f
deo_uxn_opcodes_h_l2925_c40_cf9f : entity work.deo_0CLK_aa600457 port map (
clk,
deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2925_c40_cf9f_phase,
deo_uxn_opcodes_h_l2925_c40_cf9f_ins,
deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read,
deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read,
deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read,
deo_uxn_opcodes_h_l2925_c40_cf9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_7103
opc_result_MUX_uxn_opcodes_h_l2926_c7_7103 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output);

-- deo2_uxn_opcodes_h_l2926_c40_5956
deo2_uxn_opcodes_h_l2926_c40_5956 : entity work.deo2_0CLK_db9dbf72 port map (
clk,
deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2926_c40_5956_phase,
deo2_uxn_opcodes_h_l2926_c40_5956_ins,
deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read,
deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read,
deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read,
deo2_uxn_opcodes_h_l2926_c40_5956_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40
opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output);

-- add_uxn_opcodes_h_l2927_c40_ea22
add_uxn_opcodes_h_l2927_c40_ea22 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE,
add_uxn_opcodes_h_l2927_c40_ea22_phase,
add_uxn_opcodes_h_l2927_c40_ea22_ins,
add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read,
add_uxn_opcodes_h_l2927_c40_ea22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_e957
opc_result_MUX_uxn_opcodes_h_l2928_c7_e957 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output);

-- add2_uxn_opcodes_h_l2928_c40_711d
add2_uxn_opcodes_h_l2928_c40_711d : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2928_c40_711d_phase,
add2_uxn_opcodes_h_l2928_c40_711d_ins,
add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read,
add2_uxn_opcodes_h_l2928_c40_711d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab
opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output);

-- sub1_uxn_opcodes_h_l2929_c40_3376
sub1_uxn_opcodes_h_l2929_c40_3376 : entity work.sub1_0CLK_64d180f1 port map (
clk,
sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE,
sub1_uxn_opcodes_h_l2929_c40_3376_phase,
sub1_uxn_opcodes_h_l2929_c40_3376_ins,
sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read,
sub1_uxn_opcodes_h_l2929_c40_3376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_b966
opc_result_MUX_uxn_opcodes_h_l2930_c7_b966 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output);

-- sub2_uxn_opcodes_h_l2930_c40_b8ad
sub2_uxn_opcodes_h_l2930_c40_b8ad : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2930_c40_b8ad_phase,
sub2_uxn_opcodes_h_l2930_c40_b8ad_ins,
sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read,
sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_9044
opc_result_MUX_uxn_opcodes_h_l2931_c7_9044 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output);

-- mul_uxn_opcodes_h_l2931_c40_43e9
mul_uxn_opcodes_h_l2931_c40_43e9 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2931_c40_43e9_phase,
mul_uxn_opcodes_h_l2931_c40_43e9_ins,
mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read,
mul_uxn_opcodes_h_l2931_c40_43e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_950e
opc_result_MUX_uxn_opcodes_h_l2932_c7_950e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output);

-- mul2_uxn_opcodes_h_l2932_c40_54fc
mul2_uxn_opcodes_h_l2932_c40_54fc : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2932_c40_54fc_phase,
mul2_uxn_opcodes_h_l2932_c40_54fc_ins,
mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read,
mul2_uxn_opcodes_h_l2932_c40_54fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5
opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output);

-- div_uxn_opcodes_h_l2933_c40_d596
div_uxn_opcodes_h_l2933_c40_d596 : entity work.div_0CLK_4e24eea7 port map (
clk,
div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE,
div_uxn_opcodes_h_l2933_c40_d596_phase,
div_uxn_opcodes_h_l2933_c40_d596_ins,
div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read,
div_uxn_opcodes_h_l2933_c40_d596_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output);

-- div2_uxn_opcodes_h_l2934_c40_288e
div2_uxn_opcodes_h_l2934_c40_288e : entity work.div2_0CLK_7c6279d3 port map (
clk,
div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2934_c40_288e_phase,
div2_uxn_opcodes_h_l2934_c40_288e_ins,
div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read,
div2_uxn_opcodes_h_l2934_c40_288e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4
opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output);

-- and_uxn_opcodes_h_l2935_c40_c330
and_uxn_opcodes_h_l2935_c40_c330 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE,
and_uxn_opcodes_h_l2935_c40_c330_phase,
and_uxn_opcodes_h_l2935_c40_c330_ins,
and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read,
and_uxn_opcodes_h_l2935_c40_c330_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7
opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output);

-- and2_uxn_opcodes_h_l2936_c40_7d83
and2_uxn_opcodes_h_l2936_c40_7d83 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2936_c40_7d83_phase,
and2_uxn_opcodes_h_l2936_c40_7d83_ins,
and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read,
and2_uxn_opcodes_h_l2936_c40_7d83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a
opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output);

-- ora_uxn_opcodes_h_l2937_c40_8f8d
ora_uxn_opcodes_h_l2937_c40_8f8d : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2937_c40_8f8d_phase,
ora_uxn_opcodes_h_l2937_c40_8f8d_ins,
ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read,
ora_uxn_opcodes_h_l2937_c40_8f8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_432d
opc_result_MUX_uxn_opcodes_h_l2938_c7_432d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output);

-- ora2_uxn_opcodes_h_l2938_c40_f24f
ora2_uxn_opcodes_h_l2938_c40_f24f : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2938_c40_f24f_phase,
ora2_uxn_opcodes_h_l2938_c40_f24f_ins,
ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read,
ora2_uxn_opcodes_h_l2938_c40_f24f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output);

-- eor_uxn_opcodes_h_l2939_c40_7116
eor_uxn_opcodes_h_l2939_c40_7116 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2939_c40_7116_phase,
eor_uxn_opcodes_h_l2939_c40_7116_ins,
eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read,
eor_uxn_opcodes_h_l2939_c40_7116_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6
opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output);

-- eor2_uxn_opcodes_h_l2940_c40_3762
eor2_uxn_opcodes_h_l2940_c40_3762 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2940_c40_3762_phase,
eor2_uxn_opcodes_h_l2940_c40_3762_ins,
eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read,
eor2_uxn_opcodes_h_l2940_c40_3762_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_abef
opc_result_MUX_uxn_opcodes_h_l2941_c7_abef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output);

-- sft_uxn_opcodes_h_l2941_c40_36e1
sft_uxn_opcodes_h_l2941_c40_36e1 : entity work.sft_0CLK_8d2aa467 port map (
clk,
sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2941_c40_36e1_phase,
sft_uxn_opcodes_h_l2941_c40_36e1_ins,
sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read,
sft_uxn_opcodes_h_l2941_c40_36e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac
opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output);

-- sft2_uxn_opcodes_h_l2942_c40_93c0
sft2_uxn_opcodes_h_l2942_c40_93c0 : entity work.sft2_0CLK_af0d23d3 port map (
clk,
sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2942_c40_93c0_phase,
sft2_uxn_opcodes_h_l2942_c40_93c0_ins,
sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read,
sft2_uxn_opcodes_h_l2942_c40_93c0_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7
CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x,
CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left,
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right,
BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output);

-- sp0_MUX_uxn_opcodes_h_l2947_c2_1689
sp0_MUX_uxn_opcodes_h_l2947_c2_1689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond,
sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue,
sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse,
sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output);

-- sp1_MUX_uxn_opcodes_h_l2947_c2_1689
sp1_MUX_uxn_opcodes_h_l2947_c2_1689 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond,
sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue,
sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse,
sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left,
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right,
BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output);

-- MUX_uxn_opcodes_h_l2953_c29_83c2
MUX_uxn_opcodes_h_l2953_c29_83c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2953_c29_83c2_cond,
MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue,
MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse,
MUX_uxn_opcodes_h_l2953_c29_83c2_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left,
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right,
BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output);

-- MUX_uxn_opcodes_h_l2954_c20_4e8b
MUX_uxn_opcodes_h_l2954_c20_4e8b : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2954_c20_4e8b_cond,
MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue,
MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse,
MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4
BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4 : entity work.BIN_OP_OR_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left,
BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right,
BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output);

-- stack_ram_update_uxn_opcodes_h_l2956_c24_64fd
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address,
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value,
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable,
stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output,
 MUX_uxn_opcodes_h_l2866_c14_761e_return_output,
 MUX_uxn_opcodes_h_l2867_c8_a247_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output,
 is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output,
 brk_uxn_opcodes_h_l2873_c48_0b1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output,
 jci_uxn_opcodes_h_l2874_c40_2a5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output,
 jmi_uxn_opcodes_h_l2875_c40_5075_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output,
 jsi_uxn_opcodes_h_l2876_c40_750a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output,
 lit_uxn_opcodes_h_l2877_c40_5d24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output,
 lit2_uxn_opcodes_h_l2878_c40_0290_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output,
 lit_uxn_opcodes_h_l2879_c40_5958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output,
 lit2_uxn_opcodes_h_l2880_c40_c010_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output,
 inc_uxn_opcodes_h_l2881_c40_40fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output,
 inc2_uxn_opcodes_h_l2882_c40_dc22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output,
 pop_uxn_opcodes_h_l2883_c40_686d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output,
 pop2_uxn_opcodes_h_l2884_c40_076e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output,
 nip_uxn_opcodes_h_l2885_c40_2f8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output,
 nip2_uxn_opcodes_h_l2886_c40_6713_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output,
 swp_uxn_opcodes_h_l2887_c40_fba3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output,
 swp2_uxn_opcodes_h_l2888_c40_b690_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output,
 rot_uxn_opcodes_h_l2889_c40_9e60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output,
 rot2_uxn_opcodes_h_l2890_c40_6298_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output,
 dup_uxn_opcodes_h_l2891_c40_5ad6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output,
 dup2_uxn_opcodes_h_l2892_c40_6228_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output,
 ovr_uxn_opcodes_h_l2893_c40_ee84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output,
 ovr2_uxn_opcodes_h_l2894_c40_2428_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output,
 equ_uxn_opcodes_h_l2895_c40_849c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output,
 equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output,
 neq_uxn_opcodes_h_l2897_c40_8885_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output,
 neq2_uxn_opcodes_h_l2898_c40_9d23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output,
 gth_uxn_opcodes_h_l2899_c40_f9c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output,
 gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output,
 lth_uxn_opcodes_h_l2901_c40_f86f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output,
 lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output,
 jmp_uxn_opcodes_h_l2903_c40_5efb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output,
 jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output,
 jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output,
 jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output,
 jsr_uxn_opcodes_h_l2907_c40_c807_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output,
 jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output,
 sth_uxn_opcodes_h_l2909_c40_bc38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output,
 sth2_uxn_opcodes_h_l2910_c40_1e40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output,
 ldz_uxn_opcodes_h_l2911_c40_7127_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output,
 ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output,
 stz_uxn_opcodes_h_l2913_c40_4e16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output,
 stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output,
 ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output,
 ldr2_uxn_opcodes_h_l2916_c40_e108_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output,
 str1_uxn_opcodes_h_l2917_c40_2738_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output,
 str2_uxn_opcodes_h_l2918_c40_9941_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output,
 lda_uxn_opcodes_h_l2919_c40_1df0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output,
 lda2_uxn_opcodes_h_l2920_c40_2567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output,
 sta_uxn_opcodes_h_l2921_c40_1389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output,
 sta2_uxn_opcodes_h_l2922_c40_5d90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output,
 dei_uxn_opcodes_h_l2923_c40_5ab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output,
 dei2_uxn_opcodes_h_l2924_c40_9e96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output,
 deo_uxn_opcodes_h_l2925_c40_cf9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output,
 deo2_uxn_opcodes_h_l2926_c40_5956_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output,
 add_uxn_opcodes_h_l2927_c40_ea22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output,
 add2_uxn_opcodes_h_l2928_c40_711d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output,
 sub1_uxn_opcodes_h_l2929_c40_3376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output,
 sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output,
 mul_uxn_opcodes_h_l2931_c40_43e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output,
 mul2_uxn_opcodes_h_l2932_c40_54fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output,
 div_uxn_opcodes_h_l2933_c40_d596_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output,
 div2_uxn_opcodes_h_l2934_c40_288e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output,
 and_uxn_opcodes_h_l2935_c40_c330_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output,
 and2_uxn_opcodes_h_l2936_c40_7d83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output,
 ora_uxn_opcodes_h_l2937_c40_8f8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output,
 ora2_uxn_opcodes_h_l2938_c40_f24f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output,
 eor_uxn_opcodes_h_l2939_c40_7116_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output,
 eor2_uxn_opcodes_h_l2940_c40_3762_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output,
 sft_uxn_opcodes_h_l2941_c40_36e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output,
 sft2_uxn_opcodes_h_l2942_c40_93c0_return_output,
 CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output,
 sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output,
 sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output,
 MUX_uxn_opcodes_h_l2953_c29_83c2_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output,
 MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output,
 stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output)
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
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_761e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2866_c14_761e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_a247_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_5075_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_5075_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2875_c40_5075_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_750a_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_750a_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2876_c40_750a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_5d24_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_5d24_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_5d24_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_0290_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_0290_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_0290_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_5958_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_5958_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2879_c40_5958_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_c010_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_c010_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2880_c40_c010_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_40fb_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_40fb_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2881_c40_40fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_686d_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_686d_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2883_c40_686d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_076e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_076e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2884_c40_076e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_6713_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_6713_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2886_c40_6713_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_fba3_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_fba3_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2887_c40_fba3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_b690_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_b690_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2888_c40_b690_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_9e60_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_9e60_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2889_c40_9e60_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_6298_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_6298_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2890_c40_6298_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_6228_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_6228_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2892_c40_6228_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_849c_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_849c_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2895_c40_849c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_8885_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_8885_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2897_c40_8885_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_f86f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_f86f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2901_c40_f86f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2907_c40_c807_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_bc38_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_bc38_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2909_c40_bc38_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2911_c40_7127_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_4e16_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_4e16_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2913_c40_4e16_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2917_c40_2738_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2918_c40_9941_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2919_c40_1df0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2920_c40_2567_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_1389_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_1389_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2921_c40_1389_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_phase : unsigned(11 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_phase : unsigned(11 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2926_c40_5956_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_ea22_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_ea22_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2927_c40_ea22_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_711d_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_711d_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2928_c40_711d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_3376_phase : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_3376_ins : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub1_uxn_opcodes_h_l2929_c40_3376_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_43e9_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_43e9_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2931_c40_43e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_d596_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_d596_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2933_c40_d596_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_288e_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_288e_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2934_c40_288e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c330_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c330_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2935_c40_c330_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_7d83_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_7d83_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2936_c40_7d83_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_7116_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_7116_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2939_c40_7116_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_3762_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_3762_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2940_c40_3762_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_36e1_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_36e1_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2941_c40_36e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2944_c2_6b7c : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_0a31_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2950_c3_511b : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2948_c3_8ead : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_6ed2_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_aedc_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_58c9_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_a57a_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_4a64_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_4779_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_157b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_0a90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_c8ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_20bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_7a2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_1da5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_7af9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2950_DUPLICATE_29e4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_0bb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_9100_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right := to_unsigned(6, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right := to_unsigned(62, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right := to_unsigned(23, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right := to_unsigned(31, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right := to_unsigned(59, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right := to_unsigned(39, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right := to_unsigned(54, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right := to_unsigned(9, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right := to_unsigned(25, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right := to_unsigned(58, 8);
     VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right := to_unsigned(51, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right := to_unsigned(10, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right := to_unsigned(38, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right := to_unsigned(19, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right := to_unsigned(8, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right := to_unsigned(61, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right := to_unsigned(50, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right := to_unsigned(96, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right := to_unsigned(14, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right := to_unsigned(57, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right := to_unsigned(24, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons := VAR_controller0_buttons;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2928_c40_711d_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2927_c40_ea22_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2936_c40_7d83_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2935_c40_c330_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2934_c40_288e_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2933_c40_d596_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2892_c40_6228_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2940_c40_3762_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2939_c40_7116_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2895_c40_849c_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2881_c40_40fb_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2901_c40_f86f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2931_c40_43e9_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2897_c40_8885_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2886_c40_6713_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2884_c40_076e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2883_c40_686d_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2890_c40_6298_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2889_c40_9e60_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2941_c40_36e1_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2921_c40_1389_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2909_c40_bc38_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2913_c40_4e16_ins := VAR_ins;
     VAR_sub1_uxn_opcodes_h_l2929_c40_3376_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2888_c40_b690_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2887_c40_fba3_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2875_c40_5075_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2876_c40_750a_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_0290_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2880_c40_c010_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_5d24_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2879_c40_5958_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2928_c40_711d_phase := resize(VAR_phase, 8);
     VAR_add_uxn_opcodes_h_l2927_c40_ea22_phase := resize(VAR_phase, 8);
     VAR_and2_uxn_opcodes_h_l2936_c40_7d83_phase := resize(VAR_phase, 8);
     VAR_and_uxn_opcodes_h_l2935_c40_c330_phase := resize(VAR_phase, 8);
     VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_phase := resize(VAR_phase, 8);
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_phase := resize(VAR_phase, 8);
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2934_c40_288e_phase := resize(VAR_phase, 8);
     VAR_div_uxn_opcodes_h_l2933_c40_d596_phase := resize(VAR_phase, 8);
     VAR_dup2_uxn_opcodes_h_l2892_c40_6228_phase := resize(VAR_phase, 8);
     VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_phase := resize(VAR_phase, 8);
     VAR_eor2_uxn_opcodes_h_l2940_c40_3762_phase := resize(VAR_phase, 8);
     VAR_eor_uxn_opcodes_h_l2939_c40_7116_phase := resize(VAR_phase, 8);
     VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_phase := resize(VAR_phase, 8);
     VAR_equ_uxn_opcodes_h_l2895_c40_849c_phase := resize(VAR_phase, 8);
     VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_phase := resize(VAR_phase, 8);
     VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_phase := resize(VAR_phase, 8);
     VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_phase := resize(VAR_phase, 8);
     VAR_inc_uxn_opcodes_h_l2881_c40_40fb_phase := resize(VAR_phase, 8);
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_phase := resize(VAR_phase, 8);
     VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase := resize(VAR_phase, 8);
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_phase := resize(VAR_phase, 8);
     VAR_jmi_uxn_opcodes_h_l2875_c40_5075_phase := resize(VAR_phase, 8);
     VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_phase := resize(VAR_phase, 8);
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_phase := resize(VAR_phase, 8);
     VAR_jsi_uxn_opcodes_h_l2876_c40_750a_phase := resize(VAR_phase, 8);
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_phase := resize(VAR_phase, 8);
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_phase := resize(VAR_phase, 8);
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_phase := resize(VAR_phase, 8);
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_phase := resize(VAR_phase, 8);
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_phase := resize(VAR_phase, 8);
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_phase := resize(VAR_phase, 8);
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_phase := resize(VAR_phase, 8);
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2878_c40_0290_phase := resize(VAR_phase, 8);
     VAR_lit2_uxn_opcodes_h_l2880_c40_c010_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2877_c40_5d24_phase := resize(VAR_phase, 8);
     VAR_lit_uxn_opcodes_h_l2879_c40_5958_phase := resize(VAR_phase, 8);
     VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_phase := resize(VAR_phase, 8);
     VAR_lth_uxn_opcodes_h_l2901_c40_f86f_phase := resize(VAR_phase, 8);
     VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_phase := resize(VAR_phase, 8);
     VAR_mul_uxn_opcodes_h_l2931_c40_43e9_phase := resize(VAR_phase, 8);
     VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_phase := resize(VAR_phase, 8);
     VAR_neq_uxn_opcodes_h_l2897_c40_8885_phase := resize(VAR_phase, 8);
     VAR_nip2_uxn_opcodes_h_l2886_c40_6713_phase := resize(VAR_phase, 8);
     VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_phase := resize(VAR_phase, 8);
     VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_phase := resize(VAR_phase, 8);
     VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_phase := resize(VAR_phase, 8);
     VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_phase := resize(VAR_phase, 8);
     VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_phase := resize(VAR_phase, 8);
     VAR_pop2_uxn_opcodes_h_l2884_c40_076e_phase := resize(VAR_phase, 8);
     VAR_pop_uxn_opcodes_h_l2883_c40_686d_phase := resize(VAR_phase, 8);
     VAR_rot2_uxn_opcodes_h_l2890_c40_6298_phase := resize(VAR_phase, 8);
     VAR_rot_uxn_opcodes_h_l2889_c40_9e60_phase := resize(VAR_phase, 8);
     VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_phase := resize(VAR_phase, 8);
     VAR_sft_uxn_opcodes_h_l2941_c40_36e1_phase := resize(VAR_phase, 8);
     VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_phase := resize(VAR_phase, 8);
     VAR_sta_uxn_opcodes_h_l2921_c40_1389_phase := resize(VAR_phase, 8);
     VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_phase := resize(VAR_phase, 8);
     VAR_sth_uxn_opcodes_h_l2909_c40_bc38_phase := resize(VAR_phase, 8);
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_phase := resize(VAR_phase, 8);
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_phase := resize(VAR_phase, 8);
     VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_phase := resize(VAR_phase, 8);
     VAR_stz_uxn_opcodes_h_l2913_c40_4e16_phase := resize(VAR_phase, 8);
     VAR_sub1_uxn_opcodes_h_l2929_c40_3376_phase := resize(VAR_phase, 8);
     VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_phase := resize(VAR_phase, 8);
     VAR_swp2_uxn_opcodes_h_l2888_c40_b690_phase := resize(VAR_phase, 8);
     VAR_swp_uxn_opcodes_h_l2887_c40_fba3_phase := resize(VAR_phase, 8);
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read := previous_stack_read;
     VAR_sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0 := sp0;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0 := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1 := sp1;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1 := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2865_c14_b0b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_left;
     BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output := BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2944_c16_6aa7] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output := CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output;

     -- brk[uxn_opcodes_h_l2873_c48_0b1d] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2873_c48_0b1d_phase <= VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_return_output := brk_uxn_opcodes_h_l2873_c48_0b1d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output;
     VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2865_c14_b0b7_return_output;
     VAR_stack_index_uxn_opcodes_h_l2944_c2_6b7c := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2944_c16_6aa7_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue := VAR_brk_uxn_opcodes_h_l2873_c48_0b1d_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left := VAR_stack_index_uxn_opcodes_h_l2944_c2_6b7c;
     -- BIN_OP_XOR[uxn_opcodes_h_l2866_c14_e2d2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_left;
     BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output := BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2866_c14_e2d2_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2866_c14_938e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_left;
     BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output := BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2866_c14_938e_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2866_c14_e010] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2866_c14_e010_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2866_c14_bbe6] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2866_c14_761e_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2866_c14_bbe6_return_output;
     -- MUX[uxn_opcodes_h_l2866_c14_761e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2866_c14_761e_cond <= VAR_MUX_uxn_opcodes_h_l2866_c14_761e_cond;
     MUX_uxn_opcodes_h_l2866_c14_761e_iftrue <= VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iftrue;
     MUX_uxn_opcodes_h_l2866_c14_761e_iffalse <= VAR_MUX_uxn_opcodes_h_l2866_c14_761e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2866_c14_761e_return_output := MUX_uxn_opcodes_h_l2866_c14_761e_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2867_c8_a247_cond := VAR_MUX_uxn_opcodes_h_l2866_c14_761e_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2866_c14_761e_return_output;
     -- MUX[uxn_opcodes_h_l2867_c8_a247] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2867_c8_a247_cond <= VAR_MUX_uxn_opcodes_h_l2867_c8_a247_cond;
     MUX_uxn_opcodes_h_l2867_c8_a247_iftrue <= VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iftrue;
     MUX_uxn_opcodes_h_l2867_c8_a247_iffalse <= VAR_MUX_uxn_opcodes_h_l2867_c8_a247_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output := MUX_uxn_opcodes_h_l2867_c8_a247_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2867_c8_a247_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_c952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_6a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_b996] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_a666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_9976] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_4e6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_3469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_81ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_d299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_069f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_ed09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_8f91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_03d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_19b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_5ffb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_3b08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_cf29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_4609] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_d0b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_3759] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_df83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_732f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_4c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_a6f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_fc4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_56af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_e3a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_b7da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_a0ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_6836] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_c6a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_60ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_83cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_b3b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_07c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_1270] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_f8ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_ee59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_60f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_00d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_f589] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_be4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_7cb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_ea5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_af53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_1521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_1ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_0314] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_0608] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_0154] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_b023] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_f851] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_e4d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_f8e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_fdbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_ca0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_f935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_96da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_63ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_0026] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_4a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_9a2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_1724] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_4f75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_c83c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_6074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c6_89ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_74c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_cffd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_a9d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c6_89ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_d299_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_cf29_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_56af_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_00d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_9a2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_a9d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_af53_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_f935_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e3a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_4f75_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_07c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_a666_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_ca0d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_0314_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_9976_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cffd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_1270_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_4e6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_6074_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_1ad7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_069f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_c6a6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_6836_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_b7da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_4a71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_1521_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_c83c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_fdbe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_f8e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_3469_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_3b08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_a0ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_d0b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_a6f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_f589_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_5ffb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_b996_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_60f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_ed09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7cb6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_96da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_1724_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_03d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_0026_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_0154_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_fc4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_c952_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_0608_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_6a6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_81ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_be4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_732f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f8ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_b3b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_74c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_4609_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_60ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_e4d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_ea5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_f851_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_19b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_83cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_3759_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8f91_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_4c6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_63ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_df83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_ee59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_b023_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2873_c2_e5fa] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond;
     is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output := is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_eb0a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_e3a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_c027] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output;
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_c027_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_aa9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_1cf0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output;

     -- jci[uxn_opcodes_h_l2874_c40_2a5e] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2874_c40_2a5e_phase <= VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_phase;
     jci_uxn_opcodes_h_l2874_c40_2a5e_pc <= VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_pc;
     jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_stack_read;
     jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_return_output := jci_uxn_opcodes_h_l2874_c40_2a5e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output;
     VAR_jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_1cf0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue := VAR_jci_uxn_opcodes_h_l2874_c40_2a5e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_4c70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_8bee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output;

     -- jmi[uxn_opcodes_h_l2875_c40_5075] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2875_c40_5075_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2875_c40_5075_phase <= VAR_jmi_uxn_opcodes_h_l2875_c40_5075_phase;
     jmi_uxn_opcodes_h_l2875_c40_5075_pc <= VAR_jmi_uxn_opcodes_h_l2875_c40_5075_pc;
     jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2875_c40_5075_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2875_c40_5075_return_output := jmi_uxn_opcodes_h_l2875_c40_5075_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output;
     VAR_jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_4c70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue := VAR_jmi_uxn_opcodes_h_l2875_c40_5075_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_57c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output;

     -- jsi[uxn_opcodes_h_l2876_c40_750a] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2876_c40_750a_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2876_c40_750a_phase <= VAR_jsi_uxn_opcodes_h_l2876_c40_750a_phase;
     jsi_uxn_opcodes_h_l2876_c40_750a_pc <= VAR_jsi_uxn_opcodes_h_l2876_c40_750a_pc;
     jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2876_c40_750a_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2876_c40_750a_return_output := jsi_uxn_opcodes_h_l2876_c40_750a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_6e11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_57c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue := VAR_jsi_uxn_opcodes_h_l2876_c40_750a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_e75e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_5d24] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_5d24_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_5d24_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_5d24_phase;
     lit_uxn_opcodes_h_l2877_c40_5d24_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_5d24_pc;
     lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_5d24_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_5d24_return_output := lit_uxn_opcodes_h_l2877_c40_5d24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_fa94] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_e75e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_5d24_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_b121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_7099] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_0290] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_0290_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_0290_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_0290_phase;
     lit2_uxn_opcodes_h_l2878_c40_0290_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_0290_pc;
     lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_0290_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_0290_return_output := lit2_uxn_opcodes_h_l2878_c40_0290_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_7099_return_output;
     VAR_lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_b121_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_0290_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_25b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_7964] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output;

     -- lit[uxn_opcodes_h_l2879_c40_5958] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2879_c40_5958_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2879_c40_5958_phase <= VAR_lit_uxn_opcodes_h_l2879_c40_5958_phase;
     lit_uxn_opcodes_h_l2879_c40_5958_pc <= VAR_lit_uxn_opcodes_h_l2879_c40_5958_pc;
     lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2879_c40_5958_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2879_c40_5958_return_output := lit_uxn_opcodes_h_l2879_c40_5958_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output;
     VAR_lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_7964_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue := VAR_lit_uxn_opcodes_h_l2879_c40_5958_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_ec5a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_08bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output;

     -- lit2[uxn_opcodes_h_l2880_c40_c010] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2880_c40_c010_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2880_c40_c010_phase <= VAR_lit2_uxn_opcodes_h_l2880_c40_c010_phase;
     lit2_uxn_opcodes_h_l2880_c40_c010_pc <= VAR_lit2_uxn_opcodes_h_l2880_c40_c010_pc;
     lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2880_c40_c010_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2880_c40_c010_return_output := lit2_uxn_opcodes_h_l2880_c40_c010_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output;
     VAR_inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_ec5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue := VAR_lit2_uxn_opcodes_h_l2880_c40_c010_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_876c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_432f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output;

     -- inc[uxn_opcodes_h_l2881_c40_40fb] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2881_c40_40fb_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2881_c40_40fb_phase <= VAR_inc_uxn_opcodes_h_l2881_c40_40fb_phase;
     inc_uxn_opcodes_h_l2881_c40_40fb_ins <= VAR_inc_uxn_opcodes_h_l2881_c40_40fb_ins;
     inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2881_c40_40fb_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2881_c40_40fb_return_output := inc_uxn_opcodes_h_l2881_c40_40fb_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_876c_return_output;
     VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_432f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue := VAR_inc_uxn_opcodes_h_l2881_c40_40fb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_e7f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_93b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output;

     -- inc2[uxn_opcodes_h_l2882_c40_dc22] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2882_c40_dc22_phase <= VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_phase;
     inc2_uxn_opcodes_h_l2882_c40_dc22_ins <= VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_ins;
     inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_return_output := inc2_uxn_opcodes_h_l2882_c40_dc22_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output;
     VAR_pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_93b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue := VAR_inc2_uxn_opcodes_h_l2882_c40_dc22_return_output;
     -- pop[uxn_opcodes_h_l2883_c40_686d] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2883_c40_686d_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2883_c40_686d_phase <= VAR_pop_uxn_opcodes_h_l2883_c40_686d_phase;
     pop_uxn_opcodes_h_l2883_c40_686d_ins <= VAR_pop_uxn_opcodes_h_l2883_c40_686d_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2883_c40_686d_return_output := pop_uxn_opcodes_h_l2883_c40_686d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_6046] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_ec6c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_6046_return_output;
     VAR_pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_ec6c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue := VAR_pop_uxn_opcodes_h_l2883_c40_686d_return_output;
     -- pop2[uxn_opcodes_h_l2884_c40_076e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2884_c40_076e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2884_c40_076e_phase <= VAR_pop2_uxn_opcodes_h_l2884_c40_076e_phase;
     pop2_uxn_opcodes_h_l2884_c40_076e_ins <= VAR_pop2_uxn_opcodes_h_l2884_c40_076e_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2884_c40_076e_return_output := pop2_uxn_opcodes_h_l2884_c40_076e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_3ef3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_1d44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output;
     VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_1d44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue := VAR_pop2_uxn_opcodes_h_l2884_c40_076e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_b17e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output;

     -- nip[uxn_opcodes_h_l2885_c40_2f8c] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2885_c40_2f8c_phase <= VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_phase;
     nip_uxn_opcodes_h_l2885_c40_2f8c_ins <= VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_ins;
     nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_return_output := nip_uxn_opcodes_h_l2885_c40_2f8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_253c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_253c_return_output;
     VAR_nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_b17e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue := VAR_nip_uxn_opcodes_h_l2885_c40_2f8c_return_output;
     -- nip2[uxn_opcodes_h_l2886_c40_6713] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2886_c40_6713_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2886_c40_6713_phase <= VAR_nip2_uxn_opcodes_h_l2886_c40_6713_phase;
     nip2_uxn_opcodes_h_l2886_c40_6713_ins <= VAR_nip2_uxn_opcodes_h_l2886_c40_6713_ins;
     nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2886_c40_6713_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2886_c40_6713_return_output := nip2_uxn_opcodes_h_l2886_c40_6713_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_59cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_3e96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output;
     VAR_swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_59cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue := VAR_nip2_uxn_opcodes_h_l2886_c40_6713_return_output;
     -- swp[uxn_opcodes_h_l2887_c40_fba3] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2887_c40_fba3_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2887_c40_fba3_phase <= VAR_swp_uxn_opcodes_h_l2887_c40_fba3_phase;
     swp_uxn_opcodes_h_l2887_c40_fba3_ins <= VAR_swp_uxn_opcodes_h_l2887_c40_fba3_ins;
     swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2887_c40_fba3_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2887_c40_fba3_return_output := swp_uxn_opcodes_h_l2887_c40_fba3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_827c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_a979] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_a979_return_output;
     VAR_swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_827c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue := VAR_swp_uxn_opcodes_h_l2887_c40_fba3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_3bc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_c45b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output;

     -- swp2[uxn_opcodes_h_l2888_c40_b690] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2888_c40_b690_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2888_c40_b690_phase <= VAR_swp2_uxn_opcodes_h_l2888_c40_b690_phase;
     swp2_uxn_opcodes_h_l2888_c40_b690_ins <= VAR_swp2_uxn_opcodes_h_l2888_c40_b690_ins;
     swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2888_c40_b690_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2888_c40_b690_return_output := swp2_uxn_opcodes_h_l2888_c40_b690_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output;
     VAR_rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_3bc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue := VAR_swp2_uxn_opcodes_h_l2888_c40_b690_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_3a46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_9fc8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output;

     -- rot[uxn_opcodes_h_l2889_c40_9e60] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2889_c40_9e60_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2889_c40_9e60_phase <= VAR_rot_uxn_opcodes_h_l2889_c40_9e60_phase;
     rot_uxn_opcodes_h_l2889_c40_9e60_ins <= VAR_rot_uxn_opcodes_h_l2889_c40_9e60_ins;
     rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2889_c40_9e60_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2889_c40_9e60_return_output := rot_uxn_opcodes_h_l2889_c40_9e60_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output;
     VAR_rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9fc8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue := VAR_rot_uxn_opcodes_h_l2889_c40_9e60_return_output;
     -- rot2[uxn_opcodes_h_l2890_c40_6298] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2890_c40_6298_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2890_c40_6298_phase <= VAR_rot2_uxn_opcodes_h_l2890_c40_6298_phase;
     rot2_uxn_opcodes_h_l2890_c40_6298_ins <= VAR_rot2_uxn_opcodes_h_l2890_c40_6298_ins;
     rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2890_c40_6298_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2890_c40_6298_return_output := rot2_uxn_opcodes_h_l2890_c40_6298_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_bfef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_8d41] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output;
     VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_8d41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue := VAR_rot2_uxn_opcodes_h_l2890_c40_6298_return_output;
     -- dup[uxn_opcodes_h_l2891_c40_5ad6] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2891_c40_5ad6_phase <= VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_phase;
     dup_uxn_opcodes_h_l2891_c40_5ad6_ins <= VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_ins;
     dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_return_output := dup_uxn_opcodes_h_l2891_c40_5ad6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_16f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_8b4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output;
     VAR_dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_8b4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue := VAR_dup_uxn_opcodes_h_l2891_c40_5ad6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_e9d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output;

     -- dup2[uxn_opcodes_h_l2892_c40_6228] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2892_c40_6228_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2892_c40_6228_phase <= VAR_dup2_uxn_opcodes_h_l2892_c40_6228_phase;
     dup2_uxn_opcodes_h_l2892_c40_6228_ins <= VAR_dup2_uxn_opcodes_h_l2892_c40_6228_ins;
     dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2892_c40_6228_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2892_c40_6228_return_output := dup2_uxn_opcodes_h_l2892_c40_6228_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_0655] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output;
     VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_0655_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue := VAR_dup2_uxn_opcodes_h_l2892_c40_6228_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_ff17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_baa3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output;

     -- ovr[uxn_opcodes_h_l2893_c40_ee84] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2893_c40_ee84_phase <= VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_phase;
     ovr_uxn_opcodes_h_l2893_c40_ee84_ins <= VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_ins;
     ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_return_output := ovr_uxn_opcodes_h_l2893_c40_ee84_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output;
     VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_ff17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue := VAR_ovr_uxn_opcodes_h_l2893_c40_ee84_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_9e8a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output;

     -- ovr2[uxn_opcodes_h_l2894_c40_2428] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2894_c40_2428_phase <= VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_phase;
     ovr2_uxn_opcodes_h_l2894_c40_2428_ins <= VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_ins;
     ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_return_output := ovr2_uxn_opcodes_h_l2894_c40_2428_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_94eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output;
     VAR_equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_9e8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue := VAR_ovr2_uxn_opcodes_h_l2894_c40_2428_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_31fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output;

     -- equ[uxn_opcodes_h_l2895_c40_849c] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2895_c40_849c_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2895_c40_849c_phase <= VAR_equ_uxn_opcodes_h_l2895_c40_849c_phase;
     equ_uxn_opcodes_h_l2895_c40_849c_ins <= VAR_equ_uxn_opcodes_h_l2895_c40_849c_ins;
     equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2895_c40_849c_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2895_c40_849c_return_output := equ_uxn_opcodes_h_l2895_c40_849c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_6fb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output;
     VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_31fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue := VAR_equ_uxn_opcodes_h_l2895_c40_849c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_08ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_6c79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output;

     -- equ2[uxn_opcodes_h_l2896_c40_8ec2] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2896_c40_8ec2_phase <= VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_phase;
     equ2_uxn_opcodes_h_l2896_c40_8ec2_ins <= VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_ins;
     equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output := equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output;
     VAR_neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_08ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue := VAR_equ2_uxn_opcodes_h_l2896_c40_8ec2_return_output;
     -- neq[uxn_opcodes_h_l2897_c40_8885] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2897_c40_8885_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2897_c40_8885_phase <= VAR_neq_uxn_opcodes_h_l2897_c40_8885_phase;
     neq_uxn_opcodes_h_l2897_c40_8885_ins <= VAR_neq_uxn_opcodes_h_l2897_c40_8885_ins;
     neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2897_c40_8885_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2897_c40_8885_return_output := neq_uxn_opcodes_h_l2897_c40_8885_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_8aee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_b876] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output;
     VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_b876_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue := VAR_neq_uxn_opcodes_h_l2897_c40_8885_return_output;
     -- neq2[uxn_opcodes_h_l2898_c40_9d23] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2898_c40_9d23_phase <= VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_phase;
     neq2_uxn_opcodes_h_l2898_c40_9d23_ins <= VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_ins;
     neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_return_output := neq2_uxn_opcodes_h_l2898_c40_9d23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_4517] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_255f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_4517_return_output;
     VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_255f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue := VAR_neq2_uxn_opcodes_h_l2898_c40_9d23_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_8be1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output;

     -- gth[uxn_opcodes_h_l2899_c40_f9c7] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2899_c40_f9c7_phase <= VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_phase;
     gth_uxn_opcodes_h_l2899_c40_f9c7_ins <= VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_ins;
     gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_return_output := gth_uxn_opcodes_h_l2899_c40_f9c7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_6d25] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output;
     VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_6d25_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue := VAR_gth_uxn_opcodes_h_l2899_c40_f9c7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_e863] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output;

     -- gth2[uxn_opcodes_h_l2900_c40_b5e9] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2900_c40_b5e9_phase <= VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_phase;
     gth2_uxn_opcodes_h_l2900_c40_b5e9_ins <= VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_ins;
     gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output := gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_925f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_e863_return_output;
     VAR_lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_925f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue := VAR_gth2_uxn_opcodes_h_l2900_c40_b5e9_return_output;
     -- lth[uxn_opcodes_h_l2901_c40_f86f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2901_c40_f86f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2901_c40_f86f_phase <= VAR_lth_uxn_opcodes_h_l2901_c40_f86f_phase;
     lth_uxn_opcodes_h_l2901_c40_f86f_ins <= VAR_lth_uxn_opcodes_h_l2901_c40_f86f_ins;
     lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2901_c40_f86f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2901_c40_f86f_return_output := lth_uxn_opcodes_h_l2901_c40_f86f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_bf35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_cb28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output;
     VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_bf35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue := VAR_lth_uxn_opcodes_h_l2901_c40_f86f_return_output;
     -- lth2[uxn_opcodes_h_l2902_c40_0a3f] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2902_c40_0a3f_phase <= VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_phase;
     lth2_uxn_opcodes_h_l2902_c40_0a3f_ins <= VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_ins;
     lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output := lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_dc1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_fb82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output;
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_fb82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue := VAR_lth2_uxn_opcodes_h_l2902_c40_0a3f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_2649] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_800d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output;

     -- jmp[uxn_opcodes_h_l2903_c40_5efb] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2903_c40_5efb_phase <= VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_phase;
     jmp_uxn_opcodes_h_l2903_c40_5efb_ins <= VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_ins;
     jmp_uxn_opcodes_h_l2903_c40_5efb_pc <= VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_pc;
     jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_return_output := jmp_uxn_opcodes_h_l2903_c40_5efb_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_800d_return_output;
     VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_2649_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue := VAR_jmp_uxn_opcodes_h_l2903_c40_5efb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_918a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output;

     -- jmp2[uxn_opcodes_h_l2904_c40_4f65] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2904_c40_4f65_phase <= VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_phase;
     jmp2_uxn_opcodes_h_l2904_c40_4f65_ins <= VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_ins;
     jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output := jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_c358] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_918a_return_output;
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_c358_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue := VAR_jmp2_uxn_opcodes_h_l2904_c40_4f65_return_output;
     -- jcn[uxn_opcodes_h_l2905_c40_ebf1] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2905_c40_ebf1_phase <= VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_phase;
     jcn_uxn_opcodes_h_l2905_c40_ebf1_ins <= VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_ins;
     jcn_uxn_opcodes_h_l2905_c40_ebf1_pc <= VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_pc;
     jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output := jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_3483] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_4684] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_4684_return_output;
     VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_3483_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue := VAR_jcn_uxn_opcodes_h_l2905_c40_ebf1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_3ff6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output;

     -- jcn2[uxn_opcodes_h_l2906_c40_d3d8] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase <= VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_phase;
     jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins <= VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_ins;
     jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output := jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_37bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output;
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_3ff6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue := VAR_jcn2_uxn_opcodes_h_l2906_c40_d3d8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_11f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output;

     -- jsr[uxn_opcodes_h_l2907_c40_c807] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2907_c40_c807_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2907_c40_c807_phase <= VAR_jsr_uxn_opcodes_h_l2907_c40_c807_phase;
     jsr_uxn_opcodes_h_l2907_c40_c807_ins <= VAR_jsr_uxn_opcodes_h_l2907_c40_c807_ins;
     jsr_uxn_opcodes_h_l2907_c40_c807_pc <= VAR_jsr_uxn_opcodes_h_l2907_c40_c807_pc;
     jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2907_c40_c807_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2907_c40_c807_return_output := jsr_uxn_opcodes_h_l2907_c40_c807_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f89f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output;
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f89f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue := VAR_jsr_uxn_opcodes_h_l2907_c40_c807_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_a5a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output;

     -- jsr2[uxn_opcodes_h_l2908_c40_ca50] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2908_c40_ca50_phase <= VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_phase;
     jsr2_uxn_opcodes_h_l2908_c40_ca50_ins <= VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_ins;
     jsr2_uxn_opcodes_h_l2908_c40_ca50_pc <= VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_pc;
     jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output := jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_880a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output;
     VAR_sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_880a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue := VAR_jsr2_uxn_opcodes_h_l2908_c40_ca50_return_output;
     -- sth[uxn_opcodes_h_l2909_c40_bc38] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2909_c40_bc38_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2909_c40_bc38_phase <= VAR_sth_uxn_opcodes_h_l2909_c40_bc38_phase;
     sth_uxn_opcodes_h_l2909_c40_bc38_ins <= VAR_sth_uxn_opcodes_h_l2909_c40_bc38_ins;
     sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2909_c40_bc38_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2909_c40_bc38_return_output := sth_uxn_opcodes_h_l2909_c40_bc38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_16f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_2324] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_2324_return_output;
     VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_16f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue := VAR_sth_uxn_opcodes_h_l2909_c40_bc38_return_output;
     -- sth2[uxn_opcodes_h_l2910_c40_1e40] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2910_c40_1e40_phase <= VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_phase;
     sth2_uxn_opcodes_h_l2910_c40_1e40_ins <= VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_ins;
     sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_return_output := sth2_uxn_opcodes_h_l2910_c40_1e40_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_af99] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_4ca5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output;
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_af99_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue := VAR_sth2_uxn_opcodes_h_l2910_c40_1e40_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_0501] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output;

     -- ldz[uxn_opcodes_h_l2911_c40_7127] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2911_c40_7127_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2911_c40_7127_phase <= VAR_ldz_uxn_opcodes_h_l2911_c40_7127_phase;
     ldz_uxn_opcodes_h_l2911_c40_7127_ins <= VAR_ldz_uxn_opcodes_h_l2911_c40_7127_ins;
     ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_stack_read;
     ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2911_c40_7127_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2911_c40_7127_return_output := ldz_uxn_opcodes_h_l2911_c40_7127_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_fbf3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_0501_return_output;
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_fbf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue := VAR_ldz_uxn_opcodes_h_l2911_c40_7127_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_c861] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2f53] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output;

     -- ldz2[uxn_opcodes_h_l2912_c40_7b48] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2912_c40_7b48_phase <= VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_phase;
     ldz2_uxn_opcodes_h_l2912_c40_7b48_ins <= VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_ins;
     ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_stack_read;
     ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output := ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_c861_return_output;
     VAR_stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2f53_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue := VAR_ldz2_uxn_opcodes_h_l2912_c40_7b48_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_77c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output;

     -- stz[uxn_opcodes_h_l2913_c40_4e16] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2913_c40_4e16_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2913_c40_4e16_phase <= VAR_stz_uxn_opcodes_h_l2913_c40_4e16_phase;
     stz_uxn_opcodes_h_l2913_c40_4e16_ins <= VAR_stz_uxn_opcodes_h_l2913_c40_4e16_ins;
     stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2913_c40_4e16_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2913_c40_4e16_return_output := stz_uxn_opcodes_h_l2913_c40_4e16_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_0af3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output;
     VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_0af3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue := VAR_stz_uxn_opcodes_h_l2913_c40_4e16_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_75fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output;

     -- stz2[uxn_opcodes_h_l2914_c40_e2e7] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2914_c40_e2e7_phase <= VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_phase;
     stz2_uxn_opcodes_h_l2914_c40_e2e7_ins <= VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_ins;
     stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output := stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_084e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_084e_return_output;
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_75fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue := VAR_stz2_uxn_opcodes_h_l2914_c40_e2e7_return_output;
     -- ldr[uxn_opcodes_h_l2915_c40_1eb6] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2915_c40_1eb6_phase <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_phase;
     ldr_uxn_opcodes_h_l2915_c40_1eb6_ins <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_ins;
     ldr_uxn_opcodes_h_l2915_c40_1eb6_pc <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_pc;
     ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_stack_read;
     ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output := ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_f137] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_f63c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_f137_return_output;
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_f63c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue := VAR_ldr_uxn_opcodes_h_l2915_c40_1eb6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_6bcc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output;

     -- ldr2[uxn_opcodes_h_l2916_c40_e108] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2916_c40_e108_phase <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_phase;
     ldr2_uxn_opcodes_h_l2916_c40_e108_ins <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_ins;
     ldr2_uxn_opcodes_h_l2916_c40_e108_pc <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_pc;
     ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_stack_read;
     ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_return_output := ldr2_uxn_opcodes_h_l2916_c40_e108_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_b96c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output;
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_b96c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue := VAR_ldr2_uxn_opcodes_h_l2916_c40_e108_return_output;
     -- str1[uxn_opcodes_h_l2917_c40_2738] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2917_c40_2738_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2917_c40_2738_phase <= VAR_str1_uxn_opcodes_h_l2917_c40_2738_phase;
     str1_uxn_opcodes_h_l2917_c40_2738_ins <= VAR_str1_uxn_opcodes_h_l2917_c40_2738_ins;
     str1_uxn_opcodes_h_l2917_c40_2738_pc <= VAR_str1_uxn_opcodes_h_l2917_c40_2738_pc;
     str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2917_c40_2738_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2917_c40_2738_return_output := str1_uxn_opcodes_h_l2917_c40_2738_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_b80c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_e163] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_e163_return_output;
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_b80c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue := VAR_str1_uxn_opcodes_h_l2917_c40_2738_return_output;
     -- str2[uxn_opcodes_h_l2918_c40_9941] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2918_c40_9941_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2918_c40_9941_phase <= VAR_str2_uxn_opcodes_h_l2918_c40_9941_phase;
     str2_uxn_opcodes_h_l2918_c40_9941_ins <= VAR_str2_uxn_opcodes_h_l2918_c40_9941_ins;
     str2_uxn_opcodes_h_l2918_c40_9941_pc <= VAR_str2_uxn_opcodes_h_l2918_c40_9941_pc;
     str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2918_c40_9941_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2918_c40_9941_return_output := str2_uxn_opcodes_h_l2918_c40_9941_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_d45e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_97ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output;
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_97ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue := VAR_str2_uxn_opcodes_h_l2918_c40_9941_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b707] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_00d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output;

     -- lda[uxn_opcodes_h_l2919_c40_1df0] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2919_c40_1df0_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2919_c40_1df0_phase <= VAR_lda_uxn_opcodes_h_l2919_c40_1df0_phase;
     lda_uxn_opcodes_h_l2919_c40_1df0_ins <= VAR_lda_uxn_opcodes_h_l2919_c40_1df0_ins;
     lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_stack_read;
     lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2919_c40_1df0_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2919_c40_1df0_return_output := lda_uxn_opcodes_h_l2919_c40_1df0_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output;
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b707_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue := VAR_lda_uxn_opcodes_h_l2919_c40_1df0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_57fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output;

     -- lda2[uxn_opcodes_h_l2920_c40_2567] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2920_c40_2567_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2920_c40_2567_phase <= VAR_lda2_uxn_opcodes_h_l2920_c40_2567_phase;
     lda2_uxn_opcodes_h_l2920_c40_2567_ins <= VAR_lda2_uxn_opcodes_h_l2920_c40_2567_ins;
     lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_stack_read;
     lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2920_c40_2567_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2920_c40_2567_return_output := lda2_uxn_opcodes_h_l2920_c40_2567_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_c1d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output;
     VAR_sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_c1d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue := VAR_lda2_uxn_opcodes_h_l2920_c40_2567_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_f519] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output;

     -- sta[uxn_opcodes_h_l2921_c40_1389] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2921_c40_1389_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2921_c40_1389_phase <= VAR_sta_uxn_opcodes_h_l2921_c40_1389_phase;
     sta_uxn_opcodes_h_l2921_c40_1389_ins <= VAR_sta_uxn_opcodes_h_l2921_c40_1389_ins;
     sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2921_c40_1389_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2921_c40_1389_return_output := sta_uxn_opcodes_h_l2921_c40_1389_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6e93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_f519_return_output;
     VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6e93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue := VAR_sta_uxn_opcodes_h_l2921_c40_1389_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_752c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output;

     -- sta2[uxn_opcodes_h_l2922_c40_5d90] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2922_c40_5d90_phase <= VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_phase;
     sta2_uxn_opcodes_h_l2922_c40_5d90_ins <= VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_ins;
     sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_return_output := sta2_uxn_opcodes_h_l2922_c40_5d90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_0e51] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_752c_return_output;
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_0e51_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue := VAR_sta2_uxn_opcodes_h_l2922_c40_5d90_return_output;
     -- dei[uxn_opcodes_h_l2923_c40_5ab8] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2923_c40_5ab8_phase <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_phase;
     dei_uxn_opcodes_h_l2923_c40_5ab8_ins <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_ins;
     dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_controller0_buttons;
     dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0 <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr0;
     dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1 <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_stack_ptr1;
     dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_stack_read;
     dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_return_output := dei_uxn_opcodes_h_l2923_c40_5ab8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_8e24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_d9f5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output;
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_8e24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue := VAR_dei_uxn_opcodes_h_l2923_c40_5ab8_return_output;
     -- dei2[uxn_opcodes_h_l2924_c40_9e96] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2924_c40_9e96_phase <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_phase;
     dei2_uxn_opcodes_h_l2924_c40_9e96_ins <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_ins;
     dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_controller0_buttons;
     dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0 <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr0;
     dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1 <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_stack_ptr1;
     dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_stack_read;
     dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_return_output := dei2_uxn_opcodes_h_l2924_c40_9e96_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_8a0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_7103] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_7103_return_output;
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_8a0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue := VAR_dei2_uxn_opcodes_h_l2924_c40_9e96_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_ccc0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_3e40] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output;

     -- deo[uxn_opcodes_h_l2925_c40_cf9f] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2925_c40_cf9f_phase <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_phase;
     deo_uxn_opcodes_h_l2925_c40_cf9f_ins <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_ins;
     deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_stack_read;
     deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_device_ram_read;
     deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_return_output := deo_uxn_opcodes_h_l2925_c40_cf9f_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output;
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_ccc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue := VAR_deo_uxn_opcodes_h_l2925_c40_cf9f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_e957] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_78c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output;

     -- deo2[uxn_opcodes_h_l2926_c40_5956] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2926_c40_5956_phase <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_phase;
     deo2_uxn_opcodes_h_l2926_c40_5956_ins <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_ins;
     deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_stack_read;
     deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2926_c40_5956_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2926_c40_5956_return_output := deo2_uxn_opcodes_h_l2926_c40_5956_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_e957_return_output;
     VAR_add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_78c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue := VAR_deo2_uxn_opcodes_h_l2926_c40_5956_return_output;
     -- add[uxn_opcodes_h_l2927_c40_ea22] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2927_c40_ea22_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2927_c40_ea22_phase <= VAR_add_uxn_opcodes_h_l2927_c40_ea22_phase;
     add_uxn_opcodes_h_l2927_c40_ea22_ins <= VAR_add_uxn_opcodes_h_l2927_c40_ea22_ins;
     add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read <= VAR_add_uxn_opcodes_h_l2927_c40_ea22_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2927_c40_ea22_return_output := add_uxn_opcodes_h_l2927_c40_ea22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_6029] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_26ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output;
     VAR_add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_6029_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue := VAR_add_uxn_opcodes_h_l2927_c40_ea22_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_3a6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output;

     -- add2[uxn_opcodes_h_l2928_c40_711d] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2928_c40_711d_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2928_c40_711d_phase <= VAR_add2_uxn_opcodes_h_l2928_c40_711d_phase;
     add2_uxn_opcodes_h_l2928_c40_711d_ins <= VAR_add2_uxn_opcodes_h_l2928_c40_711d_ins;
     add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2928_c40_711d_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2928_c40_711d_return_output := add2_uxn_opcodes_h_l2928_c40_711d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_b966] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_b966_return_output;
     VAR_sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_3a6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue := VAR_add2_uxn_opcodes_h_l2928_c40_711d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_5b73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_9044] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output;

     -- sub1[uxn_opcodes_h_l2929_c40_3376] LATENCY=0
     -- Clock enable
     sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE <= VAR_sub1_uxn_opcodes_h_l2929_c40_3376_CLOCK_ENABLE;
     -- Inputs
     sub1_uxn_opcodes_h_l2929_c40_3376_phase <= VAR_sub1_uxn_opcodes_h_l2929_c40_3376_phase;
     sub1_uxn_opcodes_h_l2929_c40_3376_ins <= VAR_sub1_uxn_opcodes_h_l2929_c40_3376_ins;
     sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read <= VAR_sub1_uxn_opcodes_h_l2929_c40_3376_previous_stack_read;
     -- Outputs
     VAR_sub1_uxn_opcodes_h_l2929_c40_3376_return_output := sub1_uxn_opcodes_h_l2929_c40_3376_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_9044_return_output;
     VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_5b73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue := VAR_sub1_uxn_opcodes_h_l2929_c40_3376_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_2a0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_950e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output;

     -- sub2[uxn_opcodes_h_l2930_c40_b8ad] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2930_c40_b8ad_phase <= VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_phase;
     sub2_uxn_opcodes_h_l2930_c40_b8ad_ins <= VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_ins;
     sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output := sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_950e_return_output;
     VAR_mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_2a0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue := VAR_sub2_uxn_opcodes_h_l2930_c40_b8ad_return_output;
     -- mul[uxn_opcodes_h_l2931_c40_43e9] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2931_c40_43e9_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2931_c40_43e9_phase <= VAR_mul_uxn_opcodes_h_l2931_c40_43e9_phase;
     mul_uxn_opcodes_h_l2931_c40_43e9_ins <= VAR_mul_uxn_opcodes_h_l2931_c40_43e9_ins;
     mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2931_c40_43e9_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2931_c40_43e9_return_output := mul_uxn_opcodes_h_l2931_c40_43e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_c454] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_10c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output;
     VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_c454_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue := VAR_mul_uxn_opcodes_h_l2931_c40_43e9_return_output;
     -- mul2[uxn_opcodes_h_l2932_c40_54fc] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2932_c40_54fc_phase <= VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_phase;
     mul2_uxn_opcodes_h_l2932_c40_54fc_ins <= VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_ins;
     mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_return_output := mul2_uxn_opcodes_h_l2932_c40_54fc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_2a9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_dbf1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output;
     VAR_div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_2a9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue := VAR_mul2_uxn_opcodes_h_l2932_c40_54fc_return_output;
     -- div[uxn_opcodes_h_l2933_c40_d596] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2933_c40_d596_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2933_c40_d596_phase <= VAR_div_uxn_opcodes_h_l2933_c40_d596_phase;
     div_uxn_opcodes_h_l2933_c40_d596_ins <= VAR_div_uxn_opcodes_h_l2933_c40_d596_ins;
     div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read <= VAR_div_uxn_opcodes_h_l2933_c40_d596_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2933_c40_d596_return_output := div_uxn_opcodes_h_l2933_c40_d596_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_3398] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_36c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output;
     VAR_div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_3398_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue := VAR_div_uxn_opcodes_h_l2933_c40_d596_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_a4e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output;

     -- div2[uxn_opcodes_h_l2934_c40_288e] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2934_c40_288e_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2934_c40_288e_phase <= VAR_div2_uxn_opcodes_h_l2934_c40_288e_phase;
     div2_uxn_opcodes_h_l2934_c40_288e_ins <= VAR_div2_uxn_opcodes_h_l2934_c40_288e_ins;
     div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2934_c40_288e_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2934_c40_288e_return_output := div2_uxn_opcodes_h_l2934_c40_288e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_77b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output;
     VAR_and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_a4e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue := VAR_div2_uxn_opcodes_h_l2934_c40_288e_return_output;
     -- and[uxn_opcodes_h_l2935_c40_c330] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2935_c40_c330_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2935_c40_c330_phase <= VAR_and_uxn_opcodes_h_l2935_c40_c330_phase;
     and_uxn_opcodes_h_l2935_c40_c330_ins <= VAR_and_uxn_opcodes_h_l2935_c40_c330_ins;
     and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read <= VAR_and_uxn_opcodes_h_l2935_c40_c330_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2935_c40_c330_return_output := and_uxn_opcodes_h_l2935_c40_c330_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_5f0a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_63bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output;
     VAR_and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_63bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue := VAR_and_uxn_opcodes_h_l2935_c40_c330_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_1f8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_432d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output;

     -- and2[uxn_opcodes_h_l2936_c40_7d83] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2936_c40_7d83_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2936_c40_7d83_phase <= VAR_and2_uxn_opcodes_h_l2936_c40_7d83_phase;
     and2_uxn_opcodes_h_l2936_c40_7d83_ins <= VAR_and2_uxn_opcodes_h_l2936_c40_7d83_ins;
     and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2936_c40_7d83_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2936_c40_7d83_return_output := and2_uxn_opcodes_h_l2936_c40_7d83_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_432d_return_output;
     VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1f8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue := VAR_and2_uxn_opcodes_h_l2936_c40_7d83_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_7e9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output;

     -- ora[uxn_opcodes_h_l2937_c40_8f8d] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2937_c40_8f8d_phase <= VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_phase;
     ora_uxn_opcodes_h_l2937_c40_8f8d_ins <= VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_ins;
     ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_return_output := ora_uxn_opcodes_h_l2937_c40_8f8d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_643c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output;
     VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_643c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue := VAR_ora_uxn_opcodes_h_l2937_c40_8f8d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_2fe0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_6ea6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output;

     -- ora2[uxn_opcodes_h_l2938_c40_f24f] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2938_c40_f24f_phase <= VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_phase;
     ora2_uxn_opcodes_h_l2938_c40_f24f_ins <= VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_ins;
     ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_return_output := ora2_uxn_opcodes_h_l2938_c40_f24f_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output;
     VAR_eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_2fe0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue := VAR_ora2_uxn_opcodes_h_l2938_c40_f24f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_9fb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output;

     -- eor[uxn_opcodes_h_l2939_c40_7116] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2939_c40_7116_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2939_c40_7116_phase <= VAR_eor_uxn_opcodes_h_l2939_c40_7116_phase;
     eor_uxn_opcodes_h_l2939_c40_7116_ins <= VAR_eor_uxn_opcodes_h_l2939_c40_7116_ins;
     eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2939_c40_7116_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2939_c40_7116_return_output := eor_uxn_opcodes_h_l2939_c40_7116_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_abef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_abef_return_output;
     VAR_eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_9fb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue := VAR_eor_uxn_opcodes_h_l2939_c40_7116_return_output;
     -- eor2[uxn_opcodes_h_l2940_c40_3762] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2940_c40_3762_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2940_c40_3762_phase <= VAR_eor2_uxn_opcodes_h_l2940_c40_3762_phase;
     eor2_uxn_opcodes_h_l2940_c40_3762_ins <= VAR_eor2_uxn_opcodes_h_l2940_c40_3762_ins;
     eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2940_c40_3762_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2940_c40_3762_return_output := eor2_uxn_opcodes_h_l2940_c40_3762_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_7dac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_96d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output;
     VAR_sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_96d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue := VAR_eor2_uxn_opcodes_h_l2940_c40_3762_return_output;
     -- sft[uxn_opcodes_h_l2941_c40_36e1] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2941_c40_36e1_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2941_c40_36e1_phase <= VAR_sft_uxn_opcodes_h_l2941_c40_36e1_phase;
     sft_uxn_opcodes_h_l2941_c40_36e1_ins <= VAR_sft_uxn_opcodes_h_l2941_c40_36e1_ins;
     sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2941_c40_36e1_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2941_c40_36e1_return_output := sft_uxn_opcodes_h_l2941_c40_36e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_5209] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_5209_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue := VAR_sft_uxn_opcodes_h_l2941_c40_36e1_return_output;
     -- sft2[uxn_opcodes_h_l2942_c40_93c0] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2942_c40_93c0_phase <= VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_phase;
     sft2_uxn_opcodes_h_l2942_c40_93c0_ins <= VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_ins;
     sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_return_output := sft2_uxn_opcodes_h_l2942_c40_93c0_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue := VAR_sft2_uxn_opcodes_h_l2942_c40_93c0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_7dac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_7dac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_abef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_abef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_6ea6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_6ea6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_7e9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_7e9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_432d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_432d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_5f0a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_5f0a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_77b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_77b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_36c4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_36c4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_dbf1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_dbf1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_10c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_10c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_950e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_950e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_9044] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_9044_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_b966] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_b966_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_26ab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_26ab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_e957] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_e957_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_3e40] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_3e40_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_7103] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_7103_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_d9f5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_d9f5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_752c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_752c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_f519] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_f519_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_57fb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_57fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_00d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_00d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_d45e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_d45e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_e163] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_e163_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_6bcc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_6bcc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_f137] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_f137_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_084e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_084e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_77c0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_77c0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_c861] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_c861_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_0501] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_0501_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_4ca5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_4ca5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_2324] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_2324_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_a5a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_a5a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_11f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_11f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_37bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_37bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_4684] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_4684_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_918a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_918a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_800d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_800d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_dc1e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_dc1e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_cb28] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_cb28_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_e863] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_e863_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_8be1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_8be1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_4517] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_4517_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_8aee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_8aee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_6c79] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6c79_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_6fb0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_6fb0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_94eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_94eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_baa3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_baa3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_e9d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_e9d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_16f7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_16f7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_bfef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_bfef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_3a46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_3a46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_c45b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c45b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_a979] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_a979_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_3e96] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_3e96_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_253c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_253c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_3ef3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_3ef3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_6046] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_6046_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_e7f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_e7f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_876c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_876c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_08bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_08bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_25b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_25b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_7099] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_7099_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_fa94] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_fa94_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_6e11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_6e11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_8bee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_8bee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_aa9a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_aa9a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_e3a4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_e3a4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_eb0a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_eb0a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c2_e5fa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2968_c34_20bd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_20bd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2971_c32_1da5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_1da5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2966_c30_0a90] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_0a90_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_7af9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_7af9_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2965_c34_157b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_157b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2964_c40_4779] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_4779_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_0bb0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_0bb0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2945_c17_0a31] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_0a31_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2959_c3_a57a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_a57a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2969_c37_7a2d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_7a2d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.vram_write_layer;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2953_c68_aedc] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_aedc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2963_c39_4a64] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_4a64_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2967_c33_c8ec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_c8ec_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output.is_ram_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2945_c17_0a31_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2959_c3_a57a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_0bb0_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2945_c2_19c1] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_left;
     BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output := BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2953_c58_58c9] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_58c9_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2953_c68_aedc_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2950_DUPLICATE_29e4 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2950_DUPLICATE_29e4_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2948_l2950_DUPLICATE_7af9_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_9100 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_9100_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2873_c2_e5fa_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2963_c39_4a64_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2964_c40_4779_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2965_c34_157b_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2966_c30_0a90_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2967_c33_c8ec_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2968_c34_20bd_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2969_c37_7a2d_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2970_l2958_DUPLICATE_0bb0_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2971_c32_1da5_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;
     VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2945_c2_19c1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2950_DUPLICATE_29e4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2950_DUPLICATE_29e4_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c58_58c9_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_9100_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2849_l2973_DUPLICATE_9100_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2950_c3_9471] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_94c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output;

     -- MUX[uxn_opcodes_h_l2954_c20_4e8b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2954_c20_4e8b_cond <= VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_cond;
     MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue <= VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iftrue;
     MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse <= VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output := MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2948_c3_8ead := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_94c5_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2950_c3_511b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2950_c3_9471_return_output)),8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right := VAR_MUX_uxn_opcodes_h_l2954_c20_4e8b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse := VAR_sp0_uxn_opcodes_h_l2950_c3_511b;
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue := VAR_sp1_uxn_opcodes_h_l2948_c3_8ead;
     -- sp1_MUX[uxn_opcodes_h_l2947_c2_1689] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_cond;
     sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue;
     sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output := sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2947_c2_1689] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_cond;
     sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iftrue;
     sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output := sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;
     VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2947_c2_1689_return_output;
     -- MUX[uxn_opcodes_h_l2953_c29_83c2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2953_c29_83c2_cond <= VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_cond;
     MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue <= VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iftrue;
     MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse <= VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_return_output := MUX_uxn_opcodes_h_l2953_c29_83c2_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2953_c19_6ed2] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_6ed2_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2953_c29_83c2_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2953_c19_6ed2_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2953_c19_f6cb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output;

     -- Submodule level 156
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2953_c19_f6cb_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2954_c2_b0b4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_left;
     BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output := BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output;

     -- Submodule level 157
     REG_VAR_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address := VAR_BIN_OP_OR_uxn_opcodes_h_l2954_c2_b0b4_return_output;
     -- stack_ram_update[uxn_opcodes_h_l2956_c24_64fd] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_stack_address;
     stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_value;
     stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output := stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2956_c24_64fd_return_output;
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
